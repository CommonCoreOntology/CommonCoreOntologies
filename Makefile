# Common Core Ontology Pipeline
# Adapted from previous works; see header comments for full attribution.
# Contact - John Beverley <johnbeve@buffalo.edu>
#
# Key QC principle:
#   ROBOT must first merge the import closure using the XML catalog, then reason,
#   then verify/query against the merged/reasoned ontology.

### Explanation ###
# The workflow involves two major steps:
#   1. Individual ontology files are merged with their imports, reasoned over, and tested.
#   2. The CCO modules are merged into a single file, reasoned over, and tested again.

# ----------------------------------------
# Project essentials
config.ONTOLOGY_PREFIX := CCO
config.BASE_IRI := https://www.commoncoreontologies.org/
config.DEV_IRI := $(config.BASE_IRI)/dev
config.MODULES_IRI := $(config.DEV_IRI)/modules

# Local project directories
config.SOURCE_DIR := src
config.TEMP_DIR := build/artifacts
config.RELEASE_DIR := /
config.REPORTS_DIR := $(config.TEMP_DIR)
config.QUERIES_DIR := .github/deployment/sparql
config.LIBRARY_DIR := build/lib

# Catalogs
# Use MODULES_CATALOG for normal module import resolution.
# Keep MERGED_CATALOG for merged-release workflows if that catalog differs.
MODULES_CATALOG := src/cco-modules/catalog-v001.xml
MERGED_CATALOG  := src/cco-merged/catalog-v001.xml
CATALOG         := $(MODULES_CATALOG)

# Settings
config.FAIL_ON_TEST_FAILURES := false
config.REPORT_FAIL_ON := none

# Branch-specific configurations
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

# File names for dev branch
DEV_FILES = \
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
	src/cco-modules/InformationEntityOntology.ttl

# Local BFO copy used for stand-alone merged files and BFO diffing
BFO_LOCAL         := src/cco-imports/bfo-core.ttl
BFO_UPSTREAM_URL := http://purl.obolibrary.org/obo/bfo/2020/bfo-core.ttl
BFO_UPSTREAM_TMP := $(config.TEMP_DIR)/bfo-upstream-latest.ttl
BFO_DIFF_OUT     := $(config.TEMP_DIR)/bfo-upstream-diff.txt

# File for combined ontology
combined-file := $(config.SOURCE_DIR)/MergedAllCoreOntology.ttl
combined-reasoned-file := $(config.TEMP_DIR)/MergedAllCoreOntology-reasoned.ttl

# Other constants
TODAY := $(shell date +%Y-%m-%d)
TIMESTAMP := $(shell date +'%Y-%m-%d %H:%M')

# Default name for release
config.RELEASE_NAME := $(config.ONTOLOGY_PREFIX) $(TIMESTAMP)

# Generic files
EDITOR_BUILD_FILE = $(combined-reasoned-file) # "editors ontology module"
EDITOR_REPORT_FILE = $(config.REPORTS_DIR)/$(config.ONTOLOGY_PREFIX)-edit-report.tsv

# Generic directories to create if needed
REQUIRED_DIRS = $(config.LIBRARY_DIR) $(config.SOURCE_DIR) $(config.QUERIES_DIR) $(config.REPORTS_DIR)

# Test queries
QUERIES = $(wildcard $(config.QUERIES_DIR)/*.sparql)

# ROBOT
ROBOT_FILE := $(config.LIBRARY_DIR)/robot.jar

# ----------------------------------------
#### Targets / main "goals" of this Makefile
.PHONY: all
all: setup reason-individual test-individual build-combined reason-combined test-combined

# Setup target for creating necessary directories
.PHONY: setup
setup:
	mkdir -p $(REQUIRED_DIRS) src/ .github/deployment/sparql build/artifacts

# Download ROBOT JAR
$(ROBOT_FILE): | $(config.LIBRARY_DIR)
	curl -L -o $@ https://github.com/ontodev/robot/releases/download/v1.8.4/robot.jar
	chmod +x $@

# ----------------------------------------
# Individual module QC
#
# Each individual module is first merged with its import closure using the
# catalog, then reasoned, then verified. This prevents false orphan-class
# results caused by ROBOT querying only the asserted triples in a partial module.

.PHONY: reason-individual
reason-individual: $(ROBOT_FILE) | $(config.TEMP_DIR)
	for file in $(DEV_FILES); do \
		name=$$(basename "$$file" .ttl); \
		echo "Merging and reasoning on $$file..."; \
		java -jar $(ROBOT_FILE) merge \
			--catalog $(CATALOG) \
			--input "$$file" \
			--collapse-import-closure true \
			reason \
			--reasoner HermiT \
			--output "$(config.TEMP_DIR)/$$name-reasoned.ttl"; \
	done

.PHONY: validate-profile-individual
validate-profile-individual: $(ROBOT_FILE)
	for file in $(DEV_FILES); do \
		echo "Validating OWL DL profile for $$file with imports merged..."; \
		java -jar $(ROBOT_FILE) merge \
			--catalog $(CATALOG) \
			--input "$$file" \
			--collapse-import-closure true \
			validate-profile \
			--profile DL; \
	done

.PHONY: test-individual
test-individual: $(ROBOT_FILE) | $(config.REPORTS_DIR)
ifeq ($(QUERIES),)
	$(warning No query files found in $(config.QUERIES_DIR))
else
	for file in $(DEV_FILES); do \
		name=$$(basename "$$file" .ttl); \
		echo "Testing $$file with imports merged and inferred hierarchy materialized..."; \
		java -jar $(ROBOT_FILE) merge \
			--catalog $(CATALOG) \
			--input "$$file" \
			--collapse-import-closure true \
			reason \
			--reasoner HermiT \
			verify \
			--output-dir "$(config.REPORTS_DIR)/$$name" \
			--queries $(QUERIES) \
			--fail-on-violation false || true; \
	done
endif

# ----------------------------------------
# Combined ontology build and QC
#
# IMPORTANT:
#   This replaces the old `cat $(DEV_FILES) > $@` behavior.
#   Concatenating TTL files does not create a meaningful import-closed ontology
#   for ROBOT QC. Use ROBOT merge instead.

$(combined-file): $(DEV_FILES) $(BFO_LOCAL) $(ROBOT_FILE) | $(config.TEMP_DIR)
	java -jar $(ROBOT_FILE) merge \
		--catalog $(CATALOG) \
		$(foreach f,$(DEV_FILES),--input $(f)) \
		--input $(BFO_LOCAL) \
		--collapse-import-closure true \
		--output $@

.PHONY: build-combined
build-combined: $(combined-file)

.PHONY: reason-combined
reason-combined: $(combined-reasoned-file)

$(combined-reasoned-file): $(combined-file) $(ROBOT_FILE) | $(config.TEMP_DIR)
	java -jar $(ROBOT_FILE) reason \
		--input $(combined-file) \
		--catalog $(CATALOG) \
		--reasoner HermiT \
		--output $@

.PHONY: validate-profile-combined
validate-profile-combined: $(combined-file) | $(ROBOT_FILE)
	java -jar $(ROBOT_FILE) validate-profile \
		--profile DL \
		--input $(combined-file) \
		--catalog $(CATALOG)

.PHONY: test-combined
test-combined: $(combined-reasoned-file) | $(ROBOT_FILE) $(config.REPORTS_DIR)
ifeq ($(QUERIES),)
	$(warning No query files found in $(config.QUERIES_DIR))
else
	java -jar $(ROBOT_FILE) verify \
		--input $(combined-reasoned-file) \
		--catalog $(CATALOG) \
		--output-dir $(config.REPORTS_DIR) \
		--queries $(QUERIES) \
		--fail-on-violation false || true
endif

# ----------------------------------------
# Convenience query target
#
# Usage:
#   make query-combined QUERY=.github/deployment/sparql/orphan-query.sparql OUT=build/artifacts/orphans.tsv

QUERY ?=
OUT   ?= $(config.TEMP_DIR)/query-results.tsv

.PHONY: query-combined
query-combined: $(combined-reasoned-file) | $(ROBOT_FILE) $(config.TEMP_DIR)
	@if [ -z '$(QUERY)' ]; then \
		echo 'ERROR: QUERY is required. Usage: make query-combined QUERY=path/to/query.sparql [OUT=path/to/results.tsv]'; \
		exit 1; \
	fi
	java -jar $(ROBOT_FILE) query \
		--input $(combined-reasoned-file) \
		--query $(QUERY) \
		$(OUT)

# ----------------------------------------
# Reports

.PHONY: report-edit
report-edit: TEST_INPUT = $(EDITOR_BUILD_FILE)
report-edit: REPORT_FILE_INPUT = $(EDITOR_REPORT_FILE)
report-edit: report

.PHONY: output-release-filepath
output-release-filepath:
	@echo $(combined-file)

.PHONY: output-release-name
output-release-name:
	@echo $(config.RELEASE_NAME)

# ----------------------------------------
#### Test / test ontology with reasoners and queries

# Check for inconsistency.
# Optional usage:
#   make reason TEST_INPUT=path/to/file.ttl
.PHONY: reason
reason: $(TEST_INPUT) | $(ROBOT_FILE)
	java -jar $(ROBOT_FILE) reason \
		--input $(TEST_INPUT) \
		--catalog $(CATALOG) \
		--reasoner HermiT

# Test using specific queries.
# Optional usage:
#   make verify TEST_INPUT=path/to/file.ttl
.PHONY: verify
verify: $(TEST_INPUT) $(QUERIES) | $(config.QUERIES_DIR) $(config.REPORTS_DIR) $(ROBOT_FILE)
ifeq ($(QUERIES),)
	$(warning No query files found in $(config.QUERIES_DIR))
else
	java -jar $(ROBOT_FILE) verify \
		--input $(TEST_INPUT) \
		--catalog $(CATALOG) \
		--output-dir $(config.REPORTS_DIR) \
		--queries $(QUERIES) \
		--fail-on-violation false || true
endif

# Report using built-in ROBOT queries.
# Optional usage:
#   make report TEST_INPUT=path/to/file.ttl REPORT_FILE_INPUT=build/artifacts/report.tsv
.PHONY: report
report: $(TEST_INPUT) | $(config.REPORTS_DIR) $(ROBOT_FILE)
	java -jar $(ROBOT_FILE) report \
		--input $(TEST_INPUT) \
		--catalog $(CATALOG) \
		--labels true \
		--fail-on $(config.REPORT_FAIL_ON) \
		--print 10 \
		--output $(REPORT_FILE_INPUT)

# ----------------------------------------
#### Setup / configure Make to use with our project

MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:
.SECONDARY:

# Create any of these directories if they don't exist
$(REQUIRED_DIRS):
	mkdir -p $@

# Cleanup - Remove build and generated merged files
.PHONY: clean
clean:
	@[ "$(config.REPORTS_DIR)" ] || ( echo ">> config.REPORTS_DIR is not set"; exit 1 )
	rm -rf $(config.REPORTS_DIR)
	rm -f $(combined-file)

# ----------------------------------------
# BFO upstream diff

.PHONY: bfo-diff
bfo-diff: | $(config.TEMP_DIR)
	@echo "Fetching BFO upstream from $(BFO_UPSTREAM_URL)..."
	curl -sSL -o $(BFO_UPSTREAM_TMP) $(BFO_UPSTREAM_URL)
	@echo "Diffing local $(BFO_LOCAL) against upstream..."
	@if diff -u $(BFO_LOCAL) $(BFO_UPSTREAM_TMP) > $(BFO_DIFF_OUT) 2>&1; then \
		echo "BFO DIFF: No changes — local copy is in sync with upstream."; \
	else \
		echo "BFO DIFF: Changes detected! Review $(BFO_DIFF_OUT) before release."; \
		echo "--- Summary (added/removed lines) ---"; \
		echo "  Lines added  : $$(grep -c '^+[^+]' $(BFO_DIFF_OUT) || echo 0)"; \
		echo "  Lines removed: $$(grep -c '^-[^-]' $(BFO_DIFF_OUT) || echo 0)"; \
	fi
	@echo "Full diff written to $(BFO_DIFF_OUT)"

# ---------------------------------------------------------------------------
# release: Full release preparation pipeline (Steps 5–9 of CCO release process)
# ---------------------------------------------------------------------------

.PHONY: release
release: $(ROBOT_FILE) | $(config.TEMP_DIR)
	@if [ -z '$(VERSION)' ]; then \
		echo 'ERROR: VERSION is required. Usage: make release VERSION=2.1 [DATE=YYYY-MM-DD]'; \
		exit 1; \
	fi
	@VERSION='$(VERSION)' DATE='$(DATE)' bash scripts/release.sh

# ---------------------------------------------------------------------------
# T11 — stamp-version: Update owl:versionIRI and owl:versionInfo on all modules
# ---------------------------------------------------------------------------

VERSION ?=
DATE    ?= $(TODAY)

.PHONY: stamp-version
stamp-version:
	@if [ -z '$(VERSION)' ]; then \
		echo 'ERROR: VERSION is required. Usage: make stamp-version VERSION=2.1 [DATE=YYYY-MM-DD]'; \
		exit 1; \
	fi
	@echo "Stamping v$(VERSION) ($(DATE)) on all module files..."
	@for f in $(DEV_FILES); do \
		echo "  $$f"; \
		sed -i '' \
			-e 's|<https://www\.commoncoreontologies\.org/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/|<https://www.commoncoreontologies.org/$(DATE)/|g' \
			-e 's|"Version [^"]*"@en|"Version $(VERSION)"@en|g' \
			"$$f"; \
	done
	@echo "  src/cco-merged/CommonCoreOntologiesMerged.ttl"
	@sed -i '' \
		-e 's|<https://www\.commoncoreontologies\.org/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]/|<https://www.commoncoreontologies.org/$(DATE)/|g' \
		-e 's|"Version [^"]*"@en|"Version $(VERSION)"@en|g' \
		src/cco-merged/CommonCoreOntologiesMerged.ttl
	@echo "stamp-version complete: v$(VERSION) / $(DATE)"

# ---------------------------------------------------------------------------
# T12 — build-ccom: Rebuild CommonCoreOntologiesMerged.ttl via ROBOT merge
# ---------------------------------------------------------------------------

CCOM_MERGED  := src/cco-merged/CommonCoreOntologiesMerged.ttl
CCOM_IRI     := https://www.commoncoreontologies.org/CommonCoreOntologiesMerged
CCOM_COMMENT := A stand-alone file containing the eleven mid-level Common Core Ontologies plus BFO. Provided for use-cases where one file representing a specific release of CCO and its imports is desirable.
CCOM_LICENSE := BSD 3-Clause: https://github.com/CommonCoreOntology/CommonCoreOntologies/blob/master/LICENSE
CCOM_RIGHTS  := CUBRC Inc., see full license.

.PHONY: build-ccom
build-ccom: $(ROBOT_FILE) | $(config.TEMP_DIR)
	@if [ -z '$(VERSION)' ]; then \
		echo 'ERROR: VERSION is required. Usage: make build-ccom VERSION=2.1 [DATE=YYYY-MM-DD]'; \
		exit 1; \
	fi
	@echo "Merging 11 CCO modules + BFO via ROBOT merge..."
	java -jar $(ROBOT_FILE) merge \
		$(foreach f,$(DEV_FILES),--input $(f)) \
		--input $(BFO_LOCAL) \
		--catalog $(MERGED_CATALOG) \
		--collapse-import-closure true \
		--output $(config.TEMP_DIR)/ccom-raw.ttl
	@echo "Applying CCOM ontology header (IRI, version, metadata)..."
	java -jar $(ROBOT_FILE) annotate \
		--input $(config.TEMP_DIR)/ccom-raw.ttl \
		--remove-annotations \
		--ontology-iri $(CCOM_IRI) \
		--version-iri https://www.commoncoreontologies.org/$(DATE)/CommonCoreOntologiesMerged \
		--language-annotation rdfs:label "Common Core Ontologies Merged" en \
		--language-annotation rdfs:comment "$(CCOM_COMMENT)" en \
		--language-annotation http://purl.org/dc/terms/license "$(CCOM_LICENSE)" en \
		--language-annotation http://purl.org/dc/terms/rights "$(CCOM_RIGHTS)" en \
		--language-annotation owl:versionInfo "Version $(VERSION)" en \
		--language-annotation owl:versionInfo "Depends on http://purl.obolibrary.org/obo/bfo/2020/bfo-core.ttl, obtained $(DATE)." en \
		--output $(CCOM_MERGED)
	@echo "build-ccom complete: $(CCOM_MERGED)"

# ---------------------------------------------------------------------------
# T13 — build-mro: Rebuild ModalRelationOntology.ttl via ROBOT + Python
#
# Steps:
#   1. Merge all 11 CCO modules + BFO into one source file
#   2. Extract OPs + DPs with ALL annotations, domain/range, blank-node class
#      expressions (mro_extract.py — replaces robot filter which strips annotations)
#   3. SPARQL query generates old→new namespace mapping CSV
#   4. robot rename rewrites CCO + OBO namespaces to the MRO namespace
#   5. Python post-processor: fixes curated-in, adds root property,
#      wires top-level OPs, replaces ontology header
#   6. Copy final file to src/cco-extensions/ModalRelationOntology.ttl
#
# Requires: python3 with rdflib (pip install rdflib)
# Usage:    make build-mro VERSION=2.1 [DATE=YYYY-MM-DD]
# ---------------------------------------------------------------------------

MRO_OUT := src/cco-extensions/ModalRelationOntology.ttl

.PHONY: build-mro
build-mro: $(ROBOT_FILE) | $(config.TEMP_DIR)
	@if [ -z '$(VERSION)' ]; then \
		echo 'ERROR: VERSION is required. Usage: make build-mro VERSION=2.1 [DATE=YYYY-MM-DD]'; \
		exit 1; \
	fi
	@echo "=== MRO Step 1: Merging 11 CCO modules + BFO + FRO + MRO additions ==="
	java -jar $(ROBOT_FILE) merge \
		$(foreach f,$(DEV_FILES),--input $(f)) \
		--input $(BFO_LOCAL) \
		--input src/cco-extensions/FamilialRelationsOntology.ttl \
		--input src/cco-extensions/ModalRelationOntologyAdditions.ttl \
		--catalog $(CATALOG) \
		--collapse-import-closure true \
		--output $(config.TEMP_DIR)/mro-merged.ttl
	@echo "=== MRO Step 2: Extracting ObjectProperties + DatatypeProperties with all annotations ==="
	python3 scripts/mro_extract.py \
		--input  $(config.TEMP_DIR)/mro-merged.ttl \
		--output $(config.TEMP_DIR)/mro-filtered.ttl
	@echo "=== MRO Step 3: Generating namespace rename mapping CSV ==="
	java -jar $(ROBOT_FILE) query \
		--input $(config.TEMP_DIR)/mro-filtered.ttl \
		--query scripts/mro_rename.sparql \
		$(config.TEMP_DIR)/mro-rename-map.csv
	@echo "=== MRO Step 4: Applying namespace rename ==="
	java -jar $(ROBOT_FILE) rename \
		--input $(config.TEMP_DIR)/mro-filtered.ttl \
		--mappings $(config.TEMP_DIR)/mro-rename-map.csv \
		--output $(config.TEMP_DIR)/mro-renamed.ttl
	@echo "=== MRO Step 5: Python post-processing ==="
	python3 scripts/mro_postprocess.py \
		--input   $(config.TEMP_DIR)/mro-renamed.ttl \
		--output  $(config.TEMP_DIR)/mro-final.ttl \
		--version $(VERSION) \
		--date    $(DATE)
	@echo "=== MRO Step 6: Copying to $(MRO_OUT) ==="
	cp $(config.TEMP_DIR)/mro-final.ttl $(MRO_OUT)
	@echo "build-mro complete: $(MRO_OUT)"