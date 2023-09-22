## Staging for testing alignment with upcoming release of BFO2020. See [here](https://github.com/johnbeve/JB-Fork-BFO-2020/tree/master)
# Aligning CCO to BFO2020 Core
## Summary of Changes
1. The subset of RO is no longer imported. Five properties from CCO are deprecated. Four RO properties have no replacement. 
2. The following mapping is provided:
- http://purl.obolibrary.org/obo/BFO_0000050 [part of] > (conditional)  
http://purl.obolibrary.org/obo/BFO_0000176 [continuant part of]  
http://purl.obolibrary.org/obo/BFO_0000132 [occurrent part of]  
- http://purl.obolibrary.org/obo/BFO_0000051 [has part] > (conditional)  
http://purl.obolibrary.org/obo/BFO_0000178 [has continuant part]  
http://purl.obolibrary.org/obo/BFO_0000117 [has occurrent part]  
- http://purl.obolibrary.org/obo/BFO_0000054 [realized in] > (IRI same, label diff)  
	http://purl.obolibrary.org/obo/BFO_0000054 [has realization]  
- http://purl.obolibrary.org/obo/BFO_0000055 [realizes] > (IRI same, label same)  
	http://purl.obolibrary.org/obo/BFO_0000055 [realizes]  
- http://purl.obolibrary.org/obo/BFO_0000066 [occurs in] > (IRI same, label same)  
	http://purl.obolibrary.org/obo/BFO_0000066 [occurs in]  
- http://purl.obolibrary.org/obo/BFO_0000067 [contains process] >  
	http://purl.obolibrary.org/obo/BFO_0000183 [environs]  
- http://purl.obolibrary.org/obo/RO_0000052 [inheres in] > (IRI diff, label same)  
	http://purl.obolibrary.org/obo/BFO_0000197 [inheres in]  
- http://purl.obolibrary.org/obo/RO_0000053 [bearer of] > (IRI diff, label same)  
	http://purl.obolibrary.org/obo/BFO_0000196 [bearer of]  
- http://purl.obolibrary.org/obo/RO_0000056 [participates in] > (IRI same, label same)  
	http://purl.obolibrary.org/obo/BFO_0000056 [participates in]  
- http://purl.obolibrary.org/obo/RO_0000057 [has participant] > (IRI same, label same)  
	http://purl.obolibrary.org/obo/BFO_0000057 [has participant]  
- http://purl.obolibrary.org/obo/RO_0000058 [is concretized as] > (IRI same, label diff)  
	http://purl.obolibrary.org/obo/BFO_0000058 [is concretized by]  
- http://purl.obolibrary.org/obo/RO_0000059 [concretizes] > (IRI same, label same)  
	http://purl.obolibrary.org/obo/BFO_0000059 [concretizes]  
- http://purl.obolibrary.org/obo/RO_0000079 [function of] > (specific to general)  
	http://purl.obolibrary.org/obo/BFO_0000197 [inheres in]  
- http://purl.obolibrary.org/obo/RO_0000080 [quality of] > (specific to general)  
	http://purl.obolibrary.org/obo/BFO_0000197 [inheres in]  
- http://purl.obolibrary.org/obo/RO_0000081 [role of] > (specific to general)  
	http://purl.obolibrary.org/obo/BFO_0000197 [inheres in]  
- http://purl.obolibrary.org/obo/RO_0000085 [has function] >  (specific to general)  
	http://purl.obolibrary.org/obo/BFO_0000196 [bearer of]  
- http://purl.obolibrary.org/obo/RO_0000086 [has quality] > (specific to general)  
	http://purl.obolibrary.org/obo/BFO_0000196 [bearer of]  
- http://purl.obolibrary.org/obo/RO_0000087 [has role] > (specific to general)  
	http://purl.obolibrary.org/obo/BFO_0000196 [bearer of]  
- http://purl.obolibrary.org/obo/RO_0000091 [has disposition] > (specific to general)  
	http://purl.obolibrary.org/obo/BFO_0000196 [bearer of]  
- http://purl.obolibrary.org/obo/RO_0000092 [disposition of] > (specific to general)  
	http://purl.obolibrary.org/obo/BFO_0000197 [inheres in]  
- http://purl.obolibrary.org/obo/RO_0001015 [location of] > (IRI diff, label same)  
	http://purl.obolibrary.org/obo/BFO_0000124 [location of]  
- http://purl.obolibrary.org/obo/RO_0001025 [located in] > (IRI diff, label same)  
	http://purl.obolibrary.org/obo/BFO_0000171 [located in]  
- http://purl.obolibrary.org/obo/RO_0001018 [contained in] >  
	http://purl.obolibrary.org/obo/BFO_0000171 [located in]  
- http://purl.obolibrary.org/obo/RO_0001019 [contains] >  
  	http://purl.obolibrary.org/obo/BFO_0000124 [location of]  
- http://purl.obolibrary.org/obo/RO_0002350 [member of] >   
	http://purl.obolibrary.org/obo/BFO_0000129 [member part of]  
- http://purl.obolibrary.org/obo/RO_0002351 [has member] >  
	http://purl.obolibrary.org/obo/BFO_0000115 [has member part]  
- http://purl.obolibrary.org/obo/RO_0010001 [generically depends on] > (IRI diff, label same)  
	http://purl.obolibrary.org/obo/BFO_0000084 [generically depends on]  
- http://purl.obolibrary.org/obo/RO_0010002 [is carrier of] > (IRI diff, label same)  
	http://purl.obolibrary.org/obo/BFO_0000101 [is carrier of]  
- http://www.ontologyrepository.com/CommonCoreOntologies/occurs_on >  
	http://purl.obolibrary.org/obo/BFO_0000199 [occupies temporal region]  
- http://www.ontologyrepository.com/CommonCoreOntologies/is_starting_instant_of >  
	http://purl.obolibrary.org/obo/0000221 [first instant of]  
- http://www.ontologyrepository.com/CommonCoreOntologies/has_starting_instant >  
	http://purl.obolibrary.org/obo/0000222 [has first instant]  
- http://www.ontologyrepository.com/CommonCoreOntologies/is_ending_instant_of >  
	http://purl.obolibrary.org/obo/0000223 [last instant of]  
- http://www.ontologyrepository.com/CommonCoreOntologies/has_ending_instant >  
	http://purl.obolibrary.org/obo/0000224 [has last instant]  
- http://purl.obolibrary.org/obo/RO_0001000 [derives from] > NA  
- http://purl.obolibrary.org/obo/RO_0001001 [derives into] > NA  
- http://purl.obolibrary.org/obo/RO_0002000 [2D boundary of] > NA  
- http://purl.obolibrary.org/obo/RO_0002002 [has 2D boundary] > NA  

3. All role constraints are removed, a scope note is added to track what was deleted for users that may want to use.
   - The role constraints on subs of is_about / is_subject_of may stay, depending on consensus on a unified model for information in the CCO.
5. Removed the restriction on cco:GeospatialRegionBooundingBox hat uses cco:non_tangential_part. This is inconsistent with BFO2020, which adds disjointness between site, spatial region, and boundaries.
6. Added BFO_0000144 [process profile] (Confirm metadata, new definition, no use of has_process_profile)
7. Removed dubious parthood restrictions from cco:WiredCommunicationRelayArtifactFunction
8. has_process_part / is_part_of_process now subs of BFO_0000117 / BFO_0000132 [occurrent part] (confirm transitivity of parent not a problem)
9. is_site_of/occurs_at now subs of BFO_0000183 / BFO_0000066 [environs/occurs in], domain/range fixed to match definitions, now only bfo:site 
10. Changed the range and inverse for is_temporal_region_of. Range now matches definition (process or process boundary). Inverse is now BFO_0000199 (why doesn’t bfo have an inverse of for 199?)


- - - -
The Common Core Ontologies (CCO) comprise twelve ontologies that are designed to represent and integrate taxonomies of generic classes and relations across all domains of interest.

CCO is a mid-level extension of Basic Formal Ontology (BFO), an upper-level ontology framework widely used to structure and integrate ontologies in the biomedical domain (Arp, et al., 2015). BFO aims to represent the most generic categories of entity and the most generic types of relations that hold between them, by defining a small number of classes and relations. CCO then extends from BFO in the sense that every class in CCO is asserted to be a subclass of some class in BFO, and that CCO adopts the generic relations defined in BFO (e.g., has_part) (Smith and Grenon, 2004). Accordingly, CCO classes and relations are heavily constrained by the BFO framework, from which it inherits much of its basic semantic relationships.

The CCO provide semantics for concepts and relations that are used in most domains of interest. The utility of the CCO comes from preventing BFO-compliant domain-specific ontologies from needlessly duplicating common concepts or from forcing such ontologies to include concepts outside of their domain (e.g. organization in the Ontology of Biomedical Investigations).

This utility has been realized by a number of U.S. Government sponsored projects in which either existing BFO compliant ontologies were aligned to the CCO or domain ontologies were created by using the CCO as a starting point and adding classes and properties as needed.

The names of a sample of these domain ontologies are provided in the list below.

The U.S. Government holds Government Purpose Rights on all of these domain ontologies. To obtain one or more of these domain ontologies for a government purpose it will be necessary for a government representative to contact the government sponsor of the development of the ontology. CUBRC can facilitate these connections so if interested please use the contact link at the bottom of https://www.cubrc.org/index.php/data-science-and-information-fusion/ontology .

# Sample of Common Core Domain Ontology Extensions
Aircraft Ontology

Airforce Aircraft Maintenance Ontology

Army Universal Task List Ontology

Atmospheric Feature Ontology

Cyber Ontology

Hydrographic Feature Ontology

Legal and Criminal Act Ontology

Marine Corps Task List Ontology

Military Operations Ontology

Mission Planning Ontology

Occupation Ontology

Outerspace Ontology

Physiographic Feature Ontology

Sensor Ontology

Spacecraft Mission Ontology

Spacecraft Ontology

Space Event Ontology

Space Object Ontology

Transportation Infrastructure Ontology

Undersea Warfare Ontology

Watercraft Ontology
