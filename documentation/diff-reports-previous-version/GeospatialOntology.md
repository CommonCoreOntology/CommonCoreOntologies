# Ontology comparison

## Left
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/GeospatialOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-02-14/GeospatialOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/old/GeospatialOntology.ttl`

## Right
- Ontology IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/GeospatialOntology`
- Version IRI: `http://www.ontologyrepository.com/CommonCoreOntologies/Mid/2024-02-14/GeospatialOntology`
- Loaded from: `file:/Users/markjensen/Documents/GitHub/CommonCoreOntologies/src/cco-modules/GeospatialOntology.ttl`

### Ontology imports 



### Ontology annotations 
#### Removed
- [license](http://purl.org/dc/terms/license) [BSD-3-Clause](https://opensource.org/licenses/BSD-3-Clause) 

#### Added
- [license](http://purl.org/dc/terms/license) "BSD 3-Clause: https://github.com/CommonCoreOntology/CommonCoreOntologies/blob/master/LICENSE"@en 

- [rights](http://purl.org/dc/terms/rights) "CUBRC Inc., see full license."@en 


### Continent `http://www.ontologyrepository.com/CommonCoreOntologies/Continent`
#### Removed
- [Continent](http://www.ontologyrepository.com/CommonCoreOntologies/Continent) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Geospatial Region bounded by any of the Earth's main continuous expanses of land."@en 

#### Added
- [Continent](http://www.ontologyrepository.com/CommonCoreOntologies/Continent) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Geospatial Region that is bounded by any of the Earth's main continuous expanses of land."@en 


### Geospatial Ellipse `http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialEllipse`
#### Removed
- [Geospatial Ellipse](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialEllipse) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Geospatial Boundary that is formed by following a symmetric arc between four vertices which are connected to the center point of the ellipse via a straight line."@en 

- [Geospatial Ellipse](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialEllipse) SubClassOf [Geospatial Line String](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialLineString) 

#### Added
- [Geospatial Ellipse](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialEllipse) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A One-Dimensional Geospatial Boundary that is formed by following a symmetric arc between four vertices which are connected to the center point of the ellipse via a straight line."@en 

- [Geospatial Ellipse](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialEllipse) SubClassOf [One-Dimensional Geospatial Boundary](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialBoundary) 


### Geospatial Error Region `http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialErrorRegion`
#### Removed
- [Geospatial Error Region](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialErrorRegion) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Geospatial Boundary that bounds some Geospatial Region according to probability estimations for locating some object within it."@en 

#### Added
- [Geospatial Error Region](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialErrorRegion) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A One-Dimensional Geospatial Boundary that bounds some Geospatial Region according to probability estimations for locating some object within it."@en 


### Geospatial Line String `http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialLineString`
#### Removed
- [Geospatial Line String](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialLineString) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Geospatial Boundary that has two or more Geospatial Positions as vertices, where each vertex is connected to only one other vertex by a straight line."@en 

#### Added
- [Geospatial Line String](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialLineString) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A One-Dimensional Geospatial Boundary that has two or more Geospatial Positions as vertices, where each vertex is connected to only one other vertex by a straight line."@en 


### Geospatial Location `http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialLocation`
#### Removed
- [Geospatial Location](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialLocation) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Geospatial Region at which an Entity or Event is located."@en 

#### Added
- [Geospatial Location](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialLocation) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Geospatial Region that is at which an Entity or Event is located."@en 


### Geospatial Position `http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialPosition`
#### Removed
- [Geospatial Position](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialPosition) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A zero-dimensional continuant fiat boundary that is at or near the surface of the Earth and fixed according to some Geospatial Coordinate Reference System."@en 

#### Added
- [Geospatial Position](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialPosition) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Fiat Point that is at or near the surface of the Earth and fixed according to some Geospatial Coordinate Reference System."@en 


### Geospatial Region `http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialRegion`
#### Removed
- [Geospatial Region](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialRegion) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Site at or near the surface of the Earth."@en 

#### Added
- [Geospatial Region](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialRegion) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Site that is at or near the surface of the Earth."@en 


### One-Dimensional Geospatial Boundary `http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialBoundary`
#### Removed
- [One-Dimensional Geospatial Boundary](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialBoundary) [label](http://www.w3.org/2000/01/rdf-schema#label) "Geospatial Boundary"@en 

- [One-Dimensional Geospatial Boundary](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialBoundary) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A One-Dimensional Continuant Fiat Boundary that is a boundary of some Geospatial Region."@en 

#### Added
- [One-Dimensional Geospatial Boundary](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialBoundary) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Fiat Line that is a boundary of some Geospatial Region."@en 

- [One-Dimensional Geospatial Boundary](http://www.ontologyrepository.com/CommonCoreOntologies/GeospatialBoundary) [label](http://www.w3.org/2000/01/rdf-schema#label) "One-Dimensional Geospatial Boundary"@en 


### Pitch Axis `http://www.ontologyrepository.com/CommonCoreOntologies/PitchAxis`
#### Removed
- [Pitch Axis](http://www.ontologyrepository.com/CommonCoreOntologies/PitchAxis) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Axis of Rotation that passes through the center of an object's Mass from one side of the object to the other and is perpendicular to the direction of the object's motion."@en 

#### Added
- [Pitch Axis](http://www.ontologyrepository.com/CommonCoreOntologies/PitchAxis) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "An Axis of Rotation that passes through the center of an object's Mass and is perpendicular both to the direction of the object's motion and to the object's Yaw Axis."@en 


### Sea Level `http://www.ontologyrepository.com/CommonCoreOntologies/SeaLevel`
#### Removed
- [Sea Level](http://www.ontologyrepository.com/CommonCoreOntologies/SeaLevel) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A two-dimensional continuant fiat boundary that divides the spheroid composed of Earth and its atmosphere at some point that corresponds to the mean level of calm water in the Earth&rsquo;s oceans."@en 

#### Added
- [Sea Level](http://www.ontologyrepository.com/CommonCoreOntologies/SeaLevel) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Fiat Surface that divides the spheroid composed of Earth and its atmosphere at some point that corresponds to the mean level of calm water in the Earth&rsquo;s oceans."@en 


### Subcontinent `http://www.ontologyrepository.com/CommonCoreOntologies/Subcontinent`
#### Removed
- [Subcontinent](http://www.ontologyrepository.com/CommonCoreOntologies/Subcontinent) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Geospatial Region bounded by a large, relatively self-contained landmass forming a subdivision of a Continent."@en 

#### Added
- [Subcontinent](http://www.ontologyrepository.com/CommonCoreOntologies/Subcontinent) [definition](http://www.ontologyrepository.com/CommonCoreOntologies/definition) "A Geospatial Region that is bounded by a large, relatively self-contained landmass forming a subdivision of a Continent."@en 
