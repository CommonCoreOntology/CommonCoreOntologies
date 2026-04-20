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
    