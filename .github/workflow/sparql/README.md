# SPARQL Quality Control 

This directory contains [SPARQL](https://www.w3.org/TR/sparql11-query/) files used to automate quality control checks against updates to CCO development branches and the CCO master branch. 

## Quality Control Format

SPARQL Quality Control files should be named in a manner that illustrates their functionality, and must take the form of: 
```
Title
    (descriptive title of the query)
Constraint Description: 
    (description of the query functionality)
Severity:
    (select "Warning" or "Error")
```
With respect to severity, a "Warning" will be some issue that should be addressed, but is not currently required to be addressed to maintain stability of bfo-core.owl. In constrast, "Error" indicates that the bfo-core.owl file must be corrected before it is usable. 