# mapping NEw IRIs

This directory contains the mapping file for renaming the version 1.7 and older CCO ontology elements to the schema intorduced in version 2.0
It is desiging to work with the ROBOT command `rename`

robot rename -i [file-name-old-iris] --mappings iri-mapping-v2.0.csv --add-prefix "cco2: https://www.commoncoreontologies.org/" --allow-missing-entities true -o [file-name-new-iris]

Ontology IRIs require a manual find and replace.

http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ArtifactOntology --> https://www.commoncoreontologies.org/ArtifactOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/AgentOntology --> https://www.commoncoreontologies.org/AgentOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/InformationContentOntology --> https://www.commoncoreontologies.org/InformationContentOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/QualityOntology --> https://www.commoncoreontologies.org/QualityOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/EventOntology --> https://www.commoncoreontologies.org/EventOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/MeasurementUnitOntology --> https://www.commoncoreontologies.org/UnitsOfMeasureOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/CurrencyUnitOntology --> https://www.commoncoreontologies.org/CurrencyUnitOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/FacilityOntology --> https://www.commoncoreontologies.org/FacilityOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/TimeOntology --> https://www.commoncoreontologies.org/TimeOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/GeospatialOntology --> https://www.commoncoreontologies.org/GeospatialOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ExtendedRelationOntology --> https://www.commoncoreontologies.org/ExtendedRelationOntology
http://www.ontologyrepository.com/CommonCoreOntologies/Mid/ModalRelationOntology --> https://www.commoncoreontologies.org/ModalRelationOntology