# The Common Core Ontologies (CCO)

## What is CCO?

The Common Core Ontologies (CCO) is a widely-used, ontology suite comprised of eleven mid-level ontologies that are designed to represent and integrate taxonomies of generic classes and relations across all domains of interest. 

These eleven ontologies constitute a [mid-level extension](https://arxiv.org/abs/2404.17757) of [Basic Formal Ontology (BFO)](https://github.com/bfo-ontology/BFO-2020), an [ISO-standard](https://www.iso.org/standard/71954.html) top-level ontology. Whereas BFO represents only the most generic entities and relations, CCO contains classes that users will find common across data sets in many domains. Such classes include, for example, person, facility, date, employment, nickname, and measurement. 

The Common Core Ontologies make it easier to use the top-level ontology content provided by BFO, and they prevent BFO-compliant domain-specific ontologies from duplicating common concepts. Many organizations within the U.S. Government have found this useful as they seek a coordinated strategy among independent ontology efforts.

As a mid-level suite of ontologies, the Common Core Ontologies are not intended to be extended indefinitely into particular domains. Users are encouraged to create their own domain extensions with content particular to those domains and publish these ontologies for re-use by others. 

## Getting Started

Users who wish to view the content of CCO in a web browser may view the current CCO release on the [Industrial Ontology Portal viewer](https://industryportal.enit.fr/ontologies/CCO)

Developers may clone this repository and directly import AllCoreOntology.ttl in an ontology editor such as [Protégé](https://protege.stanford.edu/) to generate the merged version of the eleven CCO ontologies. Those who wish to forego managing imports may find a merged version of the files at src/cco-merged/

## Who Oversees CCO Today?

CCO is overseen by a governance board and a developers group. Our members come from academia, government, US national laboratories, and commercial industry. We offer multiple forums for feedback and discussion. 

For more information about the governance of CCO, please navigate to the [Common Core Ontologies home page.](https://commoncoreontology.github.io/cco-webpage/board/)

## The Common Core Ontologies

- **Geospatial Ontology**	- An ontology who scope is the representation of sites, spatial regions, and other entities, especially those that are located near the surface of Earth, as well as the relations that hold between them.
- **Information Entity Ontology** - An ontology who scope is the representation of generic types of information as well as the relationships between information and other entities.
- **Event Ontology** - An ontology who scope is the representation of processual entities, especially those performed by agents, that occur within multiple domains.
- **Time Ontology**	- An ontology who scope is the representation of temporal regions and the relations that hold between them.
- **Agent Ontology** - An ontology who scope is the representation of represent agents, especially persons and organizations, and their roles.
- **Quality Ontology**	- An ontology who scope is the representation of a range of attributes of entities especially qualities, realizable entities, and process profiles.
- **Units of Measure Ontology**	- An ontology who scope is the representation of standard measurement units that are used when measuring various attributes of entities.
- **Currency Unit Ontology**	- An ontology who scope is the representation of currencies that are issued and used by countries.
- **Facility Ontology** - An ontology who scope is the representation of buildings and campuses that are designed to serve some specific purpose, and which are common to multiple domains.
- **Artifact Ontology**	- An ontology who scope is the representation of artifacts that are common to multiple domains along with their models, specifications, and functions.
- **Extended Relations Ontology**	- An ontology who scope is the representation of the relations that hold between entities at the level of the mid-level Common Core Ontologies.

## The Contents of this Repository

* **archive** 
	* **legacy documentation** - Contains documentation concerning previous versions of CCO, a list of obsoleted terms, changefiles for releases, as well as xlsx glossaries for each previous release. 
	* **previous-versions** - Contains previous releases of CCO, beginning with version 1.3. 
* **cco extensions** 	
	* **Modal Relations Ontology** - The file contains modal counterparts to the object and data properties contained in CCO files and the bfo-core file.
* **documentation** 	- This directory contains the ModalRelationOntology.ttl.
	* **user guides** - Contains user guides for: ontology developers, software developers and subject matter experts.
	* **images** - Contains images used in this repository.
	* **design patterns** - Contains common design patterns for CCO, motivated by specific use cases, characterized by competency questions, and accompanied by serialization in RDF.  
* **src**
	* **cco-merged** - This directory contains the current CCO merged release file and an import file that is used to generate the merged CCO file. 
	* **cco-modules** - This directory contains current releases of the 11 CCO modules.
* **workflow** 	
	* **sparql** - This directory contains sparl files used in quality control checks during the development process. 
	* **ontology-diff-files** - This directory contains ontology-diff-files, which Mark can tell you more about. 
	* **mappings** - This directory contains mappings between content in CCO and other ontologies. 
* **.github** 	- This directory contains files needed to support automated GitHub actions. 

## Getting Involved

For information regarding the management of CCO, tutorials, lists of projects that extend CCO, associated research, standards activities in the IEEE, and more, please navigate to the [CCO home page](https://commoncoreontology.github.io/cco-webpage/)

For bug fixes, developed suggestions for improvement, or minor updates, please open an issue using the template [here](https://github.com/CommonCoreOntology/CommonCoreOntologies/issues) 

For more open-ended discussion, general questions, or compliments, please navigate to the discussion board [here](https://github.com/CommonCoreOntology/CommonCoreOntologies/discussions)