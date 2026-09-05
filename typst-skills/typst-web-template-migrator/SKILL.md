---
name: typst-web-template-migrator
description: Migrate an existing Typst notes repo from an older HTML/web template to a newer reference template, especially when the source repo already has a working `uv run web/build.py` pipeline and the goal is to adopt the newer `slipperking/underactuated-robotics` site format without breaking the build. Use when the user wants the new web look and structure, not a speculative rewrite of the whole Typst architecture.
---

# Typst Web Template Migrator

Use this skill when a Typst notes repo already builds to HTML and the task is to update it to a newer site template. The default strategy is to preserve the repo's working build path and port the template layer onto it.

## Core rule

Do not start with a full architectural rewrite just because the reference repo uses a different Typst layout. First identify:

1. The source repo's real working web build path.
2. The reference repo's real HTML/template assets.
3. Whether the source repo can safely adopt the reference architecture, or whether only the visual/template layer should be ported.

If the source repo already has a working splitter-based pipeline such as `uv run web/build.py`, prefer keeping that pipeline and porting the newer DOM, CSS, JS, and cover markup into it.

## Primary references

When the target style is the newer Underactuated Robotics site, inspect these files directly before editing:

- `https://github.com/slipperking/underactuated-robotics/blob/main/src/assets/site.css`
- `https://github.com/slipperking/underactuated-robotics/blob/main/src/assets/site.js`
- `https://github.com/slipperking/underactuated-robotics/blob/main/src/components/web.typ`
- Or all of `https://github.com/slipperking/complex-analysis`

Do not rely on memory for the template structure when the repo is accessible.

## Migration workflow

### 1. Reproduce the source repo's current build first

- Find the exact command the repo already uses to build HTML.
- Prefer the repo's own script or workflow over ad hoc `typst compile` guesses.
- If the repo already serves `web/dist`, keep that output contract unless there is a strong reason to change it.

Validated examples:

- `uv run web/build.py`
- `python3 -m http.server 8000 -d web/dist`

### 2. Inspect the reference template as a system

Treat the template as four coupled layers:

1. Typst-side cover and page markup.
2. Generated HTML structure.
3. CSS selectors and layout variables.
4. JS behavior that expects specific classes and DOM patterns.

Swapping CSS alone is usually insufficient. The builder output and the assets must agree on class names and structure.

### 3. Choose the migration mode explicitly

Use the safer mode by default:

- **Template-layer port**: Keep the existing HTML pipeline and adapt it to emit the new structure expected by the reference CSS and JS.

Use full architecture replacement only when all of the following are true:

- The source repo does not already have a stable web build.
- The reference Typst architecture is compatible with the source repo's Typst version and package layout.
- You can validate the new end-to-end build path immediately.

### 4. Port the builder before touching chapter structure

For splitter/post-processing pipelines, update the builder to emit the reference site's semantic structure:

- top bar container and icon actions
- global nav tree classes and nesting
- right-hand local table of contents markup
- previous and next page cards
- page container classes used by the reference stylesheet

If the source builder emits old project-specific wrappers, the new stylesheet will not fully apply.

### 5. Port the web assets

Adapt these files from the reference repo into the source repo's asset locations:

- site stylesheet
- site behavior script
- optional icons or favicon wiring if the source repo supports them

Preserve local paths expected by the current builder unless you are also updating the builder output.

### 6. Port the home cover markup

The landing page often requires Typst-side changes, not just CSS changes. Replace old hero or paper-header markup with markup that matches the reference design more closely, such as:

- course label
- large title block
- authors
- date or term
- abstract or summary
- PDF button
- source link

If the home page still uses the old classes, the new site can compile while still looking like the old template.

### 7. Add cache-busting if the browser appears unchanged

If the generated site still looks stale after CSS or JS changes, inspect the built HTML and verify the asset URLs. When needed, append a version query derived from file modification time or content hash so the generated HTML references:

- `assets/style.css?v=...`
- `assets/modifications.js?v=...`

This is often the difference between "files changed on disk" and "browser still shows the old format."

### 8. Validate the real output, not just the source edits

After changes:

1. Run the actual build command.
2. Serve the output directory the repo expects.
3. Inspect `web/dist/index.html`.
4. Verify that the emitted DOM matches the classes expected by the new CSS and JS.
5. Compare the rendered home page and an inner chapter page against the reference.

Useful checks:

- `python3 -m py_compile web/build.py`
- `sed -n '1,220p' web/dist/index.html`
- `sed -n '1,220p' web/dist/assets/style.css`

## Pitfalls

- Do not assume the reference repo's Typst component architecture can be dropped into the source repo unchanged.
- Do not overwrite a working build path just to imitate the reference directory layout.
- Do not judge success from the source files alone; check the emitted HTML.
- Do not treat CSS differences as the only problem when JS and DOM structure also changed upstream.
- Do not forget that the cover page may still be using old Typst markup even when inner pages are closer to the new style.
- FUNCTIONS SUCH AS ALIGN, ETC. DO NOT WORK IN HTML, FOR IMAGES PLEASE USE THE `figure-wrapper` constructs, for cetz canvas, use the `canvas` function (not `cetz.canvas`) to ensure HTML support, and DO NOT MODIFY INFRASTRUCUTRE TO ENSURE COMPILING. THE WORKFLOWS AND BUILDING NEED TO USE THE CUSTOM TYPST FILES since they contain important modifications from the official typst executable.

## Decision heuristics

- If the repo already builds cleanly with `uv run web/build.py`, preserve that path first.
- If a migration attempt breaks compilation and the user's actual ask is "same HTML format," revert to the last working pipeline and port the template layer instead.
- If the visual result is still "not the same," inspect the generated DOM and cover markup before changing content or chapter files.

## Deliverable standard

A successful migration means:

- the repo still builds with its established command,
- the generated `web/dist` site uses the newer template structure,
- the home page and chapter pages visually track the reference repo closely,
- the migration is incremental and reversible.
