# Pattern Name
Facility Location

# Intent

To represent location relationships where material entities (e.g., facilities, equipment, infrastructure) are situated within progressively larger geographic regions or sites (e.g., building → campus → city → state → country), enabling multi-level location queries and reasoning. The specific entity types and site hierarchies shown are examples. This pattern generalizes to any material entity that can be located at sites, and any hierarchical organization of sites.

# Competency Questions

1. Where is a specific facility located?
2. What bigger site is this facility located in, and are there smaller sites that the facility is located in that are also located in the bigger site?
3. What are all the facilities located within a particular site?

# Structure

Represents sites as locations and use of the located_in relation.

Helps with show how non-transitive relation can be used to do a query that acts transitively.

Visual model through mermaid and png.

*Note: Entity types and location hierarchies shown are illustrative examples. This pattern applies to any material entities and site taxonomies relevant to your domain.*
```mermaid
flowchart BT
    A@{ label: "<font color=\"#000000\">Facility 1</font>" } -- LocatedIn<br>BFO_0000171 --> B@{ label: "<font color=\"#000000\">City 1</font>" }
    B -- LocatedIn<br>BFO_0000171 --> C@{ label: "<font color=\"#000000\">State 1</font>" }
    A -- rdf:type --> D@{ label: "<span style=\"color:black\"><b>Facility<br>ont00000192</b></span><br>" }
    B -- rdf:type --> E@{ label: "<span style=\"color:black\"><b>Site<br>BFO_0000029</b></span><br>" }
    C -- rdf:type --> E
    A -. rdfs:label .-> F["<i>&quot;Building 1&quot;</i>"]
    B -. rdfs:label .-> G["<i>&quot;NY City&quot;</i>"]
    C -. rdfs:label .-> H["<i>&quot;NY State&quot;</i>"]

    subgraph Legend[" "]
    direction LR
    LL[ ] --> |relation| LL2[ ]
    LD[ ] -.-> |data property| LD2[ ]
        AA["Individual"]
    BB["<b>Class</b>"]
    CC["<i>&quot;literal&quot;</i>"]
    end

    A ~~~ Legend

    A@{ shape: rect}
    B@{ shape: rect}
    C@{ shape: rect}
    D@{ shape: rect}
    E@{ shape: rect}
    F@{ shape: rect}
    G@{ shape: rect}
    H@{ shape: rect}
    A:::purple
    B:::purple
    C:::purple
    D:::yellow
    E:::yellow
    F:::literal
    G:::literal
    H:::literal
    AA:::purple
    BB:::yellow
    CC:::literal
    LL:::invisible
    LL2:::invisible
    LD:::invisible
    LD2:::invisible
    classDef yellow fill:#ffe680,color:#7a6000,stroke:#c8a800
    classDef purple fill:#dbc9ef,color:#000000,stroke:#9b7fc7
    classDef literal fill:none,stroke:none,color:#555555,font-style:italic
    classDef invisible fill:none,stroke:none,color:none,width:0px
    
```

# File Structure
```
facility-location/
├── README.md
├── mermaid/
│   ├── FacilityLocation.md        # Mermaid source file
│   └── FacilityLocation.png        # Exported PNG diagram
└── sparql/
    ├── CQ1.sparql     # Where is a specific facility located?
    ├── CQ2.sparql        # What larger/smaller sites contain this facility?
    ├── CQ3.sparql    # What facilities are within a particular site?
    └── example.ttl                  # Test data for SPARQL queries
```

## File Descriptions

### mermaid/
| File | Description |
|------|-------------|
| `FacilityLocation.md` | Mermaid diagram source showing the pattern structure |
| `FacilityLocation.png` | PNG export of the diagram for documentation |

### sparql/
| File | Competency Question |
|------|---------------------|
| `CQ1.sparql` | Where is a specific facility located? |
| `CQ2.sparql` | What bigger site is this facility located in, and are there smaller sites that the facility is located in that are also located in the bigger site? |
| `CQ3.sparql` | What are all the facilities located within a particular site? |
| `example.ttl` | Turtle file with test instances (states, cities, campuses, buildings, facilities) |

# Additional Notes

- Related pattern: Geospatial Coordinate Pattern
- Key classes: `obo:BFO_0000029` (Site), `cco:ont00000192` (Facility)
- Key property: `obo:BFO_0000171` (located in)

