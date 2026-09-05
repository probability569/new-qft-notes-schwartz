# Routes and converted notes

`route` is a URL folder segment, not a Typst source path. For example,
`docs-backmatter.with(title: "Bibliography", route: "bibliography")` produces
`bibliography/index.html` in a bundle, served at `<site-root>/bibliography/`.
The source file can live anywhere; it must be included to appear in the build.
An ordinary PDF build uses the same content without creating web routes.

## How the hierarchy works

`src/components/web.typ` maintains a `route-folders` state. Each page keeps the
first `level - 1` segments from the preceding page, then appends its own segment:

| Wrapper | Level | Example output route |
| --- | --- | --- |
| `docs-cover` | 0 | `/` with `route: "/"` |
| `docs-frontmatter`, `docs-chapter`, `docs-appendix`, `docs-backmatter` | 1 | `/cft/` |
| `docs-subchapter` | 2 | `/cft/lagrangians/` |
| `docs-subsubchapter` | 3 | `/cft/lagrangians/example/` |

Use single, preferably lowercase, hyphenated segments, such as `quantization-and-fock`.
Do not pass `cft/lagrangians` as a route. Keep complete routes unique and avoid
the built-in routes `search`, `todo`, and `page-not-found`.

Include order determines parents and navigation order; filesystem nesting alone
does not. Declare child pages through the parent's `children` argument so they
are emitted after the parent page, outside its HTML document:

```typst
#import "/lib.typ": *

#show: docs-chapter.with(
  title: "Classical Field Theory",
  route: "cft",
  children: [
    #include "lagrangians/index.typ"
    #include "noether/index.typ"
  ],
)

Chapter introduction goes here.
```

Each child uses `docs-subchapter.with(...)` with its own single segment.
Include the parent in `chapters/index.typ`. A level-1 page resets the parent
segments, so Bibliography stays at `/bibliography/` even after nested chapters.
The optional `route-prefix` state prepends extra URL segments; it is currently empty.

Page metadata drives the sidebar and previous/next links. Links and asset paths
are computed relative to each generated file, so ordinary navigation works under
a hosting subdirectory. `description` is stored in page metadata; it does not
choose a path. `docs-backmatter` suppresses the automatic source heading because
`bibliography(...)` supplies its own heading.

## Build and migration status

Use the project's bundled compiler, which supports its experimental bundle API:

```sh
./typst compile --root . --features html,bundle --format bundle main.typ dist
python3 build-search-index.py
```

The search script needs Beautiful Soup (`bs4`). Compile into a fresh output
directory when removing or renaming routes: stale HTML files in `dist` can still
be served and picked up by the search index. Serve the output through an HTTP
server to use directory links such as `../bibliography/`.

The included notes are the cover, preface, prerequisites and linear algebra,
classical field theory and its two child pages, and bibliography. Other legacy
chapters still need their imports, wrappers, and include paths converted before
being added to `chapters/index.typ`.

`src/source.typ` holds `site-url`, used for the absolute 404 redirect. Its default
assumes GitHub Pages for the configured source repository; adjust it if deploying
elsewhere. It does not control ordinary relative navigation.
