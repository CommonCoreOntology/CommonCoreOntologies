# Common Core Ontology Pipeline
# Adapted from previous works; see header comments for full attribution.
# Contact - John Beverley <johnbeve@buffalo.edu>

### Explanation ###
# The workflow involves two major steps: first, individual ontology files are checked and tested.
# After passing, they are merged into a single file, which is then checked and tested again.

# ----------------------------------------
# Project essentials
config.ONTOLOGY_PREFIX := CCO
config.BASE_IRI := https://www.commoncoreontologies.org/
config.DEV_IRI := $(config.BASE_IRI)/dev
config.MODULES_IRI := $(config.DEV_IRI)/modules

# Local project directories
config.SOURCE_DIR := src/
config.TEMP_DIR := build/artifacts
config.RELEASE_DIR := /
config.REPORTS_DIR := $(config.TEMP_DIR)
config.QUERIES_DIR := .github/deployment/sparql
config.LIBRARY_DIR := build/lib

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

# File for combined ontology
combined-file := $(config.SOURCE_DIR)/MergedAllCoreOntology.ttl

# Other constants
TODAY := $(shell date +%Y-%m-%d)
TIMESTAMP := $(shell date +'%Y-%m-%d %H:%M')

# Default name for release
config.RELEASE_NAME := $(config.ONTOLOGY_PREFIX) $(TIMESTAMP)

# Generic files
EDITOR_BUILD_FILE = $(combined-file) # "editors ontology module"

EDITOR_REPORT_FILE = $(config.REPORTS_DIR)/$(config.ONTOLOGY_PREFIX)-edit-report.tsv

# Generic directories to create if needed
REQUIRED_DIRS = $(config.LIBRARY_DIR) $(config.SOURCE_DIR) $(config.QUERIES_DIR) $(config.REPORTS_DIR)

# ----------------------------------------
#### Targets / main "goals" of this Makefile
.PHONY: all
all: setup bfo-diff stamp-version reason-individual test-individual build-combined reason-combined test-combined build-ccom

# Setup target for creating necessary directories
.PHONY: setup
setup:
	mkdir -p $(REQUIRED_DIRS) src/ .github/deployment/sparql build/artifacts

# Targets for dev branch - QC individual files and the combined file

# Download ROBOT JAR
ROBOT_FILE := $(config.LIBRARY_DIR)/robot.jar
$(ROBOT_FILE): | $(config.LIBRARY_DIR)
	curl -L -o $@ https://github.com/ontodev/robot/releases/download/v1.8.4/robot.jar
	chmod +x $@

# Reason individual files
.PHONY: reason-individual
reason-individual: $(ROBOT_FILE)
	for file in $(DEV_FILES); do \
		echo "Reasoning on $$file..."; \
		java -jar $(ROBOT_FILE) reason --input $$file --catalog src/cco-modules/catalog-v001.xml --reasoner HermiT; \
	done

# Test individual files
.PHONY: test-individual
test-individual: $(ROBOT_FILE)
	for file in $(DEV_FILES); do \
		echo "Testing $$file..."; \
		java -jar $(ROBOT_FILE) verify --input $$file --output-dir $(config.REPORTS_DIR) --queries $(QUERIES) --fail-on-violation false || true; \
	done

# Build combined file after individual files pass checks
$(combined-file): $(DEV_FILES)
	cat $(DEV_FILES) > $@

# Build and QC combined file
.PHONY: build-combined
build-combined: $(combined-file)

.PHONY: reason-combined test-combined
reason-combined: $(combined-file) | $(ROBOT_FILE)
	java -jar $(ROBOT_FILE) reason --input $(combined-file) --catalog src/cco-modules/catalog-v001.xml --reasoner HermiT

test-combined: $(combined-file) | $(ROBOT_FILE)
	java -jar $(ROBOT_FILE) verify --input $(combined-file) --output-dir $(config.REPORTS_DIR) --queries $(QUERIES) --fail-on-violation false || true

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
QUERIES = $(wildcard $(config.QUERIES_DIR)/*.sparql)

# Check for inconsistency
.PHONY: reason
reason: $(TEST_INPUT) | $(ROBOT_FILE)
	java -jar $(ROBOT_FILE) reason --input $(TEST_INPUT) --reasoner HermiT

# Test using specific queries
.PHONY: verify
verify: $(TEST_INPUT) $(QUERIES) | $(config.QUERIES_DIR) $(config.REPORTS_DIR) $(ROBOT_FILE)
ifeq ($(QUERIES),)
	$(warning No query files found in $(config.QUERIES_DIR))
else
	java -jar $(ROBOT_FILE) verify --input $(TEST_INPUT) --output-dir $(config.REPORTS_DIR) --queries $(QUERIES) --fail-on-violation false || true
endif

# Report using built-in ROBOT queries
.PHONY: report
report: $(TEST_INPUT) | $(config.REPORTS_DIR) $(ROBOT_FILE)
	java -jar $(ROBOT_FILE) report --input $(TEST_INPUT) \
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

# Cleanup - Remove build and release files
.PHONY: clean
clean:
	@[ "${config.REPORTS_DIR}" ] || ( echo ">> config.REPORTS_DIR is not set"; exit 1 )
	rm -rf $(config.REPORTS_DIR)
	rm -rf $(combined-file)

BFO_LOCAL   := src/cco-imports/bfo-core.ttl
BFO_UPSTREAM_URL := http://purl.obolibrary.org/obo/bfo/2020/bfo-core.ttl
BFO_UPSTREAM_TMP := $(config.TEMP_DIR)/bfo-upstream-latest.ttl
BFO_DIFF_OUT := $(config.TEMP_DIR)/bfo-upstream-diff.txt

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
		--catalog src/cco-merged/catalog-v001.xml \
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
