import re, html
from pathlib import Path
from rdflib import Graph, RDF, RDFS, OWL, URIRef, Namespace, Literal

INPUT = Path("src/cco-merged/CommonCoreOntologiesMerged.ttl")
OUTPUT = Path("docs/index.html")
OUTPUT.parent.mkdir(parents=True, exist_ok=True)

SKOS = Namespace("http://www.w3.org/2004/02/skos/core#")
IAO  = Namespace("http://purl.obolibrary.org/obo/IAO_")
OBOINOWL = Namespace("http://www.geneontology.org/formats/oboInOwl#")

g = Graph()
g.parse(INPUT.as_posix(), format="turtle")

def local_id(iri: URIRef) -> str:
    s = str(iri)
    if "#" in s: return s.rsplit("#", 1)[1]
    return s.rstrip("/").rsplit("/", 1)[-1]

def label(iri: URIRef):
    for p in (RDFS.label, SKOS.prefLabel):
        o = g.value(iri, p)
        if isinstance(o, Literal): return str(o)
    return None

def definition(iri: URIRef):
    for p in (SKOS.definition, IAO["0000115"], OBOINOWL.hasDefinition):
        o = g.value(iri, p)
        if isinstance(o, Literal): return str(o)
    return None

def supers(iri: URIRef):
    return [str(o) for o in g.objects(iri, RDFS.subClassOf) if isinstance(o, URIRef)]

def domain(iri: URIRef):
    return [str(o) for o in g.objects(iri, RDFS.domain) if isinstance(o, URIRef)]

def range_(iri: URIRef):
    return [str(o) for o in g.objects(iri, RDFS.range) if isinstance(o, URIRef)]

def slugify(s: str) -> str:
    s = re.sub(r"[^A-Za-z0-9]+", "-", s).strip("-").lower()
    return s or "term"

def esc(s: str) -> str:
    return html.escape(s, quote=True)

classes = sorted({s for s in g.subjects(RDF.type, OWL.Class) if isinstance(s, URIRef)}, key=lambda x: str(x))
objprops = sorted({s for s in g.subjects(RDF.type, OWL.ObjectProperty) if isinstance(s, URIRef)}, key=lambda x: str(x))

def render_term(iri: URIRef, kind: str):
    L = label(iri) or local_id(iri)
    lid = local_id(iri)
    slug = slugify(L)
    dfn = definition(iri)
    sup = supers(iri) if kind == "class" else []
    dom = domain(iri) if kind == "objprop" else []
    rng = range_(iri) if kind == "objprop" else []
    out = []
    out.append(f'<div class="term" id="{esc(lid)}">')
    out.append(f'  <a class="anchor" id="{esc(slug)}"></a>')
    out.append(f'  <h3>{esc(L)} <small>({kind})</small></h3>')
    out.append(f'  <p><b>IRI:</b> <code>{esc(str(iri))}</code></p>')
    if dfn:
        out.append(f'  <p><b>Definition:</b> {esc(dfn)}</p>')
    if sup:
        out.append('  <p><b>Subclass of:</b> ' + ", ".join(f'<code>{esc(s)}</code>' for s in sup) + '</p>')
    if dom:
        out.append('  <p><b>Domain:</b> ' + ", ".join(f'<code>{esc(s)}</code>' for s in dom) + '</p>')
    if rng:
        out.append('  <p><b>Range:</b> ' + ", ".join(f'<code>{esc(s)}</code>' for s in rng) + '</p>')
    out.append('  <p class="permalinks"><b>Permalinks:</b> '
               f'<a href="#{esc(lid)}">#{esc(lid)}</a> '
               f'<a href="#{esc(slug)}">#{esc(slug)}</a></p>')
    out.append('</div>')
    return "\n".join(out)

html_head = """<!doctype html><html lang="en"><meta charset="utf-8">
<title>Common Core Ontologies (Merged)</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
body{font-family:system-ui,-apple-system,Segoe UI,Roboto,Ubuntu,Cantarell,Helvetica,Arial,sans-serif;line-height:1.5;margin:0;background:#fff;color:#111}
header{background:#1F2F46;color:#fff;padding:24px}
header h1{margin:0;font-size:24px}
main{display:grid;grid-template-columns:320px 1fr;gap:24px;padding:24px}
nav{position:sticky;top:0;max-height:100vh;overflow:auto;border-right:1px solid #eee;padding-right:16px}
section{padding-bottom:32px}
h2{margin-top:0}
.term{border-top:1px solid #eee;padding-top:16px;margin-top:16px}
small{color:#666}
code{background:#f5f1ea;padding:2px 4px;border-radius:4px}
.permalinks a{margin-right:8px;text-decoration:none}
.search{width:100%;padding:8px 10px;border:1px solid #ddd;border-radius:8px;margin-bottom:12px}
.group-list{font-size:.95em}
.group-list a{display:block;padding:4px 0;text-decoration:none}
footer{padding:32px;color:#6D7A84}
</style>
<header><h1>Common Core Ontologies (Merged)</h1></header>
<main>
<nav>
  <input class="search" placeholder="Filter by label or ID…" oninput="filterTerms(this.value)">
  <h2>Contents</h2>
  <div class="group-list"><b>Classes</b>
    __CLASS_LINKS__
  </div>
  <div class="group-list" style="margin-top:12px;"><b>Object Properties</b>
    __OBJPROP_LINKS__
  </div>
</nav>
<section id="content">
  <h2>Classes</h2>
  __CLASSES__
  <h2 style="margin-top:40px;">Object Properties</h2>
  __OBJPROPS__
</section>
</main>
<footer>Generated from CommonCoreOntologiesMerged.ttl</footer>
<script>
function filterTerms(q){
  q=(q||'').toLowerCase();
  document.querySelectorAll('.term').forEach(div=>{
    const text=div.innerText.toLowerCase();
    div.style.display = text.includes(q)?'block':'none';
  });
}
</script>
</html>"""

class_links = "\n".join(
    f'<a href="#{html.escape(local_id(c))}">{html.escape(label(c) or local_id(c))}</a>' for c in classes
)
objprop_links = "\n".join(
    f'<a href="#{html.escape(local_id(p))}">{html.escape(label(p) or local_id(p))}</a>' for p in objprops
)

classes_html = "\n".join(render_term(c, "class") for c in classes)
objprops_html = "\n".join(render_term(p, "objprop") for p in objprops)

page = (html_head
        .replace("__CLASS_LINKS__", class_links)
        .replace("__OBJPROP_LINKS__", objprop_links)
        .replace("__CLASSES__", classes_html)
        .replace("__OBJPROPS__", objprops_html))

OUTPUT.write_text(page, encoding="utf-8")
print(f"Wrote {OUTPUT}")
