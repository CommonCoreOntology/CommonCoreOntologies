# Ontology comparison

## Left
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ExtendedRelationOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-09-26/ExtendedRelationOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/ExtendedRelationOntology.ttl`

## Right
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ExtendedRelationOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-09-26/ExtendedRelationOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/new/ExtendedRelationOntology.ttl`

### Ontology imports 



### Ontology annotations 



### has all members located in `http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in`
#### Removed
- [has all members located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) [label](http://www.w3.org/2000/01/rdf-schema#label) "has all members of located in"@en 

- [has all members located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x has all members of located in y iff x is an instance of Object Aggregate and y is an instance of Material Entity, and every member of x is located in y."@en 

- [has all members located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) Range [material entity](http://purl.obolibrary.org/obo/BFO_0000040) 

#### Added
- [has all members located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x has all members located in y iff x is an instance of Object Aggregate and y is an instance of independent continuant but not a spatial region, and every member of x is located in y."@en 

- [has all members located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) [label](http://www.w3.org/2000/01/rdf-schema#label) "has all members located in"@en 

- [has all members located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_member_of_located_in) Range [independent continuant](http://purl.obolibrary.org/obo/BFO_0000004) and (not ([spatial region](http://purl.obolibrary.org/obo/BFO_0000006))) 


### has some member located in `http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in`
#### Removed
- [has some member located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x has some member of located in y iff x is an instance of Object Aggregate and y is an instance of Material Entity, and at least one member of x is located in y."@en 

- [has some member located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) [label](http://www.w3.org/2000/01/rdf-schema#label) "has some member of located in"@en 

#### Added
- [has some member located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x has some member located in y iff x is an instance of Object Aggregate and y is an instance of independent continuant but not a spatial region, and at least one member of x is located in y."@en 

- [has some member located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) [label](http://www.w3.org/2000/01/rdf-schema#label) "has some member located in"@en 

- [has some member located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) Domain [object aggregate](http://purl.obolibrary.org/obo/BFO_0000027) 

- [has some member located in](http://www.ontologyrepository.com/CommonCoreOntologies/has_some_member_of_located_in) Range [independent continuant](http://purl.obolibrary.org/obo/BFO_0000004) and (not ([spatial region](http://purl.obolibrary.org/obo/BFO_0000006))) 


### is temporal region of `http://www.ontologyrepository.com/CommonCoreOntologies/is_temporal_region_of`
#### Removed
- [is temporal region of](http://www.ontologyrepository.com/CommonCoreOntologies/is_temporal_region_of) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x is_temporal_region_of y iff y is an instance of a process or process boundary and x is an instance of a temporal region, such that the duration of x temporally projects on y."@en 

#### Added
- [is temporal region of](http://www.ontologyrepository.com/CommonCoreOntologies/is_temporal_region_of) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "t is temporal region of p = def p occupies temporal region t."@en 
