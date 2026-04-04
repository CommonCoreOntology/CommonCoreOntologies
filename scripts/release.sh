#!/usr/bin/env bash
# CCO Release Preparation Pipeline
#
# Automates steps 5–9 of the CCO release process:
#   Phase 1 — BFO upstream diff
#   Phase 2 — Module diff (develop vs master)
#   Phase 3 — QC on 11 modules (consistency, OWL DL, SPARQL checks)
#   Phase 4 — Build CCOM + MRO, validate both
#   Phase 5 — Stamp version IRIs and versionInfo
#
# Manual steps after this script completes:
#   - git add / commit / PR to master
#   - Create GitHub release
#
# Usage:
#   make release VERSION=2.1 [DATE=YYYY-MM-DD]

set -euo pipefail

VERSION="${VERSION:-}"
DATE="${DATE:-$(date +%Y-%m-%d)}"
ROBOT="java -jar build/lib/robot.jar"
SPARQL_DIR=".github/deployment/sparql"
ARTIFACTS="build/artifacts"

# ── Validate inputs ───────────────────────────────────────────────────────────
if [[ -z "$VERSION" ]]; then
    echo "ERROR: VERSION is required.  Usage: make release VERSION=2.1 [DATE=YYYY-MM-DD]"
    exit 1
fi

# ── Helpers ───────────────────────────────────────────────────────────────────
phase() {
    echo ""
    printf '=%.0s' {1..62}; echo ""
    echo "  $1"
    printf '=%.0s' {1..62}; echo ""
}

pause() {
    echo ""
    echo "  REVIEW REQUIRED: $1"
    echo ""
    read -r -p "  Proceed? [y/N] " response
    [[ "$response" =~ ^[Yy]$ ]] || { echo ""; echo "Release aborted by user."; exit 1; }
}

qc_summary() {
    local input="$1"
    local label="$2"
    echo ""
    echo "  QC violation summary — $label:"
    for q in exactly_1_curated_in exactly_1_label curated_in_matches_ontology \
              iri_format_check min_1_eng_def annotation_whitespace \
              duplicate_label no_duplicate_declarations duplicate_iri_number; do
        $ROBOT query \
            --input "$input" \
            --query "$SPARQL_DIR/${q}.sparql" \
            "/tmp/rel_${q}.csv" 2>/dev/null
        rows=$(wc -l < "/tmp/rel_${q}.csv")
        printf "    %-40s %d violations\n" "${q}" "$((rows - 1))"
    done
}

echo ""
echo "  CCO Release Preparation — v${VERSION} / ${DATE}"
echo "  -----------------------------------------------"

# ── PHASE 1: BFO upstream diff ────────────────────────────────────────────────
phase "PHASE 1 — BFO upstream diff"
make bfo-diff
pause "Review $ARTIFACTS/bfo-upstream-diff.txt and confirm BFO status is acceptable."

# ── PHASE 2: Module diff (develop vs master) ──────────────────────────────────
phase "PHASE 2 — Module diff (develop vs master)"
echo "  Diff stats for each CCO module:"
echo ""
for f in \
    src/cco-modules/AgentOntology.ttl \
    src/cco-modules/ArtifactOntology.ttl \
    src/cco-modules/CurrencyUnitOntology.ttl \
    src/cco-modules/EventOntology.ttl \
    src/cco-modules/ExtendedRelationOntology.ttl \
    src/cco-modules/FacilityOntology.ttl \
    src/cco-modules/GeospatialOntology.ttl \
    src/cco-modules/QualityOntology.ttl \
    src/cco-modules/UnitsOfMeasureOntology.ttl \
    src/cco-modules/TimeOntology.ttl \
    src/cco-modules/InformationEntityOntology.ttl; do
    result=$(git diff --stat origin/master..HEAD -- "$f" 2>/dev/null || true)
    if [[ -n "$result" ]]; then
        echo "$result"
    else
        printf "    %-55s no changes\n" "$f"
    fi
done
pause "Confirm all module changes match expected commits and draft release notes."

# ── PHASE 3: QC on 11 modules ────────────────────────────────────────────────
phase "PHASE 3 — QC checks on 11 modules"

echo "  [3a] Consistency check (HermiT reasoner)..."
make reason-individual

echo ""
echo "  [3b] OWL 2 DL profile validation..."
make validate-profile-individual

echo ""
echo "  [3c] SPARQL quality checks..."
make test-individual

echo ""
echo "  QC reports written to $ARTIFACTS/"
echo "  NOTE: Reports contain results for the last processed file."
echo "        Open individual CSVs to review per-file violations."
pause "Review QC reports in $ARTIFACTS/ and confirm all issues are acceptable."

# ── PHASE 4: Build CCOM + MRO and validate ───────────────────────────────────
phase "PHASE 4 — Build CCOM and MRO"

echo "  [4a] Building CCOM..."
make build-ccom VERSION="$VERSION" DATE="$DATE"

echo ""
echo "  [4b] Building MRO..."
make build-mro VERSION="$VERSION" DATE="$DATE"

echo ""
echo "  Diff stats (generated files vs HEAD):"
git diff --stat src/cco-merged/CommonCoreOntologiesMerged.ttl 2>/dev/null || true
git diff --stat src/cco-extensions/ModalRelationOntology.ttl  2>/dev/null || true

echo ""
echo "  [4c] OWL 2 DL profile — CCOM..."
java -jar build/lib/robot.jar validate-profile \
    --profile DL \
    --input src/cco-merged/CommonCoreOntologiesMerged.ttl
echo "  CCOM: OWL 2 DL PASS"

echo ""
echo "  [4d] OWL 2 DL profile — MRO..."
java -jar build/lib/robot.jar validate-profile \
    --profile DL \
    --input src/cco-extensions/ModalRelationOntology.ttl
echo "  MRO: OWL 2 DL PASS"

echo ""
echo "  [4e] Consistency check — CCOM..."
make reason-combined

qc_summary "src/cco-merged/CommonCoreOntologiesMerged.ttl" "CCOM"
qc_summary "src/cco-extensions/ModalRelationOntology.ttl"  "MRO"

pause "Review CCOM and MRO diffs and QC summaries above. Confirm builds are correct."

# ── PHASE 5: Stamp version IRIs and versionInfo ───────────────────────────────
phase "PHASE 5 — Stamp version IRIs and versionInfo (v${VERSION} / ${DATE})"
make stamp-version VERSION="$VERSION" DATE="$DATE"

echo ""
echo "  Files stamped:"
git diff --stat src/cco-modules/ \
    src/cco-merged/CommonCoreOntologiesMerged.ttl \
    src/cco-extensions/ModalRelationOntology.ttl 2>/dev/null || true

pause "Confirm version stamping looks correct. This is the final state before commit."

# ── Done ─────────────────────────────────────────────────────────────────────
phase "RELEASE PREPARATION COMPLETE — v${VERSION} / ${DATE}"
echo "  All automated checks passed."
echo ""
echo "  Manual steps remaining:"
echo ""
echo "    1. Review full diff:       git diff"
echo "    2. Stage all changes:      git add -A"
echo "    3. Commit:                 git commit -m 'Release v${VERSION} (${DATE})'"
echo "    4. Open PR to master"
echo "    5. Create GitHub release"
echo "         Tag:    v${VERSION}"
echo "         Title:  CCO v${VERSION}"
echo "         Date:   ${DATE}  (must match version IRI)"
echo ""
