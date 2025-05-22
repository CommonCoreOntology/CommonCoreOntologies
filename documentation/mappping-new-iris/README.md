# Mapping New IRIs

This directory contains the IRI mapping file for updating ontologies that use CCO v1.5, v1.6, or v1.7 to be compatible with the new IRI schema introduced in v2.0. 

It is designed to work with [ROBOT](http://robot.obolibrary.org).

robot rename --input [file-with-old-iris] \\  
--mappings iri-mapping-v2.0.csv \\  
--add-prefix "cco2: https://www.commoncoreontologies.org/" \\  
--allow-missing-entities true --output [file-with-new-iris]

#### NOTE: For updating ontolgies that depend on versions of CCO older than v1.5, you will need to first update to v1.5. Please see this [wiki](https://github.com/CommonCoreOntology/CommonCoreOntologies/wiki/Updating-CCO-v1.4-or-earlier-to-Align-with-CCO-v1.5-and-BFO-2020) for details.
