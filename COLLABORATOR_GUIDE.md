# Collaborator Guide

- [Issues and Pull Requests](#issues-and-pull-requests)
- [Accepting Modifications](#accepting-modifications)
  - [Involving the Science Center Team](#involving-the-science-center-team)
- [Technologies Used in the Project](#technologies-used-in-the-project)
- [Code Editing](#code-editing)
  - [Adding New Pages](#adding-new-pages)
    - [Create the Page Content](#create-the-page-content)
  - [Translating Pages](#translating-pages)
- [Creating Components](#creating-react-components)
  - [Styling a Component](#styling-a-component)
  - [Best Practices When Creating a Component](#best-practices-when-creating-a-component)
    - [How a New Component Should Look When Freshly Created](#how-a-new-component-should-look-when-freshly-created)
  - [Best Practices for Component Development in General](#best-practices-for-component-development-in-general)
- [Unit Tests and Storybooks](#unit-tests-and-storybooks)
  - [General Guidelines for Unit Tests](#general-guidelines-for-unit-tests)
  - [General Guidelines for Storybooks](#general-guidelines-for-storybooks)
- [Remarks on Technologies Used](#remarks-on-technologies-used)
- [Seeking Additional Clarification](#seeking-additional-clarification)

This document contains information for Collaborators of the Science Center project regarding code maintenance,
documentation, and Issues.

Collaborators should be familiar with the [Contributor Guide](./CONTRIBUTING.md).

## Issues and Pull Requests

Courtesy should always be shown to individuals submitting Issues and PRs to the Science Center project.

Collaborators should feel free to take full responsibility for managing Issues and PRs they feel qualified to handle, as
long as this is done while being mindful of these guidelines, the opinions of other Collaborators, and guidance of the
Science Center team.

Collaborators may **close** any Issue or PR they believe is not relevant to the future of the Science Center project.
Where this is unclear, the Issue should be left open for several days for additional discussion. Where this does not
yield input from Science Center Collaborators or additional evidence that the Issue has relevance, then the Issue may be
closed. Remember that Issues can always be re-opened if necessary.

> \[!IMPORTANT]\
> We recommend Collaborators to avoid unnecessarily rebasing/updating PRs, since we use
> [GitHub Merge Queues](https://github.blog/2023-07-12-github-merge-queue-is-generally-available/) to merge PRs, which
> automatically rebases and runs CI-checks against the latest base branch.

## Accepting Modifications

All Science Center code and documentation modifications should be performed via GitHub PRs. Only the Science Center team
can merge their work and should do so carefully.

All PRs must be reviewed and accepted by a Collaborator with sufficient expertise who can take full responsibility for
the change. In the case of PRs proposed by an existing Collaborator, an additional Collaborator is required for
sign-off.

PRs can only be merged after all CI-checks have passed. As usual, CI-checks need to be manually triggered by adding a
`github_actions:pull-request` label to the PR.

In some cases, it may be necessary to summon a qualified Collaborator to a PR for review by @-mention.

If you are unsure about the modification and are not prepared to take full responsibility for the change, defer to
another Collaborator.

We recommend Collaborators follow the guidelines in the [Contributor Guide](./CONTRIBUTING.md#before-merging) for
reviewing and merging PRs.

### Involving the Science Center Team

Collaborators may opt to elevate Issues or PRs to the team for discussion by mentioning `@ehharding`. This should be
done where a PR:

- Has a significant impact on the codebase,
- Is inherently controversial; or
- Has failed to reach a consensus amongst the Collaborators who are actively participating in the discussion.

The Science Center team should be the final arbiter where needed.

## Technologies Used in the Project

The project is built upon [React][] and [Next.js][], the UI rendering engine and the framework that builds the project,
respectively.

The project also uses several other open source libraries (not limited to):

- Styling is implemented with [PostCSS][] and CSS Modules.
  - We use a combination of PostCSS plugins to create a [SASS](https://sass-lang.com)-like environment.
  - We recommend reading the documentation of our plugins in case of doubt.
    - [PostCSS Import](https://github.com/postcss/postcss-import)
    - [PostCSS Mixins](https://github.com/postcss/postcss-mixins)
    - [PostCSS Simple Vars](https://github.com/postcss/postcss-simple-vars)
- [Tailwind][] is used as our CSS framework and is the foundation of our design system.
- [Hero Icons](https://heroicons.com) is an SVG icon library used within our codebase.
- [Radix UI][] is a collection of customizable UI components.
- [Shiki][] is a syntax highlighter used in our codeboxes.
  - The syntax highlighting is implemented within the processing of the Markdown files with the MDX compiler as a Rehype
    plugin.
- [MDX][] and Markdown are used for structuring the content of the project.
- [`next-intl`][] is the i18n library adopted within the project.
  - It provides excellent integration with Next.js, but it also has standalone support for i18n if it eventually
    migrates from Next.js to something else.
  - Supports React Server components and Next.js middlewares
- [`next-sitemap`](https://www.npmjs.com/package/next-sitemap) is used for sitemap and `robots.txt` generation.
- We use [Rehype](https://github.com/rehypejs/rehype) and [Remark](https://github.com/remarkjs/remark) to extend MDX
  functionality.
- We use [Storybook](https://storybook.js.org) for manual testing of our React components.
  - Storybook also provides a sandboxed environment, which is very useful whilst crafting React components.
- We use [Sentry](https://sentry.io/about) for reporting exceptions and monitoring the performance and reliability of
  the application.

## Code Editing

### Structure of This Repository

- React components are defined within `/components`.
- React templates are defined within `/layouts`.
- Global stylesheets are defined in `/styles`.
  - Styles are implemented with [PostCSS][].
- Public files are stored in `/public`.
  - Static images, JavaScript files, and the like are stored in `/public/static`.
- Internationalization is defined within `/i18n`.
  - React localization data is stored in `/i18n/locales`.
  - We use the [ICU Message Syntax](https://formatjs.io/docs/core-concepts/icu-syntax/) for translations.
  - Configuration for locales is defined within `/i18n/config.json`.
- Project content is defined within `/pages`.
  - Initial development usually happens in English in `/pages/en`.
  - Localized versions of `/pages/en` are defined within `/pages/{localeCode}`.
  - All content is in Markdown and is per-locale.
  - The top of each Markdown file is a YAML (Frontmatter) block for page-specific localization information passed to
    various templates.
  - The bulk of the Markdown content for each page is referenced as `{children}` in their respective JSX layout
    (`layouts/`).
- Multi-purpose React hooks are defined in `/hooks`.
- Multi-purpose TypeScript definitions are defined within `/types`.
- React context providers are defined within `/providers`.
- Build-time data fetching scripts are defined within `/next-data`.
  - Generation of build-time indexes, such as blog data
- Multi-purpose scripts are defined within `/scripts`.
  - Such as Science Center blog post generation
- Storybook configuration is defined within `/.storybook`.
  - We use an almost out-of-the-box Storybook experience with a few extra customizations.

### Adding New Pages

1. Create new page content, including the title, layout, and copy.
2. Update the relevant `/layout` to add a link to the new page.

#### Create the Page Content

Create a new Markdown file in `/pages/en`.

At the top of the Markdown file, within the Markdown Frontmatter, set a page title and layout.

```markdown
---
title: Title of the Page
layout: layout-name
---

[Content of the Page]
```

> \[!NOTE]\
> A list of currently available layouts are defined within `components/withLayout` in the `layoutComponents` map. This
> is a temporary map and it may change its location and be defined in a different way in the future.

## Creating React Components

The Science Center project uses [React][] as a frontend library to develop the project. React allows us to create rich
user interfaces with a modern take on web development.

If you're unfamiliar with React or web development in general, we encourage a read before taking on complex issues and
tasks as this repository is **not for educational purposes** and we expect you to have a basic understanding of the
technologies used.

We also recommend getting familiar with technologies such as [Next.js][], [MDX][], [PostCSS][], and "concepts" such as
"CSS Modules" and "CSS-in-JS".

### Styling a Component

As mentioned, we write all component-styles in separate `.module.css` files. This is like writing any CSS in a separate
file (besides the fact that we use [PostCSS][]).

This concept of writing styles in dedicated CSS files and importing them within JavaScript (or React) is a pattern named
**[CSS Modules](https://github.com/css-modules/css-modules)**. Modules allow us to write PostCSS (Or regular CSS, or any
flavor of CSS for that matter if you have a way of interpreting it) within a `.module.css` and import the class names
directly to our React components. We recommend reading guides on "Styling React components with CSS Modules", of which
there are many available on the web.

It's important to mention that we use [Tailwind][] as a CSS framework. Hence margins, paddings, font sizes, font
weights, colors, and other sorts of styles are all provided with Tailwind. We recommend reading the
[Tailwind Docs](https://tailwindcss.com/docs/preflight) to get familiar with Tailwind's styles. We also recommend
reading [this guide](https://tailwindcss.com/docs/editor-setup) for setting up Tailwind in your IDE.

Finally, if you're unfamiliar with how to use Tailwind or how to use Tailwind within CSS Modules, we recommend reading
[this guide](https://tailwindcss.com/docs/using-with-preprocessors).

#### Example of a CSS Module

```css
.myComponent {
  @apply some tailwind classes;
}
```

#### Guidelines When Writing CSS

- We use camelCase for defining CSS classes.
- We use Tailwind's `@apply` selector to apply Tailwind tokens.
  - We discourage the usage of any plain CSS styles and tokens; When in doubt, ask for help.
  - We require that you define one Tailwind token per line, just as shown in the example above, since this improves
    readability.
- Only write CSS within CSS Modules; Avoid writing CSS within JavaScript files.
- We recommend creating Mixins for reusable animations, effects, and more.
  - You can create Mixins within the `styles/mixins` folder.

> \[!NOTE]\
> Tailwind is already configured for this repository. You don't need to import any Tailwind Module within your CSS
> Module. You can apply Tailwind tokens with Tailwind's `@apply` CSS rule. Read more about
> [applying Tailwind classes with `@apply`](https://tailwindcss.com/docs/functions-and-directives#apply).

> \[!IMPORTANT]\
> When using IDEs such as Visual Studio Code, we recommend installing the official
> [Stylelint](https://marketplace.visualstudio.com/items?itemName=stylelint.vscode-stylelint) and
> [Tailwind](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss) extensions. These are
> recommended extensions for IntelliSense, syntax highlighting, and error checking when styling your component.

### Best Practices When Creating a Component

- All React components should be placed within the `components` folder.
- Each component should be placed, whenever possible, within a subfolder which we call the "domain" of the component.
  - The domain represents to which part of the project the component belongs or where they will be used.
  - For example, components used within article pages or that are part of the structure of an article or the article
    layouts, should be placed within `components/Article`.
- Each component should have its folder be named after the component itself.
- The structure of each component folder follows the following template:

  ```text
  - ComponentName
    - index.tsx // The component itself
    - index.module.css // All styles of the component are placed here.
    - index.stories.tsx // Component Storybook stories
    - __tests__ // Component tests (e.g., Unit tests, etc.)
      - index.test.mjs // Unit tests should be implemented in ESM and not TypeScript.
  ```

- React hooks belonging to a single component should be placed within the component's folder.
  - If the hook has wider usability potential (e.g., Can be used by other components), it should be placed in the root
    `hooks` folder.
- If the component has "sub-components", they should follow the same philosophy as the component itself.
  - For example, if the component `ComponentName` has a sub-component called `SubComponentName`, then it should be
    placed within `ComponentName/SubComponentName`.

#### How a New Component Should Look When Freshly Created

```tsx
import type { FC } from 'react';

import styles from './index.module.css';

type MyComponentProps = {}; // The types of the props of your component

const MyComponent: FC<MyComponentProps> = ({ prop1, prop2... }) => (
  // Actual code of MyComponent
);

export default MyComponent;
```

### Best Practices for Component Development in General

- Only spread props `{ ... }` in the definition of the component (avoid having a variable named `props`).
- Avoid importing `React`. Only import the modules from React that you need.
- When importing types, use `import type { NameOfImport } from 'module'`.
- When defining a component, use the `FC` type from React to define the type of the component.
  - When using `children` as a prop, use the `FC<PropsWithChildren<MyComponentProps>>` type instead.
  - Alternatively you can define your type as `type MyComponentProps = PropsWithChildren<{ my other props }>`.
- Each props type should be prefixed by the name of the component.
- Components should always be the `default` export of a React component file.
- Avoid using DOM/Web APIs/`document`/`window` API access within a React component. Use utilities or hooks when you need
  a reactive state.
- Avoid making your component too big. Deconstruct it into smaller components/hooks whenever possible.

## Unit Tests and Storybooks

Each new feature or bug fix should be accompanied by a unit test (when deemed valuable). We use [Jest][] as our test
runner and [React Testing Library][] for our React unit tests.

We also use [Storybook][] to document our components. Each component should have a Storybook Story that documents the
component's usage.

### General Guidelines for Unit Tests

Unit tests are fundamental to ensure that code changes do not disrupt the functionalities of the Science Center project:

- Unit tests should be implemented as `.mjs` files.
- We recommend adding unit tests for content covering `components`, `hooks`, `scripts`, and `util` whenever possible.
- Unit tests should ensure that a given change's functionality is working as intended.
- When creating unit tests for React components, we recommend that the tests cover all the possible states of the
  component.
- We also recommend mocking external dependencies. If you are unsure about how to mock a particular dependency, raise
  the question in your PR.
  - We recommend using [Jest's Mock Functions](https://jestjs.io/docs/en/mock-functions) for mocking dependencies.
  - We recommend using [Jest's Mock Modules](https://jestjs.io/docs/en/manual-mocks) for mocking dependencies
    unavailable on the Node.js runtime.
  - Common providers and contexts from the lifecycle of our application, such as [`next-intl`][], should not be mocked
    but given an empty or fake context whenever possible.
- We recommend reading previous unit tests from the codebase for inspiration and code guidelines.

### General Guidelines for Storybooks

Storybooks are an essential part of our development process. They help us to document our components and to ensure that
the components are working as intended.

They also allow developers to preview components and to be able to test them individually/manually down to the smallest
unit of the application (The individual component itself).

**Storybooks should be fully typed and follow the following template:**

```tsx
import type { Meta as MetaObj, StoryObj } from '@storybook/react';
import NameOfComponent from '@components/PathTo/YourComponent';

type Story = StoryObj<typeof NameOfComponent>;
type Meta = MetaObj<typeof NameOfComponent>;

// If the component has any props that are interactable, they should be passed here. We recommend reading the Storybook
// Docs for args: https://storybook.js.org/docs/react/writing-stories/args
export const Default: Story = {};

// If the component has more than one layout/state/variant, there should be one Story for each variant.
export const AnotherStory: Story = {
  args: {},
};

export default { component: NameOfComponent } as Meta;
```

- Stories should have `args` whenever possible. We want to be able to test the different aspects of a component.
- Please follow the template above to keep the Storybooks as consistent as possible.
- We recommend reading previous Storybooks from the codebase for inspiration and code guidelines.
- If you need to decorate/wrap your component/Story with a container/provider, please use
  [Storybook Decorators](https://storybook.js.org/docs/react/writing-stories/decorators).

## Remarks on Technologies Used

The Science Center project is a somewhat complex application and at times non-trivial solutions have been implemented to
solve certain technical challenges.

### Why Next.js?

We've found that Next.js is simply versatile, hackable, stable, community-maintained, and has a great ecosystem. The
reasoning goes deeper but as a long-term framework it is the most suitable choice.

#### Why Do We Continue To Support Static Builds?

It was decided that the Science Center project should always support fully static builds that do not depend on any 3rd
party services. This is to ensure that the project is always available and that we do not depend on any 3rd party
services to serve our content.

(For example, if we abandon GitHub Pages, our project should still completely work as standalone as possible.)

#### What Is `next.dynamic.mjs`?

Our whole project uses a custom renderer for rendering the pages. As you might have seen, within the `pages` directory
we have a [Next.js Dynamic Route](https://nextjs.org/docs/pages/building-your-application/routing/dynamic-routes) named
`[...path].tsx` that matches against all possible routes of the project.

This means that each `.md(x)` file within `pages/` is not rendered by the regular Next.js application tree
(`pages/_document.tsx` and `pages/_app.tsx`), but with a custom render tree.

This custom renderer uses `getStaticPaths` and
[Incremental Static Generation](https://nextjs.org/docs/pages/building-your-application/data-fetching/incremental-static-regeneration)
to generate the full list of supported pages of the project. For example, this allows us to generate localized pages for
every page that is not translated by telling Next.js to create a localized path. `next.dynamic.mjs` is responsible for
getting a full list of the source pages (`pages/en`) and identifying which pages have been translated.

Non-translated pages will have their localized contexts and translated React message bags (`next-intl`), but the content
will be the same as the source page (English), whereas localized pages will have localized context and content.

This custom solution is also able to decide what paths should be compiled during runtime. This is dictated by a
combination of rules defined in `next.constants.mjs` and `[...path].tsx`.

The `[...path].tsx` file ultimately utilizes the `theme.tsx` file as its layout source. This setup enables the loading
of the layout provider and MDX provider which, in turn, encapsulates and manages the rendering of any child content or
components. This includes both content and components provided by the layout provider and the transformed MDX content
originating from the `.md(x)` source page.

#### What Is `next.data.mjs`?

This file is responsible for loading, fetching, and generating build-time required information such as blog post
metadata (for pagination and indexing), RSS feeds, etc.

#### What Is `site.json`?

This file is used for defining project metadata such as which RSS feeds should be generated, social media information,
and other metadata used during the project build-time. We use a JSON format to ease collaboration.

#### What Is `next.locales.mjs` and Why Not Use Next.js's Built-In i18n?

While Next.js provides a built-in i18n feature, it doesn't offer the flexibility we require. Our specific needs include
the ability to generate comprehensive lists of supported locales and pages for each locale. Additionally, we operate
with a subfolder-based approach for content, as opposed to the extension-based approach
(e.g., `filename.language.md(x)`) that is compatible with Next.js's built-in i18n.

We opted for the subfolder approach to ensure long-term maintainability, rather than relying on Next.js's i18n
functionality.

#### What Is `next.rewrites.mjs`?

This file is responsible for defining the rewrite rules for the project. It is used for defining redirects and other
rewrite rules (Such as internal redirects and external ones).

The `redirects.json` file specifies two types of operations:

- Rewrites: These operations do not alter the original URL but instead render the content from the rewritten URL. It's
  important to note that the rewritten URL path must both exist in the project and be valid.
- Redirects: Redirect operations, on the other hand, change the original URL to a new one. While these new URLs can be
  either internal (within the project) or external (leading to a different domain), it is more common for redirects to
  point to external URLs.

This file contains a simple template engine that supports `/:locale` to indicate that this path should also be available
under all available locales as prefix.

#### Why Do We Use Next.js Middlewares?

We have a simple Next.js middleware that is responsible for handling initial locale detection and redirection. It
detects browser locales and redirects to the most suitable locale for the user, and it falls back to `/en` if no
suitable locale is found.

#### What Are Layouts?

Layouts wrap the content of the Markdown files. They are responsible for adding additional styling and structure
surrounding the content.

Layouts are defined within the `layouts` folder. They are React components that receive the `children` prop, which is
the transformed MDX content of the Markdown file.

Each page layout is configured within their Markdown's Frontmatter as `layout: name-of-layout`.

### How Do We Style the Project?

We use [PostCSS][] to style the Science Center project; PostCSS is a CSS preprocessor, like SASS and LESS.

#### How Exactly Do We Style Components?

We style each individual React component with a dedicated CSS file (A CSS Module) that uses CSS syntax (With the extra
powerups of PostCSS).

The [Styling a Component](#styling-a-component) section contains a more detailed guide on how we style our components.

#### Why Do We Use PostCSS Over SASS or LESS?

The main advantage of PostCSS is its minimal pluggable API that allows us to extend the native CSS-syntax with custom
plugins.

Next.js natively supports PostCSS and actually uses it as part of the bundling and building process. By not using SASS
or LESS we remove another dependency from our build process and a layer of preprocessing from our styles (CSS).

We currently use a set of PostCSS plugins that creates an SCSS-like environment.

#### What PostCSS Plugins Do We Use?

- `postcss-calc`: Strips `calc` expressions and replaces them with the result
- `postcss-import`: Allows us to use SASS-like imports
- `postcss-mixins`: Allows us to use SASS-like Mixins
- `postcss-nested`: Allows us to use SASS-like nesting
- `postcss-simple-vars`: Allows us to use SASS-like variables

It is important to mention that even though we use SCSS-like syntax, we do not use SCSS, and some of these plugins are
not 100% compatible with the SCSS syntax. For example, `postcss-mixins` does not support `@include` or `@extend`
directives (And it uses `@define-mixin` for defining Mixins and `@mixin` for including them).

#### Do We Use a CSS Framework?

The Science Center project uses Tailwind as a CSS framework for crafting our React components and styling the project.

[Tailwind][] is an utility-first CSS framework. It allows us to create a design system that is easy to maintain and
extend. It also allows us to create a consistent design language across the project.

#### Font Families in the Project

We use `next/fonts`' `Open Sans` as the default font for the Science Center project. The font is configured as a CSS
variable and then configured in `tailwind.config.js` as the default font for the project.

#### Why Do We Use RadixUI?

- It is a minimalistic component library broken down in individual packages for each component.
- It already handles all WAI-ARIA and accessibility bindings/shortcuts needed for interactive elements.
- It allows us to focus on designing interactive components without the effort of adding all the surrounding sugar and
  code needed to make the component accessibility-friendly.

### Why MDX?

MDX is an extension of Markdown that allows us to add JSX components within Markdown. Besides that, MDX is also a
pluggable parser built on top of `unified` which supports Rehype and Remark plugins. MDX is becoming the standard for
parsing human-readable content in React/Next.js-based applications.

**Some of the plugins that we use include:**

- `rehype-autolink-headings`: Allows us to add anchor links to Markdown headings
- `rehype-slug`: Allows us to add ids to Markdown headings
- `remark-gfm`: Allows us to bring GitHub-flavoured Markdown to MDX
- `remark-headings`: Generates metadata for Markdown headings
  - This allows us to build the table of contents for each page, for example.

#### Syntax Highlighting (Shiki) and GitHub Pages

Shiki is integrated in our workflow as a Rehype plugin (See the `next.mdx.shiki.mjs` file). We also use the `nord` theme
from Shiki and a subset of the supported languages as defined in the `shiki.config.mjs` file.

### GitHub Pages

We use GitHub Pages as our hosting provider. It is a great platform that offers an excellent CI/CD pipeline which allows
us to deploy our project with ease.

It is important to mention that there are some rules on our GitHub Pages deployments such as:

- Branches starting with `dependabot` (Dependabot Automated PRs) or `gh` (GitHub Merge Queues) are not deployed to
  GitHub Pages.
- GitHub Pages deployments are triggered for all other branches during `push` activities.
- We have a custom install script that executes `npm ci --omit=dev` (The same way we do in our CI pipelines).
  - Hence if builds fail unexpectedly, make sure that the dependency that is being used during build-time is in
    `dependencies` and not `devDependencies`. Check out [DEPENDENCY_PINNING.md](./DEPENDENCY_PINNING.md) for more
    information.

### Why Do We Have a `.vscode` Folder?

The repository defines an optimized configuration for code editing. This is optional and is not required to contribute
to the project. However, the extensions and settings specified help create a more uniform and efficient developer
experience. This configuration is found in the `.vscode` directory:

- `extensions.json` suggests VSCode extensions that make the editor more compatible with the code. For example, a
  Tailwind extension creates auto-complete IntelliSense for Tailwind styles within our components. ESLint, Prettier, and
  EditorConfig extensions read their respective config files and automatically format or lint code as written. This
  helps save CI feedback loops when a contribution does not meet our standards.
- `settings.json` contains some common sense defaults that aide development and enforce consistency across the codebase.
  For example, we want files formatted on save and we want Prettier to be used as the formatter. Without these settings,
  new Contributors may have different authoring experiences when contributing, leading to inconsistent code and CI
  failures. We also disable VSCode's default CSS parser so PostCSS and Tailwind syntax are respected.

Defining a `.vscode` configuration like this also aides browser-only development using GitHub's
[Codespaces](https://github.com/features/codespaces) feature. The web-based GUI will read these same configuration files
and setup the remote development environment the same way every time.

### Why Do We Have a `.npmrc` File?

The npm ecosystem resolution and installation of `peerDependencies` installation
[changed in recent versions](https://nodejs.org/en/blog/npm/peer-dependencies#using-peer-dependencies). The project
documents what version of `Node.js` and `npm` to use via the
[`.nvmrc` file](https://github.com/nodejs/nodejs.org/blob/main/.nvmrc). Not all Contributors have tooling to
automatically read this file and adhere to the correct version, however. To ensure all Contributors install dependencies
the same way, a local `.npmrc` file directly configures peerDependency installation behavior.

## Seeking Additional Clarification

If you're unfamiliar or curious about something, we recommend opening a discussion on this GitHub repository.

[`next-intl`]: https://next-intl-docs.vercel.app
[Jest]: https://jestjs.io
[MDX]: https://mdxjs.com
[Next.js]: https://nextjs.org
[PostCSS]: https://postcss.org
[Radix UI]: https://www.radix-ui.com
[React]: https://react.dev
[React Testing Library]: https://testing-library.com/docs/react-testing-library/intro/
[Shiki]: https://github.com/shikijs/shiki
[Storybook]: https://storybook.js.org
[Tailwind]: https://tailwindcss.com
