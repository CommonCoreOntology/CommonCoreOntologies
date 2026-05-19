#!/usr/bin/env python3
"""
mro_extract.py — Step 2 of the MRO build pipeline.

Extracts all owl:ObjectProperty and owl:DatatypeProperty individuals from the
merged CCO+BFO file, together with ALL their triples:

  - Structural axioms: rdfs:subPropertyOf, owl:inverseOf, property characteristics
  - Annotations:      rdfs:label, skos:definition, skos:altLabel, skos:example,
                      skos:scopeNote, skos:editorialNote, dc:identifier, etc.
  - Axioms:           rdfs:domain, rdfs:range (including complex blank-node
                      class expressions such as owl:unionOf, owl:intersectionOf)

Also includes rdf:type owl:AnnotationProperty declarations for every annotation
predicate used on the extracted properties, matching the structure of the
hand-built ModalRelationOntology.ttl.

This replaces the `robot filter --select "object-properties data-properties"`
step which strips annotation assertions even with --axioms all.

Usage:
    python3 scripts/mro_extract.py \\
        --input  build/artifacts/mro-merged.ttl \\
        --output build/artifacts/mro-filtered.ttl
"""

import argparse
from rdflib import Graph, BNode, RDF, OWL


def extract(merged_path: str, output_path: str) -> None:
    src = Graph()
    src.parse(merged_path, format="turtle")

    out = Graph()
    for prefix, ns in src.namespaces():
        out.bind(prefix, ns)

    # ── Collect every OP and DP subject ──────────────────────────────────────
    prop_types = {OWL.ObjectProperty, OWL.DatatypeProperty}
    subjects = {s for s, _, t in src.triples((None, RDF.type, None)) if t in prop_types}

    # ── Recursively copy blank-node sub-graphs ────────────────────────────────
    # Needed for complex domain/range class expressions:
    #   e.g. rdfs:domain [ owl:unionOf ( obo:BFO_0000020 obo:BFO_0000031 ... ) ]
    visited_bnodes: set = set()

    def copy_bnode(node: BNode) -> None:
        if node in visited_bnodes:
            return
        visited_bnodes.add(node)
        for p, o in src.predicate_objects(node):
            out.add((node, p, o))
            if isinstance(o, BNode):
                copy_bnode(o)

    # ── Copy all triples for each extracted property ──────────────────────────
    for s in subjects:
        for p, o in src.predicate_objects(s):
            out.add((s, p, o))
            if isinstance(o, BNode):
                copy_bnode(o)

    # ── Add annotation property declarations for predicates in use ───────────
    # The hand-built MRO declares every annotation property it uses
    # (dc:identifier, skos:definition, skos:altLabel, etc.) so that OWL tools
    # treat them properly rather than as bare URI predicates.
    used_predicates = {p for _, p, _ in out}
    for p in used_predicates:
        if (p, RDF.type, OWL.AnnotationProperty) in src:
            out.add((p, RDF.type, OWL.AnnotationProperty))

    out.serialize(destination=output_path, format="turtle")
    print(f"mro_extract: wrote {len(subjects)} properties to {output_path}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Extract OPs and DPs with all annotations from merged CCO+BFO."
    )
    parser.add_argument("--input",  required=True, help="Path to mro-merged.ttl")
    parser.add_argument("--output", required=True, help="Path to write mro-filtered.ttl")
    args = parser.parse_args()
    extract(args.input, args.output)


if __name__ == "__main__":
    main()
