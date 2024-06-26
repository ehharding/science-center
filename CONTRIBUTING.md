# Contributor Guide

Thank you for your interest in contributing to the Science Center. Before you proceed, briefly go through the following:

- [Code of Conduct](https://github.com/ehharding/science-center/blob/HEAD/CODE_OF_CONDUCT.md)
- [Contributing](#contributing)
  - [Becoming a Collaborator](#becoming-a-collaborator)
- [Getting Started](#getting-started)
  - [CLI Commands](#cli-commands)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Policy](#pull-request-policy)
- [Developer's Certificate of Origin 1.1](#developers-certificate-of-origin-11)

## Contributing

Any individual is welcome to contribute to the Science Center. The repository currently has two kinds of contribution
personas:

- A **Contributor** is any individual who creates an Issue/PR, comments on an Issue/PR, or contributes in some other
  way.
- A **Collaborator** is a Contributor with write access to the repository. See [here](#becoming-a-collaborator) on how
  to become a Collaborator.

You can find more details and guides about collaborating with this repository through our
[Collaborator Guide](./COLLABORATOR_GUIDE.md).

### Becoming a Collaborator

A Collaborator of the Science Center repository is a member of the Science Center team.

The Science Center team is responsible for the technical development of the Science Center; Thus, it is expected that
team members have significant knowledge about modern web technologies and web standards.

Note that regular Contributors do not need to become "Collaborators" as any contribution is appreciated (even without a
status), and a Collaborator status is a formality that comes with obligations.

If you're an active Contributor seeking to become a Collaborator, we recommend you contact one of the existing team
members for guidance.

<details>
  <summary><b>What's the process for becoming a Collaborator?</b></summary>

- You must be actively contributing to this repository.
- Contributions must include significant code reviews or code contributions.
- A nomination must be done by an existing team member of the team with an Issue.
  - The Issue must explain and describe why the nominated person is a good addition to the team.
  - The Issue must contain links to relevant contributions through:
    - Code reviews
    - Comments on Issues and PRs
    - Authoring of Issues or PRs
    - Comments or authoring of discussions
- The nomination must have at least one existing member of the team agree with the nomination.
  - This can be done through commenting with "agreement" (showing support) or reacting to the Issue with a 👍.
- The Issue must be open for at least 72 hours without an objection from an existing member of the team.
  - The nomination cannot pass until all open objections are resolved.
  </details>

## Getting Started

The steps below will give you a general idea of how to prepare your local environment for the project and general steps
for getting things done and landing your first contribution.

1. Click the `Fork` button in the top right to fork the
   [Science Center repository](https://github.com/ehharding/science-center/fork)

2. Clone your fork using SSH, HTTPS, or the GitHub CLI.

   ```bash
   git clone git@github.com:<YOUR_GITHUB_USERNAME>/science-center.git # SSH
   git clone https://github.com/<YOUR_GITHUB_USERNAME>/science-center.git # HTTPS
   gh repo clone <YOUR_GITHUB_USERNAME>/science-center # GitHub CLI
   ```

3. Change into the `science-center` directory.

   ```bash
   cd science-center
   ```

4. Create a remote to keep your fork and local clone up-to-date.

   ```bash
   git remote add upstream git@github.com:ehharding/science-center.org.git # SSH
   git remote add upstream https://github.com/ehharding/science-center.git # HTTPS
   gh repo sync ehharding/science-center # GitHub CLI
   ```

5. Create a new branch for your work.

   ```bash
   git checkout -b name-of-your-branch
   ```

6. Run the following to install the dependencies and start a local preview of your work.

   ```bash
   npm ci # Installs this project's dependencies
   npx turbo dev # Starts a development environment
   ```

7. Perform your changes. In case you're unfamiliar with the structure of this repository, we recommend a read of the
   [Collaborator Guide](./COLLABORATOR_GUIDE.md).

8. Perform a merge to sync your current branch with the upstream branch.

   ```bash
   git fetch upstream
   git merge upstream/main
   ```

9. Run `npx turbo format` to confirm that linting and formatting are passing.

   ```bash
   npx turbo format
   ```

10. Once you're happy with your changes, add and commit them to your branch, then push the branch to your fork.

    ```bash
    cd ~/science-center
    git add .
    git commit -m "some message"
    git push -u origin name-of-your-branch
    ```

> [!IMPORTANT]\
> Before committing and opening a PR, please first go through our [commit](#commit-guidelines) and
> [PR Policy](#pull-request-policy) below.

11. Create a PR.

> [!NOTE]\
> We ask for PR authors to avoid unnecessarily rebasing/updating their PRs with the base branch (`main`).
> We use [GitHub Merge Queues](https://github.blog/2023-07-12-github-merge-queue-is-generally-available/)
> which means that, before merge, the PRs get automatically updated and checked against the latest changes on the
> base branch.
>
> This also reduces the amount of times we need to run our CI-checks, as every new push requires fresh CI-checks.

### CLI Commands

This repository contains several scripts and commands for performing numerous tasks. The most relevant ones are
described below.

<details>
  <summary>Commands for Running & Building the Science Center</summary>

- `npx turbo dev` runs Next.js's Local Development Server, listening by default on `http://localhost:3000/`.
- `npx turbo build` builds the application in Production Mode. The output is by default within the `.next` folder.
  - This is used for the GitHub Actions deployments (Preview & Production).
- `npx turbo start` starts a web server running that serves the built content from `npx turbo build`.
</details>

<details>
  <summary>Commands for Maintenance Tasks and Tests</summary>

- `npx turbo lint` runs the linter for all the js files.
  - `npx turbo lint:fix` attempts to fix any linting errors.
- `npx turbo prettier` runs Prettier for all the js files.
  - `npx turbo prettier:fix` attempts to fix any style errors.
- `npx turbo format` formats and fixes the whole codebase.
- `npx turbo scripts:release-post` generates a release post for the current release.
  - **Usage:** `npx turbo scripts:release-post -- --version=vXX.X.X --force`
- `npx turbo storybook` starts Storybook's Local Server.
- `npx turbo storybook:build` builds Storybook as a Static Web Application for publishing.
- `npx turbo test` runs all tests locally.
  - `npx turbo test:unit` runs Jest (Unit tests) locally.
  </details>

## Commit Guidelines

This project follows the [Conventional Commits][] specification.

Commits should be signed. You can read more about [commit signing][] here.

### Commit Message Guidelines

- Commit messages must include a "type" as described in Conventional Commits.
- Commit messages **must** start with a capital letter.
- Commit messages **must not** end with a period `.`.

### Pre-Commit Hooks

This project uses [Husky][] for Git pre-commit hooks.

- Some JSON files are generated during build time with empty files as placeholders. Build time happens when you run
  `npx turbo serve` or `npx turbo build`.
- We don't want to commit these unnecessary changes. Since these files exist in the repository, `.gitignore` won't work
  for them. As a workaround, we have a pre-commit hook to discard these changes.

## Pull Request Policy

This policy governs how contributions should land within the repository. The lines below state the checks and policies
to be followed before and during the act of merging.

### Before Merging

We recommend a read of our [Collaborator Guide](COLLABORATOR_GUIDE.md#accepting-modifications) for in-depth details on
how we accept contributions into this repository. The list below describes some merging and approval rules adopted in
this repository.

- PRs must be open for at least forty-eight (48) hours (Or seventy-two (72) hours if the PR was authored on the
  weekend).
  - PRs might be immediately merged if they contain critical bug fixes, short errata (e.g., Typos from previous PRs), or
    any critical change considered a "showstopper" for the project's operation.
    - This kind of PR should only be done by existing Collaborators with write-access and/or signed off by
      administrators/maintainers.
    - This rule cannot be used for updates on the `COLLABORATOR_GUIDE.md` guide, `CONTRIBUTING.md` guide, `CODEOWNERS`
      file, GitHub Actions, or any security-impacting file or document that changes the governing policies of this
      repository.
  - PRs may be "fast-tracked", meaning they can be merged before the usual 48 hours' notice if a "fast-track" label is
    added.
    - The person that is fast-tracking the PR (adding the label) must also comment on the PR that they're requesting the
      PR to be fast-tracked.
    - The comment must mention `@ehharding` and must have at least one 👍 (or any other sort of approval reaction) if the
      person fast-tracking the PR is the author of the PR.
    - Fast-tracking is only allowed for small bug fixes, small feature changes, localization changes, or other
      non-critical/highly-impacting changes not covered by the previous rule that allows PRs to be merged immediately.
    - Fast-tracking cannot be used for updates on the `COLLABORATOR_GUIDE.md` guide, `CONTRIBUTING.md` guide,
      `CODEOWNERS` file, GitHub Actions, or any security-impacting file or document that changes the governing policies of
      this repository.
- There must be no objections after forty-eight (48) hours (Or seventy-two (72) hours if the PR was authored on the
  weekend).
  - If there are disagreements consensus should be sought. Lack of consensus might require escalation to the Science
    Center team maintainers.
- At least one approval is required for any PR to be merged.
- Tests must be included in PRs for new features or bug fixes. You are responsible for fixing any test(s) that fail(s).

Each contribution is accepted only if there is no objection to it by a Collaborator. During the review, Collaborators may
request that a specific Contributor who is an expert in a particular area give a "LGTM" before the PR can be merged.

If an objection is raised in a PR by another Collaborator, all Collaborators involved should try to arrive at a
consensus by addressing the concerns through discussion, compromise, or withdrawal of the proposed change(s).

### When Merging

- All required status-checks must have passed.
  - **Note:** If you're a Collaborator, remember to run the CI-checks by labeling the PR with the
    `github_actions:pull-request` label.
- Please make sure that all discussions are resolved.
- [`squash`][] PRs made up of multiple commits.

## Developer's Certificate of Origin 1.1

By contributing to this project, I certify that:

- (a) The contribution was created in whole or in part by me and I have the right to submit it under the open source
  license indicated in the file; or
- (b) The contribution is based upon previous work that, to the best of my knowledge, is covered under an appropriate
  open source license and I have the right under that license to submit that work with modifications, whether created in
  whole or in part by me, under the same open source license (unless I am permitted to submit under a different license),
  as indicated in the file; or
- (c) The contribution was provided directly to me by some other person who certified (a), (b) or (c) and I have not
  modified it.
- (d) I understand and agree that this project and the contribution are public and that a record of the contribution
  (including all personal information I submit with it, including my sign-off) is maintained indefinitely and may be
  redistributed consistent with this project or the open source license(s) involved.

[`squash`]: https://help.github.com/en/articles/about-pull-request-merges#squash-and-merge-your-pull-request-commits
[Commit Signing]: https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits
[Conventional Commits]: https://www.conventionalcommits.org/
[Husky]: https://typicode.github.io/husky/
