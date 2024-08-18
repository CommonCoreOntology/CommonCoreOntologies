#### Common Core Ontology Pipeline
# Adapted from previous works; see header comments for full attribution.
# Contact - John Beverley <johnbeve@buffalo.edu>

### Explanation ###
# The workflow involves two major steps: first, individual ontology files are checked and tested.
# After passing, they are merged into a single file, which is then checked and tested again.

# ----------------------------------------
# Project essentials
config.ONTOLOGY_PREFIX := CCO
config.BASE_IRI := http://www.ontologyrepository.com/CommonCoreOntologies/Mid/
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

# Release version/date for main branch
RELEASE_DATE := $(shell date +%Y-%m-%d)
RELEASE_VERSION := v1.5

ifeq ($(BRANCH), main)
    # For main branch
    MAIN_FILE_NAME := MergedAllCoreOntology-$(RELEASE_VERSION)-$(RELEASE_DATE)
    config.ONTOLOGY_FILE := $(config.SOURCE_DIR)/$(MAIN_FILE_NAME).ttl
    config.ONTOLOGY_PREFIX := CCO
    config.ONTOLOGY-IRI := $(config.BASE_IRI)
else ifeq ($(BRANCH), dev)
    # For dev branch
    config.ONTOLOGY_FILE := $(config.SOURCE_DIR)/MergedAllCoreOntology.ttl
    config.ONTOLOGY_PREFIX := CCO-DEV
    config.ONTOLOGY-IRI := $(config.DEV_IRI)
endif

# Other constants
TODAY := $(shell date +%Y-%m-%d)
TIMESTAMP := $(shell date +'%Y-%m-%d %H:%M')

# Default name for release
config.RELEASE_NAME := $(config.ONTOLOGY_PREFIX) $(TIMESTAMP)

# Generic files
EDITOR_BUILD_FILE = $(config.ONTOLOGY_FILE) # "editors ontology module"
RELEASE_BUILD_FILE = $(config.ONTOLOGY_PREFIX)-$(RELEASE_DATE).ttl # "main release ontology module"

EDITOR_REPORT_FILE = $(config.REPORTS_DIR)/$(config.ONTOLOGY_PREFIX)-edit-report.tsv
RELEASE_REPORT_FILE = $(config.REPORTS_DIR)/$(config.ONTOLOGY_PREFIX)-release-report.tsv

# Generic directories to create if needed
REQUIRED_DIRS = $(config.LIBRARY_DIR) $(config.SOURCE_DIR) $(config.QUERIES_DIR) $(config.REPORTS_DIR)

# ----------------------------------------
#### Targets / main "goals" of this Makefile
.PHONY: all
all: setup reason-edit test-edit build-release reason-release test-release

# Setup target for creating necessary directories
.PHONY: setup
setup:
	mkdir -p $(REQUIRED_DIRS)

# Targets for dev branch - QC individual files and the combined file
dev-files := $(DEV_FILES)
combined-file := $(config.SOURCE_DIR)/MergedAllCoreOntology.ttl

# QC individual files
.PHONY: reason-individual test-individual
reason-individual: $(dev-files) | $(ROBOT_FILE)
	for file in $(dev-files); do \
		echo "Reasoning on $$file..."; \
		$(ROBOT) reason --input $$file --reasoner HermiT; \
	done

test-individual: $(dev-files) | $(ROBOT_FILE)
	for file in $(dev-files); do \
		echo "Testing $$file..."; \
		$(ROBOT) verify --input $$file --output-dir $(config.REPORTS_DIR) --queries $(QUERIES) --fail-on-violation $(config.FAIL_ON_TEST_FAILURES); \
	done

# Build combined file after individual files pass checks
$(combined-file): $(DEV_FILES)
	cat $(DEV_FILES) > $@

# Build and QC combined file
.PHONY: reason-combined test-combined
reason-combined: $(combined-file) | $(ROBOT_FILE)
	$(ROBOT) reason --input $(combined-file) --reasoner HermiT

test-combined: $(combined-file) | $(ROBOT_FILE)
	$(ROBOT) verify --input $(combined-file) --output-dir $(config.REPORTS_DIR) --queries $(QUERIES) --fail-on-violation $(config.FAIL_ON_TEST_FAILURES)

# Build and QC for release on main branch
build-release: $(RELEASE_BUILD_FILE)

.PHONY: reason-release test-release
reason-release: $(RELEASE_BUILD_FILE) | $(ROBOT_FILE)
	$(ROBOT) reason --input $(RELEASE_BUILD_FILE) --reasoner HermiT

test-release: $(RELEASE_BUILD_FILE) | $(ROBOT_FILE)
	$(ROBOT) verify --input $(RELEASE_BUILD_FILE) --output-dir $(config.REPORTS_DIR) --queries $(QUERIES) --fail-on-violation $(config.FAIL_ON_TEST_FAILURES)

.PHONY: report-edit report-release
report-edit: TEST_INPUT = $(EDITOR_BUILD_FILE)
report-edit: REPORT_FILE_INPUT = $(EDITOR_REPORT_FILE)
report-release: TEST_INPUT = $(RELEASE_BUILD_FILE)
report-release: REPORT_FILE_INPUT = $(RELEASE_REPORT_FILE)
report-edit report-release: report

.PHONY: output-release-filepath
output-release-filepath:
	@echo $(RELEASE_BUILD_FILE)

.PHONY: output-release-name
output-release-name:
	@echo $(config.RELEASE_NAME)

# ----------------------------------------
#### Test / test ontology with reasoners and queries
QUERIES = $(wildcard $(config.QUERIES_DIR)/*.sparql)

# Check for inconsistency
.PHONY: reason
reason: $(TEST_INPUT) | $(ROBOT_FILE)
	$(ROBOT) reason --input $(TEST_INPUT) --reasoner HermiT

# Test using specific queries
.PHONY: verify
verify: $(TEST_INPUT) $(QUERIES) | $(config.QUERIES_DIR) $(config.REPORTS_DIR) $(ROBOT_FILE)
ifeq ($(QUERIES),)
	$(warning No query files found in $(config.QUERIES_DIR))
else
	$(ROBOT) verify --input $(TEST_INPUT) --output-dir $(config.REPORTS_DIR) --queries $(QUERIES) --fail-on-violation $(config.FAIL_ON_TEST_FAILURES)
endif

# Report using built-in ROBOT queries
.PHONY: report
report: $(TEST_INPUT) | $(config.REPORTS_DIR) $(ROBOT_FILE)
	$(ROBOT) report --input $(TEST_INPUT) \
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

# ROBOT
# Download the robot.jar file
ROBOT_FILE := $(config.LIBRARY_DIR)/robot.jar
$(ROBOT_FILE): | $(config.LIBRARY_DIR)
	@echo "Creating directory $(config.LIBRARY_DIR) if it does not exist..."
	@mkdir -p $(config.LIBRARY_DIR) # Ensure directory exists
	@echo "Downloading robot.jar to $(ROBOT_FILE)..."
	@curl -L -o $@ https://github.com/ontodev/robot/releases/download/v1.8.4/robot.jar
	@echo "Download complete. Checking file existence..."
	@ls -la $(ROBOT_FILE)
	@echo "File contents:"
	@head -n 10 $(ROBOT_FILE)  # Display the first few lines of the file to check contents (if applicable)

ROBOT := java -jar $(ROBOT_FILE)

# Cleanup - Remove build and release files
.PHONY: clean
clean:
	@[ "${config.REPORTS_DIR}" ] || ( echo ">> config.REPORTS_DIR is not set"; exit 1 )
	rm -rf $(config.REPORTS_DIR)
	rm -rf $(RELEASE_BUILD_FILE) $(combined-file)

# Build merged file for main branch
$(RELEASE_BUILD_FILE): $(combined-file)
	cp $< $@
