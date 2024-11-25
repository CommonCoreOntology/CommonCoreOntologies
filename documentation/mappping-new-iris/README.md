# Mapping New IRIs

This directory contains the IRI mapping file for updating ontologies that use Version 1.7 or older of CCO to work with the new IRI schema introduced in Version 2.0.

It is designed to work with [ROBOT](http://robot.obolibrary.org).

robot rename --input [file-with-old-iris] \\  
--mappings iri-mapping-v2.0.csv \\  
--add-prefix "cco2: https://www.commoncoreontologies.org/" \\  
--allow-missing-entities true --output [file-with-new-iris]
