## Instructions for Registering new IRIs in CCO

Before creating a pull request containing a new CCO term, developers must register the new IRIs in the csv file maintained exclusively on this separate [branch](https://github.com/CommonCoreOntology/CommonCoreOntologies/tree/iri-registry-branch/). 

To that end: 

1. Navigate to this [directory](https://github.com/CommonCoreOntology/CommonCoreOntologies/tree/iri-registry-branch/documentation/contributing) on the IRI Registry branch.
2. Open the file `iri-registry.csv` located there and navigate to the bottom row of the file.
3. In the next empty row, add the new IRI(s) as an increment from the last one. Also add your name, the date, and the associated issue number(s).
4. Commit your changes directly to the IRI Registry Branch and push to origin.
6. Now you can open a new branch off of `develop` to execute your work using the IRIs that you have registered. 
