#!/usr/bin/env python3
"""
mro_postprocess.py — Post-process the ROBOT-renamed MRO Turtle file.

Steps performed (matches build-mro pipeline Steps 5a–5d):

  5a. Fix cco:ont00001760 (is curated in ontology) — replace all existing values
      (whether IRI or xsd:anyURI literal) with the MRO ontology IRI.

  5b. Add the mro:mro00000001 root ObjectProperty declaration with its label
      and curated-in annotation (if it is not already present).

  5c. Wire every top-level ObjectProperty (no rdfs:subPropertyOf asserted) as a
      subPropertyOf mro:mro00000001.  DatatypeProperties are left as-is.

  5d. Remove all existing owl:Ontology declarations and insert the canonical
      MRO header with the supplied VERSION and DATE.

Usage:
    python3 scripts/mro_postprocess.py \\
        --input  build/artifacts/mro-renamed.ttl \\
        --output build/artifacts/mro-final.ttl \\
        --version 2.1 \\
        --date   2026-04-15
"""

import argparse
from rdflib import Graph, URIRef, Literal, Namespace
from rdflib.namespace import RDF, RDFS, OWL, XSD

# ── Namespaces ────────────────────────────────────────────────────────────────
CCO  = Namespace("https://www.commoncoreontologies.org/")
MRO  = Namespace("https://www.commoncoreontologies.org/mro/")
OBO  = Namespace("http://purl.obolibrary.org/obo/")
SKOS = Namespace("http://www.w3.org/2004/02/skos/core#")
DCT  = Namespace("http://purl.org/dc/terms/")
DC   = Namespace("http://purl.org/dc/elements/1.1/")

# ── Well-known IRIs ───────────────────────────────────────────────────────────
MRO_ONTOLOGY_IRI = URIRef("https://www.commoncoreontologies.org/ModalRelationOntology")
CURATED_IN       = CCO["ont00001760"]   # is curated in ontology
MRO_ROOT         = MRO["mro00000001"]   # Modal Object Property (root)


# ── Pre-step A: remove stray third-party properties ──────────────────────────
MRO_NS  = "https://www.commoncoreontologies.org/mro/"

def remove_non_mro_properties(g: Graph) -> None:
    """Remove any OP/DP whose IRI does not start with the MRO namespace.

    The extraction step (mro_extract.py) includes ALL OPs and DPs from the
    merged ontology, some of which (e.g. geo:asWKT from GeoSPARQL) are
    third-party properties pulled in via domain/range axioms. These have no
    place in MRO and must be stripped before further processing.
    """
    for prop_type in (OWL.ObjectProperty, OWL.DatatypeProperty):
        for s in list(g.subjects(RDF.type, prop_type)):
            if not str(s).startswith(MRO_NS):
                for p, o in list(g.predicate_objects(s)):
                    g.remove((s, p, o))
                g.remove((s, RDF.type, prop_type))


# ── Pre-step B: remove spurious DatatypeProperty dual-typing ─────────────────
def remove_dual_typed_dp(g: Graph) -> None:
    """Remove rdf:type owl:DatatypeProperty from IRIs also typed as ObjectProperty.

    ROBOT rename, via OWLAPI, sometimes generates ghost DatatypeProperty
    declarations for ObjectProperties whose rdfs:range coincides with the
    rdfs:domain class of an actual DatatypeProperty in the same ontology.
    These phantom DP declarations must be stripped before further processing.
    """
    for s in list(g.subjects(RDF.type, OWL.DatatypeProperty)):
        if (s, RDF.type, OWL.ObjectProperty) in g:
            g.remove((s, RDF.type, OWL.DatatypeProperty))


# ── Pre-step D: strip leading/trailing whitespace from string literals ────────
def strip_annotation_whitespace(g: Graph) -> None:
    """Strip leading/trailing whitespace from all string annotation literals.

    Source modules occasionally have trailing spaces in definitions or labels
    (e.g. mro:ont00001815). These trigger the annotation_whitespace QC query.
    """
    for s, p, o in list(g):
        if isinstance(o, Literal) and o.datatype is None:
            stripped = str(o).strip()
            if stripped != str(o):
                g.remove((s, p, o))
                g.add((s, p, Literal(stripped, lang=o.language) if o.language
                       else Literal(stripped)))


# ── Step 5a ───────────────────────────────────────────────────────────────────
def fix_curated_in(g: Graph) -> None:
    """Ensure every OP and DP has exactly one curated-in pointing to MRO.

    Source modules each set curated-in to their own ontology IRI. After the
    rename step these values are stale (still pointing to AgentOntology,
    ArtifactOntology, etc.). This function removes all existing curated-in
    triples and re-adds the correct MRO ontology IRI for every property.
    """
    # Remove any stale curated-in triples that survived (edge case)
    for s, _, o in list(g.triples((None, CURATED_IN, None))):
        g.remove((s, CURATED_IN, o))
    # Add the correct MRO curated-in to every OP and DP
    for prop_type in (OWL.ObjectProperty, OWL.DatatypeProperty):
        for s in g.subjects(RDF.type, prop_type):
            g.add((s, CURATED_IN, MRO_ONTOLOGY_IRI))


# ── Pre-step C: declare external classes used in domain/range ────────────────
def declare_domain_range_classes(g: Graph) -> None:
    """Add owl:Class declarations for every external class referenced in
    rdfs:domain or rdfs:range of any property in the graph.

    Without explicit declarations, the OWL API treats undeclared IRIs in
    domain/range as ambiguous (class vs. datatype), which causes DL punning
    violations for properties whose range coincides with another property's
    domain. The old hand-built MRO had explicit cco:ont00000253 a owl:Class
    declarations for exactly this reason.
    """
    XSD_NS = "http://www.w3.org/2001/XMLSchema#"
    for pred in (RDFS.domain, RDFS.range):
        for s, _, o in g.triples((None, pred, None)):
            if not isinstance(o, URIRef):
                continue
            o_str = str(o)
            # Skip XSD datatypes — they are not owl:Class
            if o_str.startswith(XSD_NS):
                continue
            # Skip OWL/RDF/RDFS built-ins
            if any(o_str.startswith(ns) for ns in (
                "http://www.w3.org/2002/07/owl#",
                "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
                "http://www.w3.org/2000/01/rdf-schema#",
            )):
                continue
            # Skip blank nodes already handled above
            if (o, RDF.type, OWL.Class) not in g:
                g.add((o, RDF.type, OWL.Class))


# ── Step 5b ───────────────────────────────────────────────────────────────────
def add_root_property(g: Graph) -> None:
    """Add mro:mro00000001 'Modal Object Property' if not already present."""
    if (MRO_ROOT, RDF.type, OWL.ObjectProperty) not in g:
        g.add((MRO_ROOT, RDF.type,    OWL.ObjectProperty))
        g.add((MRO_ROOT, RDFS.label,  Literal("Modal Object Property", lang="en")))
        g.add((MRO_ROOT, CURATED_IN,  MRO_ONTOLOGY_IRI))


# ── Step 5c ───────────────────────────────────────────────────────────────────
def wire_orphans(g: Graph) -> None:
    """Make every parentless ObjectProperty a subPropertyOf mro:mro00000001."""
    for s in list(g.subjects(RDF.type, OWL.ObjectProperty)):
        if s == MRO_ROOT:
            continue
        if not list(g.objects(s, RDFS.subPropertyOf)):
            g.add((s, RDFS.subPropertyOf, MRO_ROOT))


# ── Step 5d ───────────────────────────────────────────────────────────────────
def replace_header(g: Graph, version: str, date: str) -> None:
    """Remove all owl:Ontology nodes and insert the canonical MRO header."""
    for s in list(g.subjects(RDF.type, OWL.Ontology)):
        for p, o in list(g.predicate_objects(s)):
            g.remove((s, p, o))
        g.remove((s, RDF.type, OWL.Ontology))

    version_iri = URIRef(
        f"https://www.commoncoreontologies.org/{date}/ModalRelationOntology"
    )
    g.add((MRO_ONTOLOGY_IRI, RDF.type,       OWL.Ontology))
    g.add((MRO_ONTOLOGY_IRI, OWL.versionIRI, version_iri))
    g.add((MRO_ONTOLOGY_IRI, DCT.license,
           Literal("BSD 3-Clause: https://github.com/CommonCoreOntology/"
                   "CommonCoreOntologies/blob/master/LICENSE", lang="en")))
    g.add((MRO_ONTOLOGY_IRI, DCT.rights,
           Literal("CUBRC Inc., see full license.", lang="en")))
    g.add((MRO_ONTOLOGY_IRI, RDFS.comment,
           Literal("The modal counterparts to the object and data properties "
                   "contained in CCO and BFO2020-core.")))
    g.add((MRO_ONTOLOGY_IRI, RDFS.label,
           Literal("Modal Relation Ontology")))
    g.add((MRO_ONTOLOGY_IRI, OWL.versionInfo,
           Literal(f"v{version}")))
    # Declare header annotation properties so OWL 2 DL validators don't flag them
    for ap in (DCT.license, DCT.rights):
        if (ap, RDF.type, OWL.AnnotationProperty) not in g:
            g.add((ap, RDF.type, OWL.AnnotationProperty))


# ── Main ──────────────────────────────────────────────────────────────────────
def main() -> None:
    parser = argparse.ArgumentParser(
        description="Post-process the ROBOT-renamed MRO Turtle file."
    )
    parser.add_argument("--input",   required=True, help="Path to mro-renamed.ttl")
    parser.add_argument("--output",  required=True, help="Path to write mro-final.ttl")
    parser.add_argument("--version", required=True, help="Version string, e.g. 2.1")
    parser.add_argument("--date",    required=True, help="Release date YYYY-MM-DD")
    args = parser.parse_args()

    g = Graph()
    g.parse(args.input, format="turtle")

    remove_non_mro_properties(g)
    remove_dual_typed_dp(g)
    declare_domain_range_classes(g)
    strip_annotation_whitespace(g)
    fix_curated_in(g)
    add_root_property(g)
    wire_orphans(g)
    replace_header(g, args.version, args.date)

    # Bind prefixes for human-readable Turtle output
    g.bind("",    MRO)
    g.bind("cco", CCO)
    g.bind("mro", MRO)
    g.bind("obo", OBO)
    g.bind("skos", SKOS)
    g.bind("owl", OWL)
    g.bind("rdf", RDF)
    g.bind("rdfs", RDFS)
    g.bind("xsd", XSD)
    g.bind("dct", DCT)
    g.bind("dc",  DC)

    g.serialize(destination=args.output, format="turtle")
    print(f"mro_postprocess: written to {args.output}")


if __name__ == "__main__":
    main()
