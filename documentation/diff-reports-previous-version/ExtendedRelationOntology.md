# Ontology comparison

## Left
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ExtendedRelationOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-02-14/ExtendedRelationOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/old/ExtendedRelationOntology.ttl`

## Right
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ExtendedRelationOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-02-14/ExtendedRelationOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/ExtendedRelationOntology.ttl`

### Ontology imports 



### Ontology annotations 
#### Removed
- [license](http://purl.org/dc/terms/license) [BSD-3-Clause](https://opensource.org/licenses/BSD-3-Clause) 

#### Added
- [license](http://purl.org/dc/terms/license) "BSD 3-Clause: https://github.com/CommonCoreOntology/CommonCoreOntologies/blob/master/LICENSE"@en 

- [rights](http://purl.org/dc/terms/rights) "CUBRC Inc., see full license."@en 


### acronym `http://www.ontologyrepository.com/CommonCoreOntologies/acronym`
#### Removed
- [acronym](http://www.ontologyrepository.com/CommonCoreOntologies/acronym) SubPropertyOf: [alternative label](http://www.ontologyrepository.com/CommonCoreOntologies/alternative_label) 

#### Added
- [acronym](http://www.ontologyrepository.com/CommonCoreOntologies/acronym) SubPropertyOf: [altLabel](http://www.w3.org/2004/02/skos/core#altLabel) 


### affects `http://www.ontologyrepository.com/CommonCoreOntologies/affects`
#### Removed
- [affects](http://www.ontologyrepository.com/CommonCoreOntologies/affects) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "p affects c iff p is an instance of a Process and c is an instance of a Continuant, such that p influences c in some manner, most often by producing a change in c."@en 

#### Added
- [affects](http://www.ontologyrepository.com/CommonCoreOntologies/affects) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x affects y iff x is an instance of Process and y is an instance of Continuant, and x influences y in some manner, most often by producing a change in y."@en 


### caused by `http://www.ontologyrepository.com/CommonCoreOntologies/caused_by`
#### Removed
- [caused by](http://www.ontologyrepository.com/CommonCoreOntologies/caused_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x caused_by y iff x and y are instances of occurrents, and x is a consequence of y."@en 

#### Added
- [caused by](http://www.ontologyrepository.com/CommonCoreOntologies/caused_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x caused_by y iff x and y are instances of Occurrent, and x is a consequence of y."@en 


### disposition of aggregate `http://www.ontologyrepository.com/CommonCoreOntologies/disposition_of_aggregate`
#### Removed
- [disposition of aggregate](http://www.ontologyrepository.com/CommonCoreOntologies/disposition_of_aggregate) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x disposition_of_aggregate y iff y is an instance of Object Aggregate and x is an instance of Disposition, such that x disposition_of_aggregate y."@en 

#### Added
- [disposition of aggregate](http://www.ontologyrepository.com/CommonCoreOntologies/disposition_of_aggregate) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x disposition_of_aggregate y iff y is an instance of Object Aggregate and x is an instance of Disposition, and x inheres_in_aggregate y."@en 


### disrupts `http://www.ontologyrepository.com/CommonCoreOntologies/disrupts`
#### Removed
- [disrupts](http://www.ontologyrepository.com/CommonCoreOntologies/disrupts) [is curated in ontology](http://www.ontologyrepository.com/CommonCoreOntologies/is_curated_in_ontology) "http://www.ontologyrepository.com/CommonCoreOntologies/Mid/AgentOntology"^^[anyURI](http://www.w3.org/2001/XMLSchema#anyURI) 

#### Added
- [disrupts](http://www.ontologyrepository.com/CommonCoreOntologies/disrupts) [is curated in ontology](http://www.ontologyrepository.com/CommonCoreOntologies/is_curated_in_ontology) "http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ExtendedRelationOntology"^^[anyURI](http://www.w3.org/2001/XMLSchema#anyURI) 


### has member of located in `http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in`
#### Removed
- [has member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An instance of an Object Aggregate 'has member of located in' an instance of some material entity if and only if every member of that Aggregate is located in the same instance of that material entity."@en 

- [has member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) [label](http://www.w3.org/2000/01/rdf-schema#label) "has member of located in"@en 

#### Added
- [has member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) [label](http://www.w3.org/2000/01/rdf-schema#label) "has all members of located in"@en 

- [has member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x has all members of located in y iff x is an instance of Object Aggregate and y is an instance of Material Entity, and every member of x is located in y."@en 

- [has member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) SubPropertyOf: [has some member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) 


### has object `http://www.ontologyrepository.com/CommonCoreOntologies/has_object`
#### Removed
- [has object](http://www.ontologyrepository.com/CommonCoreOntologies/has_object) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "If p is a process and c is a continuant, then p has object c if and only if the c is part of the projected state that the agent intends to achieve by performing p."@en 

#### Added
- [has object](http://www.ontologyrepository.com/CommonCoreOntologies/has_object) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "If p is a process and c is a continuant, then p has object c if and only if p is performed by an agent and c is part of the projected state that agent intends to achieve by performing p."@en 


### has some member of located in `http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in`

#### Added
- [has some member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x has member of located in y iff x is an instance of Object Aggregate and y is an instance of Material Entity, and at least one member of x is located in y."@en 

- [has some member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) [label](http://www.w3.org/2000/01/rdf-schema#label) "has some member of located in"@en 

- [has some member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) [is curated in ontology](http://www.ontologyrepository.com/CommonCoreOntologies/is_curated_in_ontology) "http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ExtendedRelationOntology"^^[anyURI](http://www.w3.org/2001/XMLSchema#anyURI) 

- ObjectProperty: [has some member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) 

- [has some member of located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) SubPropertyOf: [topObjectProperty](http://www.w3.org/2002/07/owl#topObjectProperty) 


### inhibited by `http://www.ontologyrepository.com/CommonCoreOntologies/inhibited_by`

#### Added
- [inhibited by](http://www.ontologyrepository.com/CommonCoreOntologies/inhibited_by) [is curated in ontology](http://www.ontologyrepository.com/CommonCoreOntologies/is_curated_in_ontology) "http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ExtendedRelationOntology"^^[anyURI](http://www.w3.org/2001/XMLSchema#anyURI) 

- [inhibited by](http://www.ontologyrepository.com/CommonCoreOntologies/inhibited_by) [label](http://www.w3.org/2000/01/rdf-schema#label) "inhibited by"@en 

- [inhibited by](http://www.ontologyrepository.com/CommonCoreOntologies/inhibited_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "y inhibited_by x iff x and y are non-identical Processes, d is a Decrease of Realizable Entity, and x is_cause_of d, and r is a Realizable Entity, and d has_participant r, and r realized_in y."@en 

- ObjectProperty: [inhibited by](http://www.ontologyrepository.com/CommonCoreOntologies/inhibited_by) 

- [inhibited by](http://www.ontologyrepository.com/CommonCoreOntologies/inhibited_by) InverseOf [inhibits](http://www.ontologyrepository.com/CommonCoreOntologies/inhibits) 

- [inhibited by](http://www.ontologyrepository.com/CommonCoreOntologies/inhibited_by) Domain [process](http://purl.obolibrary.org/obo/BFO_0000015) 

- [inhibited by](http://www.ontologyrepository.com/CommonCoreOntologies/inhibited_by) Range [process](http://purl.obolibrary.org/obo/BFO_0000015) 


### inhibits `http://www.ontologyrepository.com/CommonCoreOntologies/inhibits`

#### Added
- [inhibits](http://www.ontologyrepository.com/CommonCoreOntologies/inhibits) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x inhibits y iff x and y are non-identical Processes, d is a Decrease of Realizable Entity, and x is_cause_of d, and r is a Realizable Entity, and d has_participant r, and r realized_in y."@en 

- [inhibits](http://www.ontologyrepository.com/CommonCoreOntologies/inhibits) [is curated in ontology](http://www.ontologyrepository.com/CommonCoreOntologies/is_curated_in_ontology) "http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ExtendedRelationOntology"^^[anyURI](http://www.w3.org/2001/XMLSchema#anyURI) 

- [inhibits](http://www.ontologyrepository.com/CommonCoreOntologies/inhibits) [label](http://www.w3.org/2000/01/rdf-schema#label) "inhibits"@en 

- ObjectProperty: [inhibits](http://www.ontologyrepository.com/CommonCoreOntologies/inhibits) 

- [inhibits](http://www.ontologyrepository.com/CommonCoreOntologies/inhibits) Domain [process](http://purl.obolibrary.org/obo/BFO_0000015) 

- [inhibits](http://www.ontologyrepository.com/CommonCoreOntologies/inhibits) Range [process](http://purl.obolibrary.org/obo/BFO_0000015) 


### is affected by `http://www.ontologyrepository.com/CommonCoreOntologies/is_affected_by`
#### Removed
- [is affected by](http://www.ontologyrepository.com/CommonCoreOntologies/is_affected_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "c is_affected_by p iff p is an instance of a Process and c is an instance of a Continuant, such that p influences c in some manner, most often by producing a change in c."@en 

#### Added
- [is affected by](http://www.ontologyrepository.com/CommonCoreOntologies/is_affected_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x is_affected_by y iff x is an instance of Continuant and y is an instance of Process, and y influences x in some manner, most often by producing a change in x."@en 


### is cause of `http://www.ontologyrepository.com/CommonCoreOntologies/is_cause_of`
#### Removed
- [is cause of](http://www.ontologyrepository.com/CommonCoreOntologies/is_cause_of) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x is_cause_of y iff x and y are instances of occurrents, and y is a consequence of x."@en 

#### Added
- [is cause of](http://www.ontologyrepository.com/CommonCoreOntologies/is_cause_of) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x is_cause_of y iff x and y are instances of Occurrent, and y is a consequence of x."@en 


### measurement annotation `http://www.ontologyrepository.com/CommonCoreOntologies/measurement_annotation`
#### Removed
- [measurement annotation](http://www.ontologyrepository.com/CommonCoreOntologies/measurement_annotation) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A measurement value of an instance of a quality, reazlizable or process profile"@en 

#### Added
- [measurement annotation](http://www.ontologyrepository.com/CommonCoreOntologies/measurement_annotation) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A measurement value of an instance of a quality, realizable or process profile"@en 


### quality of aggregate `http://www.ontologyrepository.com/CommonCoreOntologies/quality_of_aggregate`
#### Removed
- [quality of aggregate](http://www.ontologyrepository.com/CommonCoreOntologies/quality_of_aggregate) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x quality_of_aggregate y iff y is an instance of Object Aggregate and x is an instance of Quality, such that x disposition_of_aggregate y."@en 

#### Added
- [quality of aggregate](http://www.ontologyrepository.com/CommonCoreOntologies/quality_of_aggregate) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x quality_of_aggregate y iff y is an instance of Object Aggregate and x is an instance of Quality, and x inheres_in_aggregate y."@en 


### role of aggregate `http://www.ontologyrepository.com/CommonCoreOntologies/role_of_aggregate`
#### Removed
- [role of aggregate](http://www.ontologyrepository.com/CommonCoreOntologies/role_of_aggregate) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x role_of_aggregate y iff y is an instance of Object Aggregate and x is an instance of Role, such that x disposition_of_aggregate y."@en 

#### Added
- [role of aggregate](http://www.ontologyrepository.com/CommonCoreOntologies/role_of_aggregate) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x role_of_aggregate y iff y is an instance of Object Aggregate and x is an instance of Role, and x inheres_in_aggregate y."@en 
