# Ontology comparison

## Left
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ArtifactOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-09-26/ArtifactOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/ArtifactOntology.ttl`

## Right
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ArtifactOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-09-26/ArtifactOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/new/ArtifactOntology.ttl`

### Ontology imports 



### Ontology annotations 



### Filter `http://www.ontologyrepository.com/CommonCoreOntologies/Filter`
#### Removed
- [Filter](http://www.ontologyrepository.com/CommonCoreOntologies/Filter) [comment](http://www.w3.org/2000/01/rdf-schema#comment) "Although its basic function remains the same, a Filter can be used in 2 different ways:
(1) to allow only the desired entities to pass through (e.g. removing dirt from engine oil); or
(2) to allow everything except the desired entities to pass through (e.g. panning for gold)."@en 

- [Filter](http://www.ontologyrepository.com/CommonCoreOntologies/Filter) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Material Artifact that is designed to restrict access to the system it is part of by separating the entities that enter the Filter and only allowing entities of the specified type or with the specified properties to pass through."@en 

#### Added
- [Filter](http://www.ontologyrepository.com/CommonCoreOntologies/Filter) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Material Artifact that bears a Filter Function."@en 

- [Filter](http://www.ontologyrepository.com/CommonCoreOntologies/Filter) EquivalentTo [Material Artifact](http://www.ontologyrepository.com/CommonCoreOntologies/Artifact) and ([bearer of](http://purl.obolibrary.org/obo/BFO_0000196) some [Filter Function](http://www.ontologyrepository.com/CommonCoreOntologies/FilterFunction)) 


### Filter Function `http://www.ontologyrepository.com/CommonCoreOntologies/FilterFunction`

#### Added
- [Filter Function](http://www.ontologyrepository.com/CommonCoreOntologies/FilterFunction) [is curated in ontology](http://www.ontologyrepository.com/CommonCoreOntologies/is_curated_in_ontology) "http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ArtifactOntology"^^[anyURI](http://www.w3.org/2001/XMLSchema#anyURI) 

- [Filter Function](http://www.ontologyrepository.com/CommonCoreOntologies/FilterFunction) [label](http://www.w3.org/2000/01/rdf-schema#label) "Filter Function"@en 

- [Filter Function](http://www.ontologyrepository.com/CommonCoreOntologies/FilterFunction) [comment](http://www.w3.org/2000/01/rdf-schema#comment) "Although its basic function remains the same, a Filter can be used in 2 different ways:
(1) to allow only the desired entities to pass through (e.g. removing dirt from engine oil); or
(2) to allow everything except the desired entities to pass through (e.g. panning for gold)."@en 

- [Filter Function](http://www.ontologyrepository.com/CommonCoreOntologies/FilterFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Artifact Function that is realized in a process where entities of a specific type or which have specified properties enter it or pass through it."@en 

- Class: [Filter Function](http://www.ontologyrepository.com/CommonCoreOntologies/FilterFunction) 

- [Filter Function](http://www.ontologyrepository.com/CommonCoreOntologies/FilterFunction) SubClassOf [Artifact Function](http://www.ontologyrepository.com/CommonCoreOntologies/ArtifactFunction) 


### Filtration Artifact Function `http://www.ontologyrepository.com/CommonCoreOntologies/FiltrationArtifactFunction`
#### Removed
- [Filtration Artifact Function](http://www.ontologyrepository.com/CommonCoreOntologies/FiltrationArtifactFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Artifact Function that is realized in a process in which some solid entity is prevented from moving along with some quantity of liquid."@en 

- [Filtration Artifact Function](http://www.ontologyrepository.com/CommonCoreOntologies/FiltrationArtifactFunction) SubClassOf [Artifact Function](http://www.ontologyrepository.com/CommonCoreOntologies/ArtifactFunction) 

#### Added
- [Filtration Artifact Function](http://www.ontologyrepository.com/CommonCoreOntologies/FiltrationArtifactFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Filter Function that is realized in a process in which some solid entity is prevented from moving along with some quantity of liquid."@en 

- [Filtration Artifact Function](http://www.ontologyrepository.com/CommonCoreOntologies/FiltrationArtifactFunction) SubClassOf [Filter Function](http://www.ontologyrepository.com/CommonCoreOntologies/FilterFunction) 


### IAO_0000116 `http://purl.obolibrary.org/obo/IAO_0000116`
#### Removed
- AnnotationProperty: [IAO_0000116](http://purl.obolibrary.org/obo/IAO_0000116) 



### Telecommunication Network `http://www.ontologyrepository.com/CommonCoreOntologies/TelecommunicationNetwork`
#### Removed
- [Telecommunication Network](http://www.ontologyrepository.com/CommonCoreOntologies/TelecommunicationNetwork) [IAO_0000116](http://purl.obolibrary.org/obo/IAO_0000116) "How is this diff from Comm system?"@en 

