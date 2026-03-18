# CCO Branching Strategy

**Owner:** Shanmukh Kalasamudram  
**Last Updated:** February 23, 2026  
**Purpose:** Define Git workflow and release process for CCO development

---

## Branch Structure

```
master          ← stable, released versions only
develop         ← integration branch, always deployable
feature/*       ← individual work items
```

### `master`
- Contains only released, governance-approved versions
- Never commit directly — only merge via PR from `develop`
- Every merge to `master` triggers a tagged release
- Protected: requires 2 governance board approvals + passing CI

### `develop`
- Default working branch
- All feature branches merge here first
- CI runs on every push
- Protected: requires 1 approval + passing CI

### `feature/*`
- Created from `develop` for each issue or task
- Naming convention: `feature/<issue-number>-short-description`
- Example: `feature/451-curl-args`
- CI runs on every push
- Merge back to `develop` via PR when complete

---

## Workflow: Day-to-Day Development

```bash
# 1. Start new work
git checkout develop
git pull origin develop
git checkout -b feature/123-my-feature

# 2. Do your work, commit
git add .
git commit -m "feat: short description of change"

# 3. Push and open PR to develop
git push origin feature/123-my-feature
# Open PR on GitHub targeting develop

# 4. After PR is approved and merged, delete branch
git branch -d feature/123-my-feature
```

---

## Workflow: Release Process

```bash
# 1. Ensure develop is clean and CI is green
git checkout develop
git pull origin develop

# 2. Open PR: develop → master
# Title: "Release v2.X - YYYY-MM-DD"
# Get 2 governance board approvals

# 3. After merge, tag the release
git checkout master
git pull origin master
git tag -a v2.X-YYYY-MM-DD -m "CCO Release v2.X"
git push origin v2.X-YYYY-MM-DD

# 4. Publish the draft GitHub release created by CI
# Go to GitHub → Releases → find draft → Edit → Publish
```

### Release Tag Format
```
v<major>.<minor>-<YYYY-MM-DD>
Example: v2.1-2026-03-20
```

---

## Commit Message Convention

```
<type>: <short description>

Types:
  feat     - new term, new feature
  fix      - bug fix, error correction
  docs     - documentation only
  ci       - CI/CD changes
  refactor - code restructure, no behavior change
  chore    - maintenance tasks
```

Examples:
```
feat: add BFO superclass to InformationEntity terms
fix: remove duplicate label on ont00000548
docs: update contributing guide with new IRI format
ci: add --catalog flag to test-combined
```

---

## Related Documents

- `BRANCH_PROTECTION_CONFIG.md` — GitHub branch protection rule settings
- `RELEASE_CHECKLIST.md` — Step-by-step release execution guide
- `CI_CD_CURRENT_STATE.md` — CI pipeline documentation
