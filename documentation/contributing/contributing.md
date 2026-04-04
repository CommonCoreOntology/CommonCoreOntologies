# Contributing Guidelines and Code of Conduct

Branching:  
`master` will always contain the latest release.  
`develop` is where approved changes are merged into from patch and feature branches.  

Instructions:  
- All changes shall be made on a patch/feature branch that is created from an issue. Use the feature located to the right under Development to create branch. Make sure to select "Change Branch Source" and select 'develop'.
- If the changes are not based on an existing issue, create one.
- Make sure your preferred method of editing OWL files isn't generating spurious diffs. To prevent this, make a token change (e.g., add an annotation to the ontology) to the file and save it.
- Then use your favorite diff checker to confirm only that change is being rendered. Different versions of OWL API and Protégé will sometimes cause formatting issues.
- If you can't prevent the bogus diffs, then make commit the file with a message "Bogus change to render diffs correctly".
- Better to commit often rather than not enough. Ideally your commits will be have a unified objective. E.g., "changed language tags on all properties", "updated formatting for a few definitions", "deleted class Agent Identifier & fixed related axioms".
- When you've made changes as dictated by the issue, then perform a MR on `develop`.
- A set of checks will be run. Any failures need to be addressed before it can be accepted.
- Only Lead Developers can accept MRs.  

## Our Pledge

We as members, contributors, and leaders pledge to make participation in our
community a harassment-free experience for everyone, regardless of age, body
size, visible or invisible disability, ethnicity, sex characteristics, gender
identity and expression, level of experience, education, socio-economic status,
nationality, personal appearance, race, religion, or sexual identity
and orientation.

We pledge to act and interact in ways that contribute to an open, welcoming,
diverse, inclusive, and healthy community.

## Our Standards

Examples of behavior that contributes to a positive environment for our
community include:

* Demonstrating empathy and kindness toward other people
* Being respectful of differing opinions, viewpoints, and experiences
* Giving and gracefully accepting constructive feedback
* Accepting responsibility and apologizing to those affected by our mistakes,
  and learning from the experience
* Focusing on what is best not just for us as individuals, but for the
  overall community

Examples of unacceptable behavior include:

* The use of sexualized language or imagery, and sexual attention or
  advances of any kind
* Trolling, insulting or derogatory comments, and personal or political attacks
* Public or private harassment
* Publishing others' private information, such as a physical or email
  address, without their explicit permission
* Other conduct which could reasonably be considered inappropriate in a
  professional setting

## Enforcement Responsibilities

Community leaders are responsible for clarifying and enforcing our standards of
acceptable behavior and will take appropriate and fair corrective action in
response to any behavior that they deem inappropriate, threatening, offensive,
or harmful.

Community leaders have the right and responsibility to remove, edit, or reject
comments, commits, code, wiki edits, issues, and other contributions that are
not aligned to this Code of Conduct, and will communicate reasons for moderation
decisions when appropriate.

## Scope

This Code of Conduct applies within all community spaces, and also applies when
an individual is officially representing the community in public spaces.
Examples of representing our community include using an official e-mail address,
posting via an official social media account, or acting as an appointed
representative at an online or offline event.

## Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be
reported to the community leaders responsible for enforcement at
.
All complaints will be reviewed and investigated promptly and fairly.

All community leaders are obligated to respect the privacy and security of the
reporter of any incident.

## Enforcement Guidelines

Community leaders will follow these Community Impact Guidelines in determining
the consequences for any action they deem in violation of this Code of Conduct:

### 1. Correction

**Community Impact**: Use of inappropriate language or other behavior deemed
unprofessional or unwelcome in the community.

**Consequence**: A private, written warning from community leaders, providing
clarity around the nature of the violation and an explanation of why the
behavior was inappropriate. A public apology may be requested.

### 2. Warning

**Community Impact**: A violation through a single incident or series
of actions.

**Consequence**: A warning with consequences for continued behavior. No
interaction with the people involved, including unsolicited interaction with
those enforcing the Code of Conduct, for a specified period of time. This
includes avoiding interactions in community spaces as well as external channels
like social media. Violating these terms may lead to a temporary or
permanent ban.

### 3. Temporary Ban

**Community Impact**: A serious violation of community standards, including
sustained inappropriate behavior.

**Consequence**: A temporary ban from any sort of interaction or public
communication with the community for a specified period of time. No public or
private interaction with the people involved, including unsolicited interaction
with those enforcing the Code of Conduct, is allowed during this period.
Violating these terms may lead to a permanent ban.

### 4. Permanent Ban

**Community Impact**: Demonstrating a pattern of violation of community
standards, including sustained inappropriate behavior,  harassment of an
individual, or aggression toward or disparagement of classes of individuals.

**Consequence**: A permanent ban from any sort of public interaction within
the community.

## Attribution

This Code of Conduct is adapted from the [Contributor Covenant][homepage],
version 2.0, available at
https://www.contributor-covenant.org/version/2/0/code_of_conduct.html.

Community Impact Guidelines were inspired by [Mozilla's code of conduct
enforcement ladder](https://github.com/mozilla/diversity).

[homepage]: https://www.contributor-covenant.org

For answers to common questions about this code of conduct, see the FAQ at
https://www.contributor-covenant.org/faq. Translations are available at
https://www.contributor-covenant.org/translations.

### Branching:
`master` contain the latest release  
`develop` where pull requests are made from patch and feature branches  

### Instructions: 
- If you do not have write privileges in the repo, then create a fork and work off that. 
- All changes shall be made on an issue-specifc branch.
  - Use the feature in the isseu tracker located to the right under "Development" to create the branch. Make sure to "Change Branch Source" and select 'develop'.
- If the changes are not based on an existing issue, create one first, assign yourself.
- Make sure your preferred method of editing OWL files isn't generating spurious diffs.
  - To prevent this, make a token change to the file and save. E.g., add an annotation to the ontology "foo". Then use your favorite diff checker to confirm only that change is being rendered. Delete the change before making any other changes.
  - If you can't prevent the bogus diffs, then make a change to the file with a message "Change to render diffs correctly."
  - Delete the change and commit with message "Change for diffs deleted."
- Better to commit often rather than not enough. Ideally your commits will be have a unified objective. E.g., "changed language tags on all properties", "updated formatting for a few definitions", "deleted class Agent Identifier & fixed related axioms".
- Double check your work, make sure it loads in Protege, open All Core Ontology and confirm there are no bugs.
- Perform a PR on `develop`. Optionally, you may assign one or more reviewers, e.g., people that contributed to the issue. 

<!--- TODO: IRI schema, fork procedure --->