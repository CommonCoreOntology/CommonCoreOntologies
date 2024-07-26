# Qudt transformed for CCO

The QUDT-based UnitsOfMeasureOntology is a transformation of the
original QUDT ontology. My source was a version Dave Lutz cleaned up to
be conformant to OWL-DL

## Documentation of the transformation

The transformation is a script (in lisp, but easily ported to python) that makes two queries, one to get the quantitykind hierarchy and one to get the information for each unit. The new ontology is built up using the OWLAPI but could be accomplished with SPARQL CONSTRUCT, I believe.

- quantity kinds, instances in QUDT are turned into classes with label prefix "Measurement Unit of". They are given new IRIs in the CCO space, but a reasonable choice would be to keep the QUDT URLs and just pun. Currently their QUDT IRI is the value rdfs:isDefinedBy.
- skos:broader relationships between quantity kinds are turned into subclass relationships
- Units are made instances of those classes based on the qudt property quantityKind
- QUDT unit IRIs are kept the same 
- Only SI units and US Customary Units (as defined by QUDT) are included. The annotations saying which system a unit is applicable to is retained.
- Only english labels are included
- data properties abbreviation, symbol, ucumCode are turned into annotation properties subproperty of skos:altLabel
- data property dbPedia match is turned in annotation property subproperty of rdfs:seeAlso
- license is an ontology annotation dc:rights
- dcterms:description value is moved to skos:definition 
- The informativeReference value is moved to rdfs:seeAlso

## Mapping

The file measurement-units-cco-mapping.csv is the beginning of a mapping
of the original CCO terms. Terms are hand matched as labels may be
different. There may be ambiguites that need to be resolved, for
instance which of the two calorie units in QUDT map to the CCO calorie
term.

## SPARQL Queries

Query to retrieve quantity kind hierarchy

```sparql
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT ?qkind ?label ?def ?broader
WHERE { 
   ?qkind rdf:type <http://qudt.org/schema/qudt/QuantityKind> . 
   ?qkind rdfs:label ?label . 
   OPTIONAL { 
   ?qkind dcterms:description ?def . }.
   OPTIONAL { 
      ?qkind skos:broader ?broader . }.
   FILTER (lang(?label) = "en")} 
```

Query to retrieve unit information

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dcterms: <http://purl.org/dc/terms/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
SELECT ?unit ?def ?label ?by ?ref ?system ?dbpedia ?abbrev ?symbol ?ucum
WHERE { 
  ?qkind rdf:type <http://qudt.org/schema/qudt/QuantityKind> . 
  ?qkind <http://qudt.org/schema/qudt/applicableUnit> ?unit . 
  ?unit <http://qudt.org/schema/qudt/applicableSystem> ?system . 
  OPTIONAL { 
    ?unit dcterms:description ?def . }.
  ?unit rdfs:label ?label . 
  OPTIONAL { 
    ?unit rdfs:isDefinedBy ?by . }.
  OPTIONAL { 
    ?unit <http://qudt.org/schema/qudt/informativeReference> ?ref . }.
  OPTIONAL { 
    ?unit <http://qudt.org/schema/qudt/dbpediaMatch> ?dbpedia . }.
  OPTIONAL { 
    ?unit <http://qudt.org/schema/qudt/abbreviation> ?abbrev . }.
  OPTIONAL { 
    ?unit <http://qudt.org/schema/qudt/symbol> ?symbol . }.
  OPTIONAL { 
    ?unit <http://qudt.org/schema/qudt/ucumCode> ?ucum . }.
  FILTER (lang(?label) = "en")
  FILTER ((?system =  <http://qudt.org/vocab/sou/SI> ) || (?system =  <http://qudt.org/vocab/sou/USCS> ))}
```


Alan Ruttenberg
2024-07-26
