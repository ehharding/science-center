## Dependency Pinning

We've decided to use a more strict strategy for handling npm dependencies within the project.

The intent here is to prevent the build process, or the project itself, from breaking due to changes in dependencies. As
some dependencies do not respect semantic versioning, this is a real concern. Pinning dependencies also ensures that we
stay fixed on a specific dependency version. For security updates, Dependabot is still configured to give us security
alerts when specific dependencies got security advisories.

### When Adding Dependencies

The following recommendations are in order when adding a new dependency:

- A dependency should be in `dependencies` if it is part of the build process of the project or used within runtime
  code.
  - Some non-code dependencies are required for the bootstrap of the repository. They are either used on basic build
    scripts or Git Hooks. Examples include `husky`, `lint-staged`, and others.
- A dependency should be in `devDependencies` if it is not invoked anywhere within the codebase.
  - This applies to runtimes, tooling, utility/dev-only commands, type packages and others.
- Sometimes, a dependency should be a `devDependency` even if invoked within the codebase, but only used within a
  development environment or during a test runner. Examples include `jest`, `storybook`, and others.
- A dependency should be in `peerDependencies` if it is a runtime dependency of the project, but the project itself does
  not install it. Examples include `react`, `react-dom`, and others.

### When Pinning Dependencies

When adding dependencies, you should consider if that dependency should be saved as an exact dependency (`--save-exact`)
or use either a `^` or `~` version range operator. The following guidelines are in order:

- A dependency, in general, should be pinned to its exact dependency if it's either a tooling or a CLI dependency.
  Examples include `husky`, `prettier`, `jest`, and others.
- A dependency should generally use `~` if we're interested in patch updates (such as hot-fixes and bug-fixes) and the
  package is part of the Development or Testing Environment. (Such as `storybook`, for example)
- A dependency should generally use `^` if they're part of the project application itself, such as `react`, `next-intl`
  etc. This is done because we intentionally want to get these dependencies' latest features and bug-fixes.
  - If we're not interested in getting the latest features and bug fixes, we should consider using `~` instead.
- Science-Center-only dependencies used in scripts or during the build process of the project (not used within actual
  application code) should use `~` instead. Examples include `glob` and `@nodevu/core`.
- TypeScript type packages of corresponding packages should follow the same `semver` of their respective packages.

### About Manual Updates

This document intends to outline the strategy we have when adding dependencies. We also recommend that team members only
add new dependencies when explicitly needed. The more dependencies, the harder it gets to review and understand the
complexity of the project application. You can avoid adding new dependencies if possible.

Manual updates should be avoided. Dependabot is configured for updating our dependencies. Updating a dependency is only
needed if the update breaks the current `semver` constraint. In these situations, good judgement should be used (as a
dependency should generally only be updated in these scenarios if the updated version brings new features desired by the
team).

An exception to the manual rule is the version of Science Center defined within `.nvmrc`, and the corresponding
`@types/node` dependency. The `@types/node` semver MAJOR version should be kept in sync with the version of Node.js the
site is built with.

Lastly, in general, a Pull Request should not contain `package-lock.json` changes, nor changes to dependencies in
`package.json`.
