## Instructions for Registering new IRIs in CCO

Before creating a pull request containing a new CCO term, developers must register the new IRIs in the csv file maintained exclusively in the [contributing documentation section](https://github.com/CommonCoreOntology/CommonCoreOntologies/tree/iri-registry-branch/documentation/contributing) on this separate [branch](https://github.com/CommonCoreOntology/CommonCoreOntologies/tree/iri-registry-branch/). 

To do so: 

1. Open the file `iri-registry.csv` located in that directory and navigate to the bottom row of the file.
2. In the next empty row, add the new IRI(s) as an increment from the last one. Also add your name, the date, and the associated issue number(s).
3. Commit your changes directly to the IRI Registry Branch and push to origin.
4. Now you can open a new branch off of `develop` to execute your work using the IRIs that you have registered. 
