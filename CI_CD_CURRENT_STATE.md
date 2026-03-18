# CCO CI/CD Pipeline - Current State

**Last Updated:** February 8, 2026  
**Author:** Shanmukh Kalasamudram  
**Purpose:** Document current automated workflows for CCO development and release

---

## 🎯 Overview

The CCO repository uses **GitHub Actions** for continuous integration and deployment. The pipeline validates ontology files through two stages:

1. **Individual module validation** - Test each of 11 ontology files separately
2. **Merged validation** - Test the combined ontology as a whole

**Key Tools:**

- **ROBOT** (v1.8.4) - OBO Foundry ontology toolkit
- **HermiT** - OWL 2 DL reasoner
- **SPARQL** - Quality control queries
- **Make** - Build orchestration

---

## 🔄 Automated Workflows

### 1. Build, Test, Draft Release Workflow

**File:** `.github/workflows/manage_release.yml`  
**Status:** Active

#### Trigger Conditions

```yaml
on:
  push:
    branches:
      - develop
      - feature/*
  pull_request:
    branches:
      - master
```

**When it runs:**

- Every push to `develop` branch
- Every push to any `feature/*` branch
- Every pull request targeting `master` branch

#### Permissions

```yaml
permissions:
  contents: write
```

- Allows workflow to create releases and upload artifacts

#### Workflow Steps

**Step 1: Checkout Code**

```yaml
- uses: actions/checkout@v3
```

- Pulls repository code into runner

**Step 2: Restore Cached Dependencies**

```yaml
- uses: actions/cache/restore@v3
  with:
    path: build/lib
    key: ${{ runner.os }}-build-cache-dependencies
```

- Restores ROBOT JAR from cache if available
- Speeds up subsequent builds (ROBOT ~30MB, downloads once)

**Step 3: Build and Test**

```yaml
- run: make all
```

Executes complete build pipeline:

1. Setup directories
2. Download ROBOT (if not cached)
3. Reason individual ontology modules
4. Test individual modules with SPARQL
5. Build merged ontology file
6. Reason merged file
7. Test merged file with SPARQL

**Step 4: Capture Release Information**

```yaml
- run: |
    echo "RELEASE_FILE_PATH=$(make output-release-filepath)" >> $GITHUB_OUTPUT
    echo "RELEASE_NAME=$(make output-release-name)" >> $GITHUB_OUTPUT
```

- Extracts: `src/MergedAllCoreOntology.ttl`
- Generates: Release name like "CCO 2026-02-09 14:30"

**Step 5: Save Artifacts**

```yaml
- uses: actions/upload-artifact@v4
  with:
    name: ontology_release_results
    path: build/artifacts
```

- Uploads test reports and violation logs
- Accessible in Actions tab for 90 days
- Includes SPARQL query results

**Step 6: Cache Dependencies**

```yaml
- uses: actions/cache/save@v3
  with:
    path: build/lib
    key: ${{ runner.os }}-build-cache-dependencies
```

- Saves ROBOT JAR for future runs
- Only if cache miss occurred

**Step 7: Draft GitHub Release**

```yaml
- uses: actions/create-release@v1
  with:
    draft: true
    prerelease: false
    release_name: ${{ steps.build_release.outputs.RELEASE_NAME }}
    tag_name: ${{ github.run_id }}-${{ github.run_number }}-${{ github.run_attempt }}
```

- Creates DRAFT release (not published)
- Uses temporary tag based on run ID
- Manual publication required

**Step 8: Upload Release Asset**

```yaml
- uses: actions/upload-release-asset@v1
  with:
    asset_path: src/MergedAllCoreOntology.ttl
    asset_content_type: application/ttl
```

- Attaches merged ontology to draft release

---

### 2. Jekyll Website Deployment

**File:** `.github/workflows/jekyll.yml`  
**Status:** Active

#### Trigger Conditions

```yaml
on:
  push:
    branches: ["develop"]
  workflow_dispatch:
```

**When it runs:**

- Every push to `develop` branch
- Manual trigger from Actions tab

#### Purpose

- Deploys project documentation to GitHub Pages
- Uses Jekyll static site generator
- Publishes to: `https://commoncoreontology.github.io/CommonCoreOntologies/`

#### Key Steps

1. Checkout repository
2. Setup Ruby 3.1 environment
3. Install Jekyll dependencies via Bundler
4. Build Jekyll site
5. Deploy to GitHub Pages

**Build Command:**

```bash
bundle exec jekyll build --baseurl "/CommonCoreOntologies"
```

---

## 🧪 Quality Checks in CI

### Reasoning Checks (HermiT)

**What it does:**

- Validates logical consistency of ontology
- Checks for contradictions
- Identifies unsatisfiable classes
- Verifies property constraints

**Individual Module Reasoning:**

```bash
java -jar build/lib/robot.jar reason \
  --input <module>.ttl \
  --catalog src/cco-modules/catalog-v001.xml \
  --reasoner HermiT
```

**Runs on:** Each of 11 modules

- AgentOntology.ttl
- ArtifactOntology.ttl
- CurrencyUnitOntology.ttl
- EventOntology.ttl
- ExtendedRelationOntology.ttl
- FacilityOntology.ttl
- GeospatialOntology.ttl
- InformationEntityOntology.ttl
- QualityOntology.ttl
- TimeOntology.ttl
- UnitsOfMeasureOntology.ttl

**Merged File Reasoning:**

```bash
java -jar build/lib/robot.jar reason \
  --input src/MergedAllCoreOntology.ttl \
  --catalog src/cco-modules/catalog-v001.xml \
  --reasoner HermiT
```

**Duration:** ~30-60 seconds per module, ~60-90 seconds for merged

---

### SPARQL Quality Checks

**What it does:**

- Validates ontology against 11 predefined quality rules
- Checks for data quality issues
- Ensures consistency and completeness

**Individual Module Testing:**

```bash
java -jar build/lib/robot.jar verify \
  --input <module>.ttl \
  --output-dir build/artifacts \
  --queries .github/deployment/sparql/*.sparql \
  --fail-on-violation false
```

**Merged File Testing:**

```bash
java -jar build/lib/robot.jar verify \
  --input src/MergedAllCoreOntology.ttl \
  --output-dir build/artifacts \
  --queries .github/deployment/sparql/*.sparql \
  --fail-on-violation false
```

**Current Behavior:**

- `--fail-on-violation false` - Violations generate warnings but don't fail build
- Reports saved to `build/artifacts/`
- Uploaded as workflow artifacts

### 11 Active SPARQL Queries

| #   | Query File                               | Severity | Purpose                                          |
| --- | ---------------------------------------- | -------- | ------------------------------------------------ |
| 1   | `CCO_classes_have_BFO_superclass.sparql` | ERROR    | Ensure all CCO classes extend from BFO hierarchy |
| 2   | `annotation_whitespace.sparql`           | WARNING  | Detect unwanted whitespace in annotations        |
| 3   | `deprecated_property_reference.sparql`   | ERROR    | Find usage of deprecated properties              |
| 4   | `duplicate_definition.sparql`            | ERROR    | Ensure no duplicate definitions                  |
| 5   | `duplicate_label.sparql`                 | ERROR    | Ensure no duplicate labels                       |
| 6   | `exactly_1_prefLabel_per_lang.sparql`    | ERROR    | One prefLabel per language                       |
| 7   | `min_1_eng_def.sparql`                   | WARNING  | All classes/properties have English definition   |
| 8   | `min_1_ontology_title.sparql`            | ERROR    | Ontology file has title annotation               |
| 9   | `no_multiple_inverse_properties.sparql`  | ERROR    | Property has only one inverse                    |
| 10  | `subclass_circularity.sparql`            | ERROR    | Prevent circular inheritance                     |
| 11  | (Additional custom queries)              | VARIES   | Future additions                                 |

**Duration:** ~2-5 minutes total for all queries across all files

---

## 📊 Build Artifacts

### What Gets Generated

**Location:** `build/artifacts/`

**Files Created:**

```
build/artifacts/
├── CCO_classes_have_BFO_superclass-violations.csv
├── annotation_whitespace-violations.csv
├── deprecated_property_reference-violations.csv
├── duplicate_definition-violations.csv
├── duplicate_label-violations.csv
├── exactly_1_prefLabel_per_lang-violations.csv
├── min_1_eng_def-violations.csv
├── min_1_ontology_title-violations.csv
├── no_multiple_inverse_properties-violations.csv
└── subclass_circularity-violations.csv
```

**Merged Ontology:**

```
src/MergedAllCoreOntology.ttl
```

- Combination of all 11 modules
- Ready for release distribution

### Artifact Retention

- **GitHub Actions:** 90 days
- **Release Drafts:** Indefinite until deleted
- **Local builds:** Until `make clean` run

---

## 🔀 Workflow by Branch

### `develop` Branch (Default)

**On Push:**

1. ✅ Run `make all` (full build & test)
2. ✅ Upload artifacts
3. ✅ Cache ROBOT
4. ✅ Create draft release
5. ✅ Deploy Jekyll site

**Expected Frequency:** Multiple times per day

### `feature/*` Branches

**On Push:**

1. ✅ Run `make all` (full build & test)
2. ✅ Upload artifacts
3. ✅ Cache ROBOT
4. ✅ Create draft release
5. ❌ No Jekyll deployment

**Purpose:** Validate changes before merging to develop

### Pull Request to `master`

**On PR Creation/Update:**

1. ✅ Run `make all` (full build & test)
2. ✅ Upload artifacts
3. ✅ Cache ROBOT
4. ✅ Create draft release
5. ❌ No Jekyll deployment

**Purpose:** Final validation before release

**Note:** PR must pass all checks before merge allowed (when branch protection enabled)

---

## ⏱️ Build Performance

### Typical Build Times

| Stage             | Duration     | Notes                       |
| ----------------- | ------------ | --------------------------- |
| Setup             | <5 sec       | Create directories          |
| Download ROBOT    | ~10 sec      | First run only, then cached |
| Reason Individual | 30-60 sec    | 11 modules × ~5 sec each    |
| Test Individual   | 2-4 min      | 11 modules × 11 queries     |
| Build Merged      | <5 sec       | Simple concatenation        |
| Reason Merged     | 60-90 sec    | Larger file, more axioms    |
| Test Merged       | 3-5 min      | Full validation             |
| **Total**         | **8-12 min** | Complete pipeline           |

### Optimization Opportunities

- ✅ ROBOT caching (already implemented)
- ⚠️ Parallel individual module testing (not implemented)
- ⚠️ Incremental builds for unchanged modules (not implemented)
- ⚠️ Faster reasoner (ELK) for quick checks (not implemented)

---

## 🚨 Current Failure Modes

### Build Fails If:

1. **Reasoning fails** - Logical inconsistency detected
2. **ROBOT download fails** - Network/GitHub issue
3. **File not found** - Missing ontology module
4. **Syntax error** - Invalid TTL syntax

### Build DOES NOT Fail If:

1. **SPARQL violations found** - Only warnings (`--fail-on-violation false`)
2. **Missing optional files** - Build continues
3. **Cache miss** - Downloads ROBOT again

### Current Gaps

- ❌ No email notifications on failure
- ❌ No build status badges in README
- ❌ No metrics tracking (build time, success rate)
- ❌ No automatic issue creation on persistent failures

---

## 🔧 Configuration Files

### `Makefile`

**Purpose:** Build orchestration  
**Key Targets:**

- `make all` - Complete pipeline
- `make setup` - Create directories
- `make reason-individual` - Reason modules
- `make test-individual` - Test modules
- `make build-combined` - Create merged file
- `make reason-combined` - Reason merged file
- `make test-combined` - Test merged file
- `make clean` - Remove build artifacts

**Important Variables:**

```makefile
config.FAIL_ON_TEST_FAILURES := false
config.REPORT_FAIL_ON := none
config.QUERIES_DIR := .github/deployment/sparql
```

### `catalog-v001.xml`

**Purpose:** Import resolution for ROBOT  
**Location:** `src/cco-modules/catalog-v001.xml`  
**Function:** Maps ontology IRIs to local file paths

---

## 📋 What's NOT in CI Currently

### Missing from Automation

1. **Branch Protection** - No enforcement of reviews/checks
2. **Linting** - No TTL syntax pre-validation
3. **Diff Generation** - No automatic diff from previous version
4. **Release Notes** - Manual creation required
5. **Changelog** - Not auto-generated
6. **Notification System** - No alerts on failure
7. **Metrics Dashboard** - No visibility into trends
8. **Performance Monitoring** - No build time tracking
9. **Security Scanning** - No dependency vulnerability checks

### Manual Steps Required

1. **Review SPARQL violations** - Must check artifacts manually
2. **Approve and publish release** - Draft created, manual publish needed
3. **Merge to master** - Manual PR review and merge
4. **Tag release** - Manual tagging with proper version
5. **Announce release** - Manual communication to community
6. **Update website content** - Jekyll deploys, but content updates manual

---

## 🎯 Recommendations for Improvement

### Quick Wins

1. **Add notification system** - Email on failures
2. **Add build badges** - Show CI status in README
3. **Improve log output** - Better summaries and error messages
4. **Add branch protection** - Enforce checks before merge

### Medium Term

1. **Parallel testing** - Speed up individual module tests
2. **Add linting** - Pre-validate TTL syntax
3. **Metrics tracking** - Build time, success rate dashboard
4. **Stricter validation** - Change `--fail-on-violation` to `true`

### Long Term

1. **Automatic diff generation** - Compare with previous release
2. **Release notes automation** - Generate from commits/PRs
3. **Competency question testing** - Validate against design patterns
4. **Multi-stage pipeline** - Separate quick checks from comprehensive tests

---

## 🔗 Related Documentation

- `BUILD_PROCESS.md` - Detailed Makefile explanation
- `SPARQL_QUERIES_INVENTORY.md` - Complete query documentation
- `BRANCHING_STRATEGY.md` - Git workflow and release process
- `RELEASE_CHECKLIST.md` - Manual release steps (to be created)

---

## 📊 CI/CD Workflow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│  Developer Push to develop or feature/* branch              │
│  OR Pull Request to master                                  │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  GitHub Actions: manage_release.yml                         │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  1. Checkout Code                                           │
│  2. Restore ROBOT Cache                                     │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  make all                                                   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Individual Modules (11 files)                      │   │
│  │  ├─ Reason with HermiT                             │   │
│  │  └─ Test with 11 SPARQL queries                    │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Build Merged File                                  │   │
│  │  └─ Concatenate all 11 modules                     │   │
│  └─────────────────────────────────────────────────────┘   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Merged Validation                                  │   │
│  │  ├─ Reason with HermiT                             │   │
│  │  └─ Test with 11 SPARQL queries                    │   │
│  └─────────────────────────────────────────────────────┘   │
└────────────────────┬────────────────────────────────────────┘
                     │
         ┌───────────┴───────────┐
         │ Build Success?        │
         └───────────┬───────────┘
                     │
         ┌───────────┴───────────┐
         │ Yes                   │ No
         ▼                       ▼
┌──────────────────┐    ┌──────────────────┐
│ Generate         │    │ Fail workflow    │
│ Artifacts        │    │ Show errors      │
└────────┬─────────┘    └──────────────────┘
         │
         ▼
┌──────────────────────────────────────────┐
│ 3. Upload Artifacts (violation reports)  │
│ 4. Save ROBOT Cache                      │
│ 5. Create Draft Release                  │
│ 6. Upload Merged File to Release         │
└──────────────────────────────────────────┘

         ▼ (if develop branch)
┌──────────────────────────────────────────┐
│ Jekyll Workflow: Deploy Documentation    │
└──────────────────────────────────────────┘
```

---

## 🆘 Troubleshooting

### CI Build Fails

**Problem:** Workflow shows red X

**Steps:**

1. Click into failed workflow run
2. Expand failed step
3. Check error message
4. Common issues:
   - Reasoning failure → Check for logical inconsistencies
   - File not found → Verify file paths in Makefile
   - ROBOT download failure → Retry workflow

### SPARQL Violations

**Problem:** Many violations in artifacts

**Steps:**

1. Download artifacts from workflow run
2. Open relevant `-violations.csv` files
3. Review violations line by line
4. Fix issues in source ontology files
5. Push changes to trigger new build

### Slow Build Times

**Problem:** Build takes >15 minutes

**Steps:**

1. Check if ROBOT cache is working
2. Verify parallel execution not failing
3. Consider using ELK reasoner for development
4. Profile which SPARQL queries are slow

---

**Next Steps:**
We still need to identify gaps this work flow with the Mark's process and will update this once we receive deployment process.
