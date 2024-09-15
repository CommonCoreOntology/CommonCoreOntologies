# Ontology comparison

## Left
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/AgentOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-02-14/AgentOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/old/AgentOntology.ttl`

## Right
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/AgentOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-02-14/AgentOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/AgentOntology.ttl`

### Ontology imports 



### Ontology annotations 
#### Removed
- [license](http://purl.org/dc/terms/license) [BSD-3-Clause](https://opensource.org/licenses/BSD-3-Clause) 

#### Added
- [license](http://purl.org/dc/terms/license) "BSD 3-Clause: https://github.com/CommonCoreOntology/CommonCoreOntologies/blob/master/LICENSE"@en 

- [rights](http://purl.org/dc/terms/rights) "CUBRC Inc., see full license."@en 


### Action Permission `http://www.ontologyrepository.com/CommonCoreOntologies/ActionPermission`
#### Removed
- [Action Permission](http://www.ontologyrepository.com/CommonCoreOntologies/ActionPermission) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Action Regulation that permits some Act."@en 

#### Added
- [Action Permission](http://www.ontologyrepository.com/CommonCoreOntologies/ActionPermission) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Process Regulation that permits some Process."@en 


### Action Prohibition `http://www.ontologyrepository.com/CommonCoreOntologies/ActionProhibition`
#### Removed
- [Action Prohibition](http://www.ontologyrepository.com/CommonCoreOntologies/ActionProhibition) [label](http://www.w3.org/2000/01/rdf-schema#label) "Action Prohibition"@en 

- [Action Prohibition](http://www.ontologyrepository.com/CommonCoreOntologies/ActionProhibition) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Action Regulation that prohibits some Act."@en 

#### Added
- [Action Prohibition](http://www.ontologyrepository.com/CommonCoreOntologies/ActionProhibition) [label](http://www.w3.org/2000/01/rdf-schema#label) "Process Prohibition"@en 

- [Action Prohibition](http://www.ontologyrepository.com/CommonCoreOntologies/ActionProhibition) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Process Regulation that prohibits some Process."@en 


### Action Regulation `http://www.ontologyrepository.com/CommonCoreOntologies/ActionRegulation`
#### Removed
- [Action Regulation](http://www.ontologyrepository.com/CommonCoreOntologies/ActionRegulation) [label](http://www.w3.org/2000/01/rdf-schema#label) "Action Regulation"@en 

- [Action Regulation](http://www.ontologyrepository.com/CommonCoreOntologies/ActionRegulation) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Directive Information Content Entity that prescribes an Act as required, prohibited, or permitted, and is the output of an Act which realizes some Authority Role."@en 

#### Added
- [Action Regulation](http://www.ontologyrepository.com/CommonCoreOntologies/ActionRegulation) [label](http://www.w3.org/2000/01/rdf-schema#label) "Process Regulation"@en 

- [Action Regulation](http://www.ontologyrepository.com/CommonCoreOntologies/ActionRegulation) [elucidation](http://www.ontologyrepository.com/CommonCoreOntologies/elucidation) "Although regulations often regulate processes which involve agents--as the regulating or regulated participant--it is unclear how causally active an agents need to be in those regulated processes. For example, it is not clear how causally active a human agent is in the process of a traffic light regulating the motion of a self-driving vehicle."@en 

- [Action Regulation](http://www.ontologyrepository.com/CommonCoreOntologies/ActionRegulation) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Directive Information Content Entity that prescribes an Process as required, prohibited, or permitted, and is the output of an Process which realizes some Authority Role."@en 


### Action Requirement `http://www.ontologyrepository.com/CommonCoreOntologies/ActionRequirement`
#### Removed
- [Action Requirement](http://www.ontologyrepository.com/CommonCoreOntologies/ActionRequirement) [label](http://www.w3.org/2000/01/rdf-schema#label) "Action Requirement"@en 

- [Action Requirement](http://www.ontologyrepository.com/CommonCoreOntologies/ActionRequirement) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Action Regulation that requires some Act."@en 

#### Added
- [Action Requirement](http://www.ontologyrepository.com/CommonCoreOntologies/ActionRequirement) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Process Regulation that requires some Process."@en 

- [Action Requirement](http://www.ontologyrepository.com/CommonCoreOntologies/ActionRequirement) [label](http://www.w3.org/2000/01/rdf-schema#label) "Process Requirement"@en 


### Authority Role `http://www.ontologyrepository.com/CommonCoreOntologies/AuthorityRole`
#### Removed
- [Authority Role](http://www.ontologyrepository.com/CommonCoreOntologies/AuthorityRole) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Role that is realized by Acts which create, modify, transfer, or eliminate Action Regulations or other Authority Roles, and inheres in an Agent in virtue of collective acceptance of that Agent's ability to issue binding directives."@en 

#### Added
- [Authority Role](http://www.ontologyrepository.com/CommonCoreOntologies/AuthorityRole) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Role that is realized by Processes which create, modify, transfer, or eliminate Process Regulations or other Authority Roles, and inheres in an Agent in virtue of collective acceptance of that Agent's ability to issue binding directives."@en 


### Domain of a Country `http://www.ontologyrepository.com/CommonCoreOntologies/Country`
#### Removed
- [Domain of a Country](http://www.ontologyrepository.com/CommonCoreOntologies/Country) [editorialNote](http://www.w3.org/2004/02/skos/core#editorialNote) "'Country' is an unclear term. Does it refer to the people, the government, the site, or the material in the site? Furthermore, what is properly referred to as a 'Country' is highly dependent on the classification practices of the international community. For example: The United Kingdom is a sovereign country that has Wales, a non-sovereign Country, as a member. Vatican City is a sovereign country that is landlocked by a city: Rome, Italy. Puerto Rico is not a county (it's a territory) but has a government, a distinct culture, and so on. Thus, here we do not definine 'Country' but instead define 'Domain of a Country'."@en 

#### Added
- [Domain of a Country](http://www.ontologyrepository.com/CommonCoreOntologies/Country) [editorialNote](http://www.w3.org/2004/02/skos/core#editorialNote) "'Country' is an unclear term. Does it refer to the people, the government, the site, or the material in the site? Furthermore, what is properly referred to as a 'Country' is highly dependent on the classification practices of the international community. For example: The United Kingdom is a sovereign country that has Wales, a non-sovereign Country, as a member. Vatican City is a sovereign country that is landlocked by a city: Rome, Italy. Puerto Rico is not a country (it's a territory) but has a government, a distinct culture, and so on. Thus, here we do not definine 'Country' but instead define 'Domain of a Country'."@en 


### Educational Organization `http://www.ontologyrepository.com/CommonCoreOntologies/EducationalOrganization`
#### Removed
- [Educational Organization](http://www.ontologyrepository.com/CommonCoreOntologies/EducationalOrganization) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Organization whose purpose is to provide training or otherwise facilitate learning or the acquisition of knowledge, Skills, values, beliefs, or habits."@en 

#### Added
- [Educational Organization](http://www.ontologyrepository.com/CommonCoreOntologies/EducationalOrganization) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Organization whose primary purpose is to provide training or otherwise facilitate learning or the acquisition of knowledge, Skills, values, beliefs, or habits."@en 


### Enemy `http://www.ontologyrepository.com/CommonCoreOntologies/Enemy`
#### Removed
- [Enemy](http://www.ontologyrepository.com/CommonCoreOntologies/Enemy) [label](http://www.w3.org/2000/01/rdf-schema#label) "Enemy"@en 

#### Added
- [Enemy](http://www.ontologyrepository.com/CommonCoreOntologies/Enemy) [label](http://www.w3.org/2000/01/rdf-schema#label) "Enemy Person"@en 


### Government Organization `http://www.ontologyrepository.com/CommonCoreOntologies/GovernmentAgency`
#### Removed
- [Government Organization](http://www.ontologyrepository.com/CommonCoreOntologies/GovernmentAgency) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Organization that is part of a Government and is responsible for the oversight and administration of specific governmental functions."@en 

#### Added
- [Government Organization](http://www.ontologyrepository.com/CommonCoreOntologies/GovernmentAgency) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Organization that is part of a Government and is responsible for the oversight or administration of specific governmental functions."@en 


### Permanent Resident `http://www.ontologyrepository.com/CommonCoreOntologies/PermanentResident`
#### Removed
- [Permanent Resident](http://www.ontologyrepository.com/CommonCoreOntologies/PermanentResident) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A person with a Permanent Residence Role."@en 

#### Added
- [Permanent Resident](http://www.ontologyrepository.com/CommonCoreOntologies/PermanentResident) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A person with a Permanent Resident Role."@en 


### has familial relationship to `http://www.ontologyrepository.com/CommonCoreOntologies/has_familial_relationship_to`

#### Added
-  Symmetric: [has familial relationship to](http://www.ontologyrepository.com/CommonCoreOntologies/has_familial_relationship_to) 


### has subordinate role `http://www.ontologyrepository.com/CommonCoreOntologies/has_subordinate_role`
#### Removed
- [has subordinate role](http://www.ontologyrepository.com/CommonCoreOntologies/has_subordinate_role) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "For all x,y,t: x has subordinate role y at t iff: x is an instance of bfo:BFO_0000023 (Role) at time t, and y is an instance of bfo:BFO_0000023 (Role) at time t, and there is some z such that x is realized by z and z is an instance of Act which creates, modifies, transfers, or eliminates some u such that u is an Action Regulation at time t, and u is addressed to the bearer of y."@en 

#### Added
- [has subordinate role](http://www.ontologyrepository.com/CommonCoreOntologies/has_subordinate_role) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "For all x,y,t: x has subordinate role y at t iff: x is an instance of Role at time t, and y is an instance of Role at time t, and there is some z such that x is realized by z and z is an instance of Process which creates, modifies, transfers, or eliminates some u such that u is a Process Regulation at time t, and u is addressed to the bearer of y."@en 


### is permitted by `http://www.ontologyrepository.com/CommonCoreOntologies/is_permitted_by`
#### Removed
- [is permitted by](http://www.ontologyrepository.com/CommonCoreOntologies/is_permitted_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "y is_permitted_by x at t iff: x is an instance of Action Regulation at time t, and y is an instance of Act at time t, and x prescribes that some agent may be agent in y."@en 

#### Added
- [is permitted by](http://www.ontologyrepository.com/CommonCoreOntologies/is_permitted_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "y is_permitted_by x at t iff: x is an instance of Process Regulation at time t, and y is an instance of Process at time t, and x prescribes that y may occur."@en 


### is prohibited by `http://www.ontologyrepository.com/CommonCoreOntologies/is_prohibited_by`
#### Removed
- [is prohibited by](http://www.ontologyrepository.com/CommonCoreOntologies/is_prohibited_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "y is_prohibited_by y at t iff: x is an instance of Action Regulation at time t, and y is an instance of Act at time t, and x prescribes that some agent must not be agent in y."@en 

#### Added
- [is prohibited by](http://www.ontologyrepository.com/CommonCoreOntologies/is_prohibited_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "y is_prohibited_by y at t iff: x is an instance of Process Regulation at time t, and y is an instance of Process at time t, and x prescribes that y must not occur."@en 


### is required by `http://www.ontologyrepository.com/CommonCoreOntologies/is_required_by`
#### Removed
- [is required by](http://www.ontologyrepository.com/CommonCoreOntologies/is_required_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "y is_required_by x at t iff: x is an instance of Action Regulation at time t, and y is an instance of Act at time t, and x prescribes that some agent must be agent in y."@en 

#### Added
- [is required by](http://www.ontologyrepository.com/CommonCoreOntologies/is_required_by) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "y is_required_by x at t iff: x is an instance of Process Regulation at time t, and y is an instance of Process at time t, and x prescribes that some that y must occur."@en 


### is subordinate role to `http://www.ontologyrepository.com/CommonCoreOntologies/is_subordinate_role_to`
#### Removed
- [is subordinate role to](http://www.ontologyrepository.com/CommonCoreOntologies/is_subordinate_role_to) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "For all x,y,t: y is subordinate role to x at t iff: x is an instance of bfo:BFO_0000023 (Role) at time t, and y is an instance of bfo:BFO_0000023 (Role) at time t, and there is some z such that x is realized by z and z is an instance of Act which creates, modifies, transfers, or eliminates some u such that u is an Action Regulation at time t, and u is addressed to the bearer of y."@en 

#### Added
- [is subordinate role to](http://www.ontologyrepository.com/CommonCoreOntologies/is_subordinate_role_to) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "For all x,y,t: y is subordinate role to x at t iff: x is an instance of Role at time t, and y is an instance of Role at time t, and there is some z such that x is realized by z and z is an instance of Process which creates, modifies, transfers, or eliminates some u such that u is a Process Regulation at time t, and u is addressed to the bearer of y."@en 


### permits `http://www.ontologyrepository.com/CommonCoreOntologies/permits`
#### Removed
- [permits](http://www.ontologyrepository.com/CommonCoreOntologies/permits) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x permits y at t iff: x is an instance of Action Regulation at time t, and y is an instance of Act at time t, and x prescribes that some agent may be agent in y."@en 

#### Added
- [permits](http://www.ontologyrepository.com/CommonCoreOntologies/permits) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x permits y at t iff: x is an instance of Process Regulation at time t, and y is an instance of Process at time t, and x prescribes that y may occur."@en 


### prohibits `http://www.ontologyrepository.com/CommonCoreOntologies/prohibits`
#### Removed
- [prohibits](http://www.ontologyrepository.com/CommonCoreOntologies/prohibits) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x prohibits y at t iff: x is an instance of Action Regulation at time t, and y is an instance of Act at time t, and x prescribes that some agent must not be agent in y."@en 

#### Added
- [prohibits](http://www.ontologyrepository.com/CommonCoreOntologies/prohibits) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x prohibits y at t iff: x is an instance of Process Regulation at time t, and y is an instance of Process at time t, and x prescribes that some that y must not occur."@en 


### requires `http://www.ontologyrepository.com/CommonCoreOntologies/requires`
#### Removed
- [requires](http://www.ontologyrepository.com/CommonCoreOntologies/requires) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x requires y at t iff: x is an instance of Action Regulation at time t, and y is an instance of Act at time t, and x prescribes that some agent must be agent in y."@en 

#### Added
- [requires](http://www.ontologyrepository.com/CommonCoreOntologies/requires) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "x requires y at t iff: x is an instance of Process Regulation at time t, and y is an instance of Process at time t, and x prescribes that some that y must occur."@en 
