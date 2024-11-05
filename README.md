# The Common Core Ontologies (CCO)

***IMPORTANT NOTE***
Starting with version 2.0, CCO IRIs are using a new namespace and have opaque local identifiers for all ontology elements.
See here for the mapping file.

## What is CCO?

The Common Core Ontologies (CCO) is a widely-used suite of eleven ontologies that consist of logically well-defined generic terms and relations among them reflecting entities across all domains of interest. 

These eleven ontologies constitute a [mid-level ontology](https://arxiv.org/abs/2404.17757) that extends from the [Basic Formal Ontology (BFO)](https://github.com/bfo-ontology/BFO-2020), an [ISO-standard](https://www.iso.org/standard/71954.html) top-level ontology. Whereas BFO represents only the most generic entities and relations, CCO contains classes that users will find common across data sets in many domains. Such classes include, for example, person, facility, date, employment, nickname, and measurement. 

Both BFO and CCO have been directed for use as "[baseline standards](https://www.buffalo.edu/news/releases/2024/02/department-of-defense-ontology.html)" for formal ontology development across the United States Department of Defense and Intelligence Community. 

CCO is currently being evaluated as a mid-level ontology standard by the IEEE Standards Association under [PAR3195.1](https://standards.ieee.org/ieee/3195.1/11026/). 

CCO itself is not intended to grow indefinitely by including content that is proper to particular domains. Users are encouraged to create their own domain extensions with content particular to those domains and publish these ontologies for re-use by others. 

## Contributing

Users may find the current release files for [CCO here](https://github.com/CommonCoreOntology/CommonCoreOntologies/releases/tag/v1.6-2024-09-26)

Developers may clone this repository and directly import AllCoreOntology.ttl in an ontology editor such as [Protégé](https://protege.stanford.edu/) to generate the merged version of the eleven CCO ontologies. Those who wish to forego managing imports may find a merged version of the files at src/cco-merged/

Users who wish to view the content of CCO in a web browser may view the current CCO release on the [Industrial Ontology Portal viewer](https://industryportal.enit.fr/ontologies/CCO)

For information regarding the management of CCO, tutorials, lists of projects that extend CCO, associated research, standards activities in the IEEE, and more, please navigate to the [CCO home page](https://commoncoreontology.github.io/cco-webpage/)

For bug fixes, developed suggestions for improvement, or minor updates, please open an issue using the template [here](https://github.com/CommonCoreOntology/CommonCoreOntologies/issues) 

For more open-ended discussion, general questions, or compliments, please navigate to the discussion board [here](https://github.com/CommonCoreOntology/CommonCoreOntologies/discussions)

## Who Oversees CCO Today?

CCO is overseen by a governance board and a developers group. Our members come from academia, government, US national laboratories, and commercial industry. We offer multiple forums for feedback and discussion. 

For more information about the governance of CCO, please navigate to the [Common Core Ontologies home page.](https://commoncoreontology.github.io/cco-webpage/board/)

## The Common Core Ontologies

- **Geospatial Ontology** - An ontology whosse scope is the representation of sites, spatial regions, and other entities, especially those that are located near the surface of Earth, as well as the relations that hold between them.
- **Information Entity Ontology** - An ontology whose scope is the representation of generic types of information as well as the relationships between information and other entities.
- **Event Ontology** - An ontology whose scope is the representation of processual entities, especially those performed by agents, that occur within multiple domains.
- **Time Ontology**	- An ontology whose scope is the representation of temporal regions and the relations that hold between them.
- **Agent Ontology** - An ontology whose scope is the representation of represent agents, especially persons and organizations, and their roles.
- **Quality Ontology**	- An ontology whose scope is the representation of a range of attributes of entities especially qualities, realizable entities, and process profiles.
- **Units of Measure Ontology**	- An ontology whose scope is the representation of standard measurement units that are used when measuring various attributes of entities.
- **Currency Unit Ontology** - An ontology whose scope is the representation of currencies that are issued and used by countries.
- **Facility Ontology** - An ontology whose scope is the representation of buildings and campuses that are designed to serve some specific purpose, and which are common to multiple domains.
- **Artifact Ontology**	- An ontology whose scope is the representation of artifacts that are common to multiple domains along with their models, specifications, and functions.
- **Extended Relation Ontology** - An ontology whose scope is the representation of the relations that hold between entities at the level of the mid-level Common Core Ontologies.

## The Contents of this Repository

* **documentation** - This directory contains the ModalRelationOntology.ttl.
	* **archive** 
		* **legacy documentation** - Contains documentation concerning previous versions of CCO, a list of obsoleted terms, changefiles for releases, as well as xlsx glossaries for each previous release. 
		* **previous-versions** - Contains previous releases of CCO, beginning with version 1.3. 
	* **contributing** 
		* **contributing** - Contains guidance for making contributions to the CCO repository.
		* **github overview** - Contains guidance for using git and Github with Visual Studio Code, command lines, and GitHub Desktop.
	* **design patterns** - Contains common design patterns for CCO, motivated by specific use cases, characterized by competency questions, and accompanied by serialization in RDF.  
	* **images** - Contains images used in this repository.
	* **user guides** - Contains user guides for: ontology developers, software developers and subject matter experts.
* **src**
	* **cco-merged** - Contains the current CCO merged release file and an import file that is used to generate the merged CCO file. 
	* **cco-modules** - Contains versions of the 11 CCO modules.
	* **cco extensions** - Contains versions of CCO extensions maintained by the governance board, such as the Modal Relations Ontology. 
* **.github** 	- This directory contains files needed to support automated GitHub actions. 
	* **deployment** 	
		* **sparql** - Contains sparql files used in quality control checks during the development process. 
		* **ontology-diff-files** - Contains ontology-diff-files, which Mark can tell you more about. 
		* **mappings** - Contains mappings between content in CCO and other ontologies. 
	* **templates** - Contains templates used to create issues and discussion topics. 
	* **workflows** - Contains release management files needed for GitHub Actions. 
