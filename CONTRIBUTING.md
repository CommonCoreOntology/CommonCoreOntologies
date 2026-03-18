# Contributing to Common Core Ontologies

Thank you for your interest in contributing to CCO! This document provides guidelines for contributing to the project.

## 📋 Quick Links

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Development Workflow](#development-workflow)
- [Quality Standards](#quality-standards)
- [Getting Help](#getting-help)

## 🎯 How to Contribute

### Reporting Issues

1. Check if the issue already exists in [GitHub Issues](https://github.com/CommonCoreOntology/CommonCoreOntologies/issues)
2. Use the appropriate issue template (Bug Report or Feature Request)
3. Provide clear, detailed information
4. Include steps to reproduce (for bugs)

### Suggesting Enhancements

1. Open an issue using the Feature Request template
2. Explain the use case and benefits
3. Discuss with the community before implementing large changes
4. Consider starting a [GitHub Discussion](https://github.com/CommonCoreOntology/CommonCoreOntologies/discussions) for open-ended ideas

### Contributing Code/Ontology Changes

1. **Fork the repository**
2. **Create a feature branch** from `develop`:
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
4. **Test thoroughly** (see Quality Standards below)
5. **Commit with clear messages**:
   ```bash
   git commit -m "Add: Brief description of change"
   ```
6. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```
7. **Open a Pull Request** to the `develop` branch

## 🔄 Development Workflow

### Branch Strategy

- `master` - Production releases only
- `develop` - Main development branch (default)
- `feature/*` - New features or enhancements
- `bugfix/*` - Bug fixes
- `hotfix/*` - Emergency fixes to master

### Before Submitting a PR

**Required:**

- [ ] Run full build: `make all`
- [ ] Ensure reasoning passes (HermiT)
- [ ] Verify SPARQL tests pass
- [ ] Update documentation if needed
- [ ] Write clear commit messages

**Recommended:**

- [ ] Test in Protégé
- [ ] Review SPARQL violation reports in `build/artifacts/`
- [ ] Check your changes against CCO design patterns

## ✅ Quality Standards

### For Ontology Changes

**All ontology contributions must:**

1. **Extend from BFO hierarchy**
   - All CCO classes must have a BFO superclass
   - Follow BFO 2020 conventions

2. **Include proper annotations**
   - English definition (`cco:definition`)
   - Preferred label (`rdfs:label`)
   - Example usage (`cco:example_of_usage`) when helpful
   - Elucidation (`cco:elucidation`) when needed

3. **Follow naming conventions**
   - Use opaque identifiers (e.g., `cco_00001234`)
   - Use clear, descriptive labels
   - Follow CCO style guidelines

4. **Pass all quality checks**
   - No reasoning errors
   - No SPARQL violations (or document why acceptable)
   - No duplicate labels/definitions
   - No circular inheritance

### For CI/CD Changes

**All CI/CD contributions must:**

1. **Be tested locally first**
   - Test workflow changes on a fork
   - Verify no breaking changes

2. **Include documentation**
   - Update `CI_CD_CURRENT_STATE.md`
   - Comment complex workflow logic

3. **Not break existing functionality**
   - Ensure backward compatibility
   - Test with current ontology files

## 🧪 Testing Your Changes

### Run Locally

```bash
# Clean previous builds
make clean

# Run full pipeline (8-12 minutes)
make all

# Check for errors
ls build/artifacts/*-violations.csv
```

### Reasoning Check

```bash
# Individual modules
make reason-individual

# Merged ontology
make reason-combined
```

### SPARQL Validation

```bash
# Individual modules
make test-individual

# Merged ontology
make test-combined
```

### Load in Protégé

1. Open Protégé
2. File → Open → Select `src/MergedAllCoreOntology.ttl`
3. Reasoner → HermiT
4. Start Reasoner
5. Check for inconsistencies

## 📝 Commit Message Guidelines

**Format:**

```
<type>: <brief description>

<optional detailed description>

<optional issue references>
```

**Types:**

- `Add:` New classes, properties, or features
- `Fix:` Bug fixes
- `Update:` Modifications to existing content
- `Remove:` Deprecated or obsolete content
- `Docs:` Documentation changes
- `CI:` CI/CD pipeline changes
- `Test:` Testing improvements

**Examples:**

```
Add: New facility subtypes for military installations

Added cco:MilitaryBase, cco:NavalStation, and related properties.
Includes definitions and examples from DoD sources.

Fixes #123
```

```
Fix: Reasoning error in Event Ontology

Corrected domain constraint on participates_in property
that was causing unsatisfiable classes.
```

## 🔍 Review Process

### PR Review Timeline

1. **Automated checks** run immediately (8-12 minutes)
2. **Initial review** within 2-3 business days
3. **Governance board review** for significant changes
4. **Merge** after approvals and passing checks

### What Reviewers Check

- Code/ontology quality and correctness
- Adherence to CCO conventions
- Completeness of documentation
- Test coverage and results
- Potential impact on existing content

### After Review

- Address reviewer feedback
- Push updates to the same PR branch
- Request re-review when ready
- Don't force-push (preserves review history)

## 🚀 Release Process

Releases are managed by the governance board and DevOps team.

**Release Schedule:**

- Major releases: 1-2 times per year
- Minor updates: As needed
- Hotfixes: Emergency only

**Release Criteria:**

- All tests pass
- No critical bugs
- Documentation updated
- Governance board approval

## 📚 Resources

### Documentation

- [CCO Homepage](https://commoncoreontology.github.io/cco-webpage/)
- [Build Process Documentation](BUILD_PROCESS.md)
- [CI/CD Documentation](CI_CD_CURRENT_STATE.md)
- [Release Checklist](RELEASE_CHECKLIST.md)
- [SPARQL Queries](SPARQL_QUERIES_INVENTORY.md)

### Tools

- [Protégé](https://protege.stanford.edu/) - Ontology editor
- [ROBOT](http://robot.obolibrary.org/) - Ontology toolkit
- [HermiT](http://www.hermit-reasoner.com/) - OWL reasoner

### Standards

- [BFO](https://github.com/bfo-ontology/BFO-2020) - Basic Formal Ontology
- [OWL 2](https://www.w3.org/TR/owl2-overview/) - Web Ontology Language

## ❓ Getting Help

### Questions?

- **General questions:** [GitHub Discussions](https://github.com/CommonCoreOntology/CommonCoreOntologies/discussions)
- **Bug reports:** [GitHub Issues](https://github.com/CommonCoreOntology/CommonCoreOntologies/issues)
- **Email:** Contact governance board (see homepage)

### Community

- Join our discussions
- Attend community calls (announcements in Discussions)
- Follow project updates

## 👥 Governance

CCO is governed by a board of experts from academia, government, and industry.

For governance information, see: [CCO Governance](https://commoncoreontology.github.io/cco-webpage/board/)

---

**Thank you for contributing to CCO!** 🎉

Your contributions help make CCO better for the defense, intelligence, and research communities worldwide.
