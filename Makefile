#### Common Core Ontology Pipeline
# Adapted from https://github.com/tmprd/ontology-pipeline/blob/master/Makefile by Tim Prudhomme <tmprdh@gmail.com>, which was heavily adapted from https://github.com/obi-ontology/obi/blob/master/Makefile by James Overton <james@overton.ca>.
# Contact - John Beverley <johnbeve@buffalo.edu>

### Explanation ###
# When a branch is merged into the develop branch, quality control checks based on the ELK reasoner and queries in the workflow/sparql directory. If these checks are passed, then the changes will be combined into a merged version of CCO, where similar QC checks will be conducted. If successful, updates to specific CCO modules and the merged CCO file on develop will be made. 
# When the develop branch is to be merged into main, QC checks will again be conducted on each of the CCO modules and the merged CCO file. Release date updates are handled automatically. Version number must be managed manually. 

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
config.QUERIES_DIR := workflow/sparql
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
    src/cco-modules/ExtendedRelationsOntology.ttl \
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
REQUIRED_DIRS = $(config.TEMP_DIR) $(config.LIBRARY_DIR) $(config.SOURCE_DIR) $(config.QUERIES_DIR) $(config.REPORTS_DIR)

# ----------------------------------------
#### Targets / main "goals" of this Makefile
.PHONY: all
all: reason-edit test-edit build-release reason-release test-release

# Targets for dev branch - QC individual files and the combined file
dev-files := $(DEV_FILES)
combined-file := $(config.SOURCE_DIR)/MergedAllCoreOntology.ttl

# QC individual files
.PHONY: reason-individual test-individual
reason-individual: $(dev-files) | $(ROBOT_FILE)
	for file in $(dev-files); do \
		echo "Reasoning on $$file..."; \
		$(ROBOT) reason --input $$file --reasoner ELK; \
	done

test-individual: $(dev-files) | $(ROBOT_FILE)
	for file in $(dev-files); do \
		echo "Testing $$file..."; \
		$(ROBOT) verify --input $$file --output-dir $(config.TEMP_DIR) --queries $(QUERIES) --fail-on-violation $(config.FAIL_ON_TEST_FAILURES); \
	done

# Build and QC combined file
.PHONY: reason-combined test-combined
reason-combined: $(combined-file) | $(ROBOT_FILE)
	$(ROBOT) reason --input $(combined-file) --reasoner ELK

test-combined: $(combined-file) | $(ROBOT_FILE)
	$(ROBOT) verify --input $(combined-file) --output-dir $(config.TEMP_DIR) --queries $(QUERIES) --fail-on-violation $(config.FAIL_ON_TEST_FAILURES)

# Build and QC for release on main branch
build-release: $(RELEASE_BUILD_FILE)

.PHONY: reason-release test-release
reason-release test-release: TEST_INPUT = $(RELEASE_BUILD_FILE)
test-release: REPORT_FILE_INPUT = $(RELEASE_REPORT_FILE)
reason-release: reason

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
ROBOT_FILE := $(config.LIBRARY_DIR)/robot.jar
$(ROBOT_FILE): | $(config.LIBRARY_DIR)
	curl -L -o $@ https://github.com/ontodev/robot/releases/download/v1.8.4/robot.jar

ROBOT := java -jar $(ROBOT_FILE)

# Cleanup
.PHONY: clean
clean:
	@[ "${config.TEMP_DIR}" ] || ( echo ">> config.TEMP_DIR is not set"; exit 1 )
	rm -rf $(config.TEMP_DIR)
	rm -rf $(RELEASE_BUILD_FILE)

# Build combined file for dev branch
$(combined-file): $(DEV_FILES)
	cat $(DEV_FILES) > $@

# Build merged file for main branch
$(RELEASE_BUILD_FILE): $(config.SOURCE_DIR)/MergedAllCoreOntology.ttl
	cp $< $@

# Test each combined file
$(combined-file): $(DEV_FILES) | $(ROBOT_FILE)
	cat $(DEV_FILES) > $@

.PHONY: clean
clean:
	@[ "${config.TEMP_DIR}" ] || ( echo ">> config.TEMP_DIR is not set"; exit 1 )
	rm -rf $(config.TEMP_DIR)
	rm -rf $(RELEASE_BUILD_FILE) $(combined-file)

