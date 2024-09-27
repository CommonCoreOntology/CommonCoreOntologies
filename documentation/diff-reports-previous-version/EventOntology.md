# Ontology comparison

## Left
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/EventOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-02-14/EventOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/old/EventOntology.ttl`

## Right
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/EventOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-02-14/EventOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/EventOntology.ttl`

### Ontology imports 



### Ontology annotations 
#### Removed
- [license](http://purl.org/dc/terms/license) [BSD-3-Clause](https://opensource.org/licenses/BSD-3-Clause) 

#### Added
- [license](http://purl.org/dc/terms/license) "BSD 3-Clause: https://github.com/CommonCoreOntology/CommonCoreOntologies/blob/master/LICENSE"@en 

- [rights](http://purl.org/dc/terms/rights) "CUBRC Inc., see full license."@en 


### Act of Data Transformation `http://www.ontologyrepository.com/CommonCoreOntologies/ActOfDataTransformation`

#### Added
- [Act of Data Transformation](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfDataTransformation) [label](http://www.w3.org/2000/01/rdf-schema#label) "Act of Data Transformation"@en 

- [Act of Data Transformation](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfDataTransformation) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Act of Information Processing in which an algorithm is executed to act upon one or more input Information Content Entities into one or more output Information Content Entities."@en 

- [Act of Data Transformation](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfDataTransformation) [elucidation](http://www.ontologyrepository.com/CommonCoreOntologies/elucidation) "It is not a requirement that the output Information Content Entity(ies) be qualitatively distinct from the input(s) as a result of an Act of Data Transformation, though doing so is typically the goal of performing this Act. Consider, for example, selecting a column in an Excel spreadsheet then executing the \&quot;Remove Duplicates\&quot; Algorithm on it. The intent is to remove rows in that column containing duplicate content. If no duplicate values are present, the information in the column remains unchanged but an Act of Data Transformation was nonetheless performed."@en 

- [Act of Data Transformation](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfDataTransformation) [is curated in ontology](http://www.ontologyrepository.com/CommonCoreOntologies/is_curated_in_ontology) "http://www.ontologyrepository.com/CommonCoreOntologies/Mid/EventOntology"^^[anyURI](http://www.w3.org/2001/XMLSchema#anyURI) 

- Class: [Act of Data Transformation](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfDataTransformation) 

- [Act of Data Transformation](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfDataTransformation) SubClassOf [Act of Information Processing](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfInformationProcessing) 


### Act of Expressive Communication `http://www.ontologyrepository.com/CommonCoreOntologies/ActOfExpressiveCommunication`
#### Removed
- [Act of Expressive Communication](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfExpressiveCommunication) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Act of Communication that expresses the Speaker's attitudes and emotions towards some proposition."@en 

#### Added
- [Act of Expressive Communication](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfExpressiveCommunication) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Act of Communication in which an Agent expresses their attitudes or emotions towards some entity."@en 


### Act of Information Processing `http://www.ontologyrepository.com/CommonCoreOntologies/ActOfInformationProcessing`

#### Added
- [Act of Information Processing](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfInformationProcessing) [is curated in ontology](http://www.ontologyrepository.com/CommonCoreOntologies/is_curated_in_ontology) "http://www.ontologyrepository.com/CommonCoreOntologies/Mid/EventOntology"^^[anyURI](http://www.w3.org/2001/XMLSchema#anyURI) 

- [Act of Information Processing](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfInformationProcessing) [label](http://www.w3.org/2000/01/rdf-schema#label) "Act of Information Processing"@en 

- [Act of Information Processing](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfInformationProcessing) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Planned Act in which one or more input Information Content Entities are received, manipulated, transferred, or stored by an Agent."@en 

- Class: [Act of Information Processing](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfInformationProcessing) 

- [Act of Information Processing](http://www.ontologyrepository.com/CommonCoreOntologies/ActOfInformationProcessing) SubClassOf [Planned Act](http://www.ontologyrepository.com/CommonCoreOntologies/IntentionalAct) 


### Angular Velocity `http://www.ontologyrepository.com/CommonCoreOntologies/AngularVelocity`
#### Removed
- [Angular Velocity](http://www.ontologyrepository.com/CommonCoreOntologies/AngularVelocity) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Velocity that describes both the angular (i.e. rotational) Speed of an object and the Axis about which the object is Rotating."@en 

#### Added
- [Angular Velocity](http://www.ontologyrepository.com/CommonCoreOntologies/AngularVelocity) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Velocity that is characterized by both the angular Speed of an object and the Axis about which the object is Rotating."@en 

- [Angular Velocity](http://www.ontologyrepository.com/CommonCoreOntologies/AngularVelocity) [alternative label](http://www.ontologyrepository.com/CommonCoreOntologies/alternative_label) "Rotational Velocity"@en 


### Cause `http://www.ontologyrepository.com/CommonCoreOntologies/Cause`
#### Removed
- [Cause](http://www.ontologyrepository.com/CommonCoreOntologies/Cause) EquivalentTo [process](http://purl.obolibrary.org/obo/BFO_0000015) and ([is cause of](http://www.ontologyrepository.com/CommonCoreOntologies/is_cause_of) some [occurrent](http://purl.obolibrary.org/obo/BFO_0000003)) 

#### Added
- [Cause](http://www.ontologyrepository.com/CommonCoreOntologies/Cause) EquivalentTo [process](http://purl.obolibrary.org/obo/BFO_0000015) and ([is cause of](http://www.ontologyrepository.com/CommonCoreOntologies/is_cause_of) some [process](http://purl.obolibrary.org/obo/BFO_0000015)) 


### Decrease of Function `http://www.ontologyrepository.com/CommonCoreOntologies/DecreaseOfFunction`
#### Removed
- [Decrease of Function](http://www.ontologyrepository.com/CommonCoreOntologies/DecreaseOfFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Decrease of Realizable Entity in which some Independent Continuant has a decrease of some Function that it bears."@en 

- [Decrease of Function](http://www.ontologyrepository.com/CommonCoreOntologies/DecreaseOfFunction) SubClassOf [Decrease of Realizable Entity](http://www.ontologyrepository.com/CommonCoreOntologies/DecreaseOfRealizableEntity) 

#### Added
- [Decrease of Function](http://www.ontologyrepository.com/CommonCoreOntologies/DecreaseOfFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Decrease of Disposition in which some Independent Continuant has a decrease of some Function that it bears."@en 

- [Decrease of Function](http://www.ontologyrepository.com/CommonCoreOntologies/DecreaseOfFunction) SubClassOf [Decrease of Disposition](http://www.ontologyrepository.com/CommonCoreOntologies/DecreaseOfDisposition) 


### Effect `http://www.ontologyrepository.com/CommonCoreOntologies/Effect`
#### Removed
- [Effect](http://www.ontologyrepository.com/CommonCoreOntologies/Effect) EquivalentTo [process](http://purl.obolibrary.org/obo/BFO_0000015) and ([caused by](http://www.ontologyrepository.com/CommonCoreOntologies/caused_by) some [occurrent](http://purl.obolibrary.org/obo/BFO_0000003)) 

#### Added
- [Effect](http://www.ontologyrepository.com/CommonCoreOntologies/Effect) EquivalentTo [process](http://purl.obolibrary.org/obo/BFO_0000015) and ([caused by](http://www.ontologyrepository.com/CommonCoreOntologies/caused_by) some [process](http://purl.obolibrary.org/obo/BFO_0000015)) 


### Gain of Disposition `http://www.ontologyrepository.com/CommonCoreOntologies/GainOfDisposition`
#### Removed
- [Gain of Disposition](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfDisposition) [comment](http://www.w3.org/2000/01/rdf-schema#comment) "This class should be used to demarcate the start of the temporal interval (through the occurs_on property) that the Entity bears the Disposition."@en 

#### Added
- [Gain of Disposition](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfDisposition) [comment](http://www.w3.org/2000/01/rdf-schema#comment) "This class should be used to demarcate the start of the temporal interval (through the BFO 'occupies temporal region' property) that the Entity bears the Disposition."@en 


### Gain of Function `http://www.ontologyrepository.com/CommonCoreOntologies/GainOfFunction`
#### Removed
- [Gain of Function](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfFunction) [comment](http://www.w3.org/2000/01/rdf-schema#comment) "This class should be used to demarcate the start of the temporal interval (through the occurs_on property) that the Entity bears the Function."@en 

- [Gain of Function](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Gain of Realizable Entity in which some Independent Continuant becomes the bearer of some Function."@en 

- [Gain of Function](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfFunction) SubClassOf [Gain of Realizable Entity](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfRealizableEntity) 

#### Added
- [Gain of Function](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfFunction) [comment](http://www.w3.org/2000/01/rdf-schema#comment) "This class should be used to demarcate the start of the temporal interval (through the BFO 'occupies temporal region' property) that the Entity bears the Function."@en 

- [Gain of Function](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Gain of Disposition in which some Independent Continuant becomes the bearer of some Function."@en 

- [Gain of Function](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfFunction) SubClassOf [Gain of Disposition](http://www.ontologyrepository.com/CommonCoreOntologies/GainOfDisposition) 


### Increase of Function `http://www.ontologyrepository.com/CommonCoreOntologies/IncreaseOfFunction`
#### Removed
- [Increase of Function](http://www.ontologyrepository.com/CommonCoreOntologies/IncreaseOfFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Increase of Realizable Entity in which some Independent Continuant has an increase of some Function that it bears."@en 

- [Increase of Function](http://www.ontologyrepository.com/CommonCoreOntologies/IncreaseOfFunction) SubClassOf [Increase of Realizable Entity](http://www.ontologyrepository.com/CommonCoreOntologies/IncreaseOfRealizableEntity) 

#### Added
- [Increase of Function](http://www.ontologyrepository.com/CommonCoreOntologies/IncreaseOfFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Increase of Disposition in which some Independent Continuant has an increase of some Function that it bears."@en 

- [Increase of Function](http://www.ontologyrepository.com/CommonCoreOntologies/IncreaseOfFunction) SubClassOf [Increase of Disposition](http://www.ontologyrepository.com/CommonCoreOntologies/IncreaseOfDisposition) 


### Loss of Function `http://www.ontologyrepository.com/CommonCoreOntologies/LossOfFunction`
#### Removed
- [Loss of Function](http://www.ontologyrepository.com/CommonCoreOntologies/LossOfFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Loss of Realizable Entity in which some Independent Continuant ceases to be the bearer of some Function."@en 

- [Loss of Function](http://www.ontologyrepository.com/CommonCoreOntologies/LossOfFunction) SubClassOf [Loss of Realizable Entity](http://www.ontologyrepository.com/CommonCoreOntologies/LossOfRealizableEntity) 

#### Added
- [Loss of Function](http://www.ontologyrepository.com/CommonCoreOntologies/LossOfFunction) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Loss of Disposition in which some Independent Continuant ceases to be the bearer of some Function."@en 

- [Loss of Function](http://www.ontologyrepository.com/CommonCoreOntologies/LossOfFunction) SubClassOf [Loss of Disposition](http://www.ontologyrepository.com/CommonCoreOntologies/LossOfDisposition) 


### Loudness `http://www.ontologyrepository.com/CommonCoreOntologies/Loudness`
#### Removed
- [Loudness](http://www.ontologyrepository.com/CommonCoreOntologies/Loudness) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Sound Process Profile that is characterized by the amplitude, frequency and power of translated sound waves, typically on a continuum from soft to loud."@en 

#### Added
- [Loudness](http://www.ontologyrepository.com/CommonCoreOntologies/Loudness) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Sound Process Profile that is characterized by the amplitude and total energy of translated sound waves, typically on a continuum from soft to loud."@en 

- [Loudness](http://www.ontologyrepository.com/CommonCoreOntologies/Loudness) [definition source](http://www.ontologyrepository.com/CommonCoreOntologies/definition_source) "https://byjus.com/physics/loudness-of-sound/"^^[anyURI](http://www.w3.org/2001/XMLSchema#anyURI) 


### Sound Pressure `http://www.ontologyrepository.com/CommonCoreOntologies/SoundPressure`
#### Removed
- [Sound Pressure](http://www.ontologyrepository.com/CommonCoreOntologies/SoundPressure) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Pressure caused by a Sound Wave that is a local deviation from the ambient Pressure."@en 

#### Added
- [Sound Pressure](http://www.ontologyrepository.com/CommonCoreOntologies/SoundPressure) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Pressure that is caused by a Sound Wave and is a local deviation from the ambient Pressure."@en 


### Velocity `http://www.ontologyrepository.com/CommonCoreOntologies/Velocity`
#### Removed
- [Velocity](http://www.ontologyrepository.com/CommonCoreOntologies/Velocity) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Process Profile of an object's Motion that describes its Speed and direction with respect to a frame of reference."@en 

#### Added
- [Velocity](http://www.ontologyrepository.com/CommonCoreOntologies/Velocity) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Process Profile of an object's Motion that is characterized by its Speed and direction with respect to a frame of reference."@en 
