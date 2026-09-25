## Instructions for Registering new IRIs in CCO

Before creating a pull request containing a new CCO term, developers must register the new IRIs in [this csv file](https://github.com/CommonCoreOntology/CommonCoreOntologies/blob/iri-registry-branch/documentation/contributing/iri-registry.csv) maintained exclusively in the separate `iri-registry-branch`.

To do so:

1. Open the file `iri-registry.csv` located [here](https://github.com/CommonCoreOntology/CommonCoreOntologies/blob/iri-registry-branch/documentation/contributing/iri-registry.csv) and navigate to the bottom row of the file.
2. In the next empty row, add the new IRI(s) as an increment from the last one. Also add your name, the date, and the associated issue number(s).
3. Commit your changes directly to the IRI Registry Branch and push to origin. NOTE: If you do not have write access, you will be prompted to create a fork with your changes. Create the fork then create a merge request for it and tag one or more CCO admins to approve it.
4. Now you can return to the `develop` branch to open a new branch where you can execute your work using the newly registered IRIs.
