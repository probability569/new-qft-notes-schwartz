#import "styles.typ": document-styles, explicit-label, pdf-doc-label, web-doc-label
#import "theorems.typ": *
#import "/src/source.typ" as source

#let notes-title = source.title
#let authors = source.authors
#let date = source.date
#let source-url = source.source-url
#let abstract = source.abstract

#let render-mode = state("render-mode", "web")
#let route-prefix = state("route-prefix", ())
#let route-folders = state("route-folders", ())

#let _normalize-route(route) = {
  let value = route
  if not value.starts-with("/") {
    value = "/" + value
  }
  if not value.ends-with("/") {
    value = value + "/"
  }
  value
}

#let _route-segment(route) = {
  if route == none or route == "/" or route == "" {
    none
  } else {
    assert(type(route) == str, message: "route must be a single folder name")
    assert(not route.contains("/"), message: "route must be a single folder name, not a path")
    route
  }
}

#let _route-from-folders(folders) = {
  if folders.len() == 0 {
    "/"
  } else {
    "/" + folders.join("/") + "/"
  }
}

#let _route-id(route) = {
  let route = _normalize-route(route)
  let inner = route.slice(1, route.len() - 1)
  if inner == "" {
    "home"
  } else {
    inner.replace("/", "-")
  }
}

#let _route-path(route) = {
  let route = _normalize-route(route)
  let inner = route.slice(1, route.len() - 1)
  if inner == "" {
    "index.html"
  } else {
    inner + "/index.html"
  }
}
#let _document-path(route) = "/" + _route-path(route)

#let _route-depth(route) = {
  let route = _normalize-route(route)
  let inner = route.slice(1, route.len() - 1)
  if inner == "" {
    0
  } else {
    inner.split("/").filter(part => part != "").len()
  }
}

#let _dirs-for(path) = path.split("/").slice(0, path.split("/").len() - 1).filter(part => part != "")
#let _root-prefix(path) = range(_dirs-for(path).len()).map(_ => "../").join("")
#let _pretty-path(path) = if path == "index.html" {
  "index.html"
} else if path.ends-with("/index.html") {
  path.slice(0, path.len() - "index.html".len())
} else {
  path
}
#let _href-from(current-path, target-path) = _root-prefix(current-path) + _pretty-path(target-path)
#let _asset-href(current-path, asset-path) = _root-prefix(current-path) + asset-path

#let _page-info(
  title: none,
  route: none,
  kind: "section",
  level: 1,
  heading-level: 1,
  heading-format: (number, title) => if number != none { [#number #title] } else { [#title] },
  description: none,
  label: none,
) = {
  assert(title != none, message: "docs page needs a title")
  assert(route != none, message: "docs page needs a route")
  let route = _normalize-route(route)
  (
    id: _route-id(route),
    title: title,
    route: route,
    path: _route-path(route),
    doc-path: _document-path(route),
    kind: kind,
    level: level,
    heading-level: heading-level,
    heading-format: heading-format,
    description: description,
    label: label,
  )
}

#let _first-page-heading(page) = {
  let headings = query(selector(heading).within(label("doc-" + page.id)))
  if headings.len() > 0 { headings.first() } else { none }
}

#let _heading-number(h) = {
  if h != none and h.numbering != none {
    counter(heading).display(at: h.location())
  } else {
    none
  }
}

#let _page-depth(page) = {
  let h = _first-page-heading(page)
  if h == none { 0 } else { calc.max(0, h.level - 1) }
}

#let _page-label(page) = {
  let h = _first-page-heading(page)
  let number = _heading-number(h)
  let title = if h != none { h.body } else { page.title }

  (page.heading-format)(number, title)
}

#let _set-route-folders(level, route) = route-folders.update(folders => {
  let keep = calc.min(folders.len(), calc.max(0, level - 1))
  let next = folders.slice(0, keep)
  let segment = _route-segment(route)
  if segment != none {
    next.push(segment)
  }
  next
})

#let _page-heading(page) = {
  if page.label == none {
    heading(level: page.heading-level, [#page.title])
  } else {
    explicit-label(page.label, heading(level: page.heading-level, [#page.title]))
  }
}

#let _pages() = query(<page-meta>).map(it => it.value)
#let _icon(name, path) = html.elem("img", attrs: (class: "icon", src: path, alt: name))

#let _todo-description(body) = if body == none { [No description provided.] } else { body }

#let todo(..args) = context {
  assert(args.pos().len() <= 1, message: "todo accepts at most one content argument")
  let body = args.pos().first(default: none)
  let description = _todo-description(body)
  if render-mode.get() == "web" {
    [
      #metadata((description: description)) <todo-marker>
      #html.elem("aside", attrs: (class: "todo-callout", role: "note", "aria-label": "Todo"), {
        link(<sec:todo>, html.elem("em", attrs: (class: "proof-head"), [Todo.]))
        sym.space.nobreak
        html.elem("span", attrs: (class: "todo-callout-description"), description)
      })
    ]
  }
}

#let _nav-link(current, page) = context {
  let depth = _page-depth(page)
  let cls = (
    "nav-item",
    if page.id == current.id { "active" } else { none },
  )
    .filter(x => x != none)
    .join(" ")

  html.elem("li", attrs: (class: cls, style: "--depth: " + str(depth)), {
    html.elem("a", attrs: (href: _href-from(current.path, page.path)), _page-label(page))
  })
}

#let _global-nav(current) = context {
  let pages = _pages()
  html.elem("nav", attrs: (class: "global-nav", "aria-label": "Site navigation"), {
    html.elem("ul", {
      for page in pages {
        _nav-link(current, page)
      }
    })
  })
}

#let theorem-heading(thm) = {
  let head = [*#thm.supplement~#thm.number*]
  if thm.name != none {
    head += [~(#thm.name)]
  }
  head
}

#let _toc-entry(class, location, body, depth: 0) = html.elem(
  "li",
  attrs: (
    class: class,
    style: "--toc-depth: " + str(depth),
  ),
  {
    link(location, body)
  },
)

#let _heading-toc-entry(h, page) = {
  let number = _heading-number(h)
  let page-heading = _first-page-heading(page)
  if page-heading != none and h.location() == page-heading.location() {
    (page.heading-format)(number, h.body)
  } else if number != none {
    [#sym.section#number #h.body]
  } else {
    h.body
  }
}

#let _local-toc(current) = context {
  let doc-label = label("doc-" + current.id)
  let first-heading = _first-page-heading(current)
  let targets = query(selector(heading).within(doc-label).or(selector(<meta:thm-env-counter>)).within(doc-label))

  let entries = ()
  for el in targets {
    if el.func() == heading {
      entries.push((level: el.level, kind: "heading", loc: el.location(), body: _heading-toc-entry(el, current)))
    } else {
      let thm = el.value
      entries.push((level: 3, kind: "theorem", loc: el.location(), body: theorem-toc-entry(thm)))
    }
  }
  entries = entries.sorted(key: e => e.loc.position().page * 100000 + e.loc.position().y / 1pt) // establish hierarchy and sub-hierarchy

  html.elem("nav", attrs: (class: "local-toc", "aria-label": "On this page"), {
    html.elem("h2", [On This Page])
    if entries.len() == 0 {
      html.elem("p", attrs: (class: "muted"), [No entries yet.])
    } else {
      html.elem("ul", {
        for entry in entries {
          let depth = calc.max(0, entry.level - 2)
          let cls = "toc-" + entry.kind
          _toc-entry(cls, entry.loc, entry.body, depth: depth)
        }
      })
    }
  })
}

#let _prev-next(current) = context {
  let pages = _pages()
  let idx = pages.position(page => page.id == current.id)
  let prev = if idx != none and idx > 0 { pages.at(idx - 1) } else { none }
  let next = if idx != none and idx < pages.len() - 1 { pages.at(idx + 1) } else { none }

  html.elem("nav", attrs: (class: "page-nav", "aria-label": "Previous and next pages"), {
    if prev != none {
      html.elem("a", attrs: (class: "page-nav-card nav-prev", href: _href-from(current.path, prev.path)), {
        html.elem("span", attrs: (class: "page-nav-arrow"), [←])
        html.elem("span", attrs: (class: "page-nav-kicker"), [Previous])
        html.elem("span", attrs: (class: "page-nav-title"), _page-label(prev))
      })
    } else {
      html.elem("span", attrs: (class: "page-nav-spacer"))
    }
    if next != none {
      html.elem("a", attrs: (class: "page-nav-card nav-next", href: _href-from(current.path, next.path)), {
        html.elem("span", attrs: (class: "page-nav-kicker"), [Next])
        html.elem("span", attrs: (class: "page-nav-title"), _page-label(next))
        html.elem("span", attrs: (class: "page-nav-arrow"), [→])
      })
    } else {
      html.elem("span", attrs: (class: "page-nav-spacer"))
    }
  })
}

#let _topbar(current) = html.elem("header", attrs: (class: "topbar"), {
  html.elem("div", attrs: (class: "topbar-left"), {
    html.elem("button", attrs: (class: "icon-button sidebar-toggle", id: "sidebar-toggle-left", "aria-label": "Menu"), {
      _icon("Menu", _asset-href(current.path, "assets/menu.svg"))
    })
    html.elem("a", attrs: (class: "topbar-title", href: _href-from(current.path, "index.html")), notes-title)
  })
  html.elem(
    "form",
    attrs: (
      class: "topbar-search",
      "data-search-form": "true",
      role: "search",
      action: _href-from(current.path, "search/index.html"),
      method: "get",
    ),
    {
      html.elem("input", attrs: (
        class: "search-input",
        type: "search",
        name: "q",
        placeholder: "Search...",
        autocomplete: "off",
        "aria-label": "Search the site",
      ))
      html.elem("button", attrs: (class: "search-submit icon-button", type: "submit", "aria-label": "Search"), {
        _icon("Search", _asset-href(current.path, "assets/search.svg"))
      })
    },
  )
  html.elem("div", attrs: (class: "topbar-right"), {
    html.elem("button", attrs: (class: "icon-button theme-toggle", "aria-label": "Toggle theme"), {
      _icon("Theme", _asset-href(current.path, "assets/theme.svg"))
    })
    html.elem(
      "button",
      attrs: (class: "icon-button print-button", type: "button", "aria-label": "Print page", title: "Print"),
      {
        _icon("Print", _asset-href(current.path, "assets/print.svg"))
      },
    )
    html.elem(
      "a",
      attrs: (
        class: "icon-button export-pdf-link",
        href: _href-from(current.path, "pdf/notes.pdf"),
        "aria-label": "Export PDF",
        title: "Export PDF",
      ),
      {
        _icon("Export PDF", _asset-href(current.path, "assets/download.svg"))
      },
    )
    html.elem("a", attrs: (class: "icon-button github-link", href: source-url, "aria-label": "GitHub source"), {
      _icon("GitHub", _asset-href(current.path, "assets/github.svg"))
    })
    html.elem(
      "button",
      attrs: (class: "icon-button sidebar-toggle", id: "sidebar-toggle-right", "aria-label": "Page contents"),
      {
        _icon("Contents", _asset-href(current.path, "assets/toc.svg"))
      },
    )
  })
})

#let _cover-content(current) = source.web-cover(path => _href-from(current.path, path))

#let _pdf-cover() = source.pdf-cover(outline-target: selector(heading).within(pdf-doc-label))

#let _pdf-document(path: none) = context {
  let body = [
    #[
      #render-mode.update("pdf")
      #show: document-styles.with(mode: "pdf")
      #include "/chapters/index.typ"
    ] #pdf-doc-label
  ]

  if path == none {
    body
  } else {
    document(path, format: "pdf", title: notes-title)[#body]
  }
}

#let _html-page(page, body) = [
  #metadata(page) <page-meta>
  #document(page.doc-path, title: [#_page-label(page) | #notes-title])[
    #show: document-styles.with(mode: "web")
    #counter(math.equation).update(0)
    #thm-counter.thm-counters.update((:))
    #html.elem("link", attrs: (rel: "stylesheet", href: _asset-href(page.path, "assets/site.css")))
    #html.elem("link", attrs: (rel: "stylesheet", href: _asset-href(page.path, "assets/search.css")))
    #_topbar(page)
    #html.elem("div", attrs: (class: "layout"))[
      #html.elem("aside", attrs: (class: "sidebar-left"))[
        #_global-nav(page)
      ]
      #html.elem("main", attrs: (class: "content", id: "main"))[
        #if page.kind != "cover" {
          html.elem("h1", attrs: (class: "page-title"), _page-label(page))
        }
        #body
        #_prev-next(page)
      ]
      #html.elem("aside", attrs: (class: "sidebar-right"))[
        #_local-toc(page)
      ]
    ]
    #html.elem("div", attrs: (class: "sidebar-backdrop", id: "sidebar-backdrop"))
    #html.elem("script", attrs: (src: _asset-href(page.path, "assets/site.js")), [])
    #html.elem("script", attrs: (src: _asset-href(page.path, "assets/search.js")), [])
  ] #label("doc-" + page.id)
]

#let _standalone-page(page, main-class: none, extra-scripts: (), body) = {
  let main-classes = ("content", main-class).filter(value => value != none).join(" ")

  document(page.doc-path, title: [#page.title | #notes-title])[
    #show: document-styles.with(mode: "web")
    #html.elem("link", attrs: (rel: "stylesheet", href: _asset-href(page.path, "assets/site.css")))
    #html.elem("link", attrs: (rel: "stylesheet", href: _asset-href(page.path, "assets/search.css")))
    #_topbar(page)
    #html.elem("div", attrs: (class: "layout"))[
      #html.elem("aside", attrs: (class: "sidebar-left"))[
        #_global-nav(page)
      ]
      #html.elem("main", attrs: (class: main-classes, id: "main"))[
        #body
      ]
      #html.elem("aside", attrs: (class: "sidebar-right"))[
        #_local-toc(page)
      ]
    ]
    #html.elem("div", attrs: (class: "sidebar-backdrop", id: "sidebar-backdrop"))
    #for script-path in extra-scripts {
      html.elem("script", attrs: (src: _asset-href(page.path, script-path)), [])
    }
    #html.elem("script", attrs: (src: _asset-href(page.path, "assets/site.js")), [])
    #html.elem("script", attrs: (src: _asset-href(page.path, "assets/search.js")), [])
  ]
}

#let _search-page() = {
  let page = (
    id: "search",
    title: "Search",
    route: "/search/",
    path: "search/index.html",
    doc-path: "/search/index.html",
    kind: "search",
    level: 1,
    heading-level: 1,
    description: none,
  )

  _standalone-page(page, main-class: "search-page", extra-scripts: ("assets/search-index.js",))[
    #html.elem("h1", attrs: (class: "page-title"), [Search])
    #html.elem("p", attrs: (class: "search-warning"), [
      Search functionality is still experimental, and math expressions do not work well yet.
    ])
    #html.elem("p", attrs: (class: "search-summary", id: "search-summary"), [
      Enter a word or phrase to search the notes.
    ])
    #html.elem("section", attrs: (class: "search-results", id: "search-results", "aria-live": "polite"))[
      #html.elem("div", attrs: (class: "search-empty"), [Search results will appear here.])
    ]
  ]
}

#let _todo-page() = context {
  let page = (
    id: "todo",
    title: "Todos",
    route: "/todo/",
    path: "todo/index.html",
    doc-path: "/todo/index.html",
    kind: "todo",
    level: 1,
    heading-level: 1,
    description: none,
  )
  let todos = query(selector(<todo-marker>).within(web-doc-label))

  _standalone-page(page, main-class: "todo-page")[
    #html.elem("h1", attrs: (class: "page-title"), [Todos]) <sec:todo>
    #if todos.len() == 0 {
      html.elem("p", attrs: (class: "todo-empty"), [No todos are currently marked.])
    } else {
      html.elem(
        "p",
        attrs: (class: "todo-summary"),
        [#todos.len() open #if todos.len() == 1 { [todo] } else { [todos] }.],
      )
      html.elem("ol", attrs: (class: "todo-list"), {
        for item in todos {
          html.elem("li", attrs: (class: "todo-list-item"), {
            link(item.location(), html.elem("em", attrs: (class: "proof-head"), [Todo.]))
            sym.space.nobreak
            html.elem("span", attrs: (class: "todo-list-description"), item.value.description)
          })
        }
      })
    }
  ]
}

#let _not-found-page() = {
  let page = (
    id: "not-found",
    title: "Page Not Found",
    route: "/page-not-found/",
    path: "page-not-found/index.html",
    doc-path: "/page-not-found/index.html",
    kind: "not-found",
    level: 1,
    heading-level: 1,
    description: none,
  )

  _standalone-page(page, main-class: "not-found")[
    #html.elem("h1", attrs: (class: "page-title"), [Page Not Found])
    #html.elem("p", attrs: (class: "not-found-copy"), [
      This page is not part of the current build.
    ])
    #html.elem("div", attrs: (class: "not-found-actions"))[
      #html.elem("a", attrs: (class: "button", href: _href-from(page.path, "index.html")), [Home])
      #html.elem(
        "button",
        attrs: (
          class: "button button-secondary",
          type: "button",
          onclick: "if (history.length > 1) history.back(); else location.href = 'index.html';",
        ),
        [Back],
      )
    ]
  ]
}

#let _redirect-404-page() = {
  let target = source.site-url + "/page-not-found/"

  document("/404.html", title: "Redirecting…")[
    #show: document-styles.with(mode: "web")
    #html.elem("meta", attrs: ("http-equiv": "refresh", content: "0; url=" + target))
    #html.elem("meta", attrs: (name: "robots", content: "noindex"))
    #html.elem("link", attrs: (rel: "canonical", href: target))
    #html.elem("main", attrs: (class: "content not-found", id: "main"))[
      #html.elem("h1", attrs: (class: "page-title"), [Redirecting…])
      #html.elem("p", attrs: (class: "not-found-copy"), [
        This page has moved to
        #html.elem("a", attrs: (href: target), [ the new not-found page ])
        .
      ])
    ]
  ]
}

#let _docs-page(
  title: none,
  route: none,
  kind: "section",
  level: 1,
  heading-format: (number, title) => if number != none { [#number #title] } else { [#title] },
  description: none,
  cover: false,
  heading: true,
  children: none,
  label: none,
  body,
) = {
  assert(type(heading-format) == function, message: "heading-format must be a function")
  _set-route-folders(level, route)
  context {
    let mode = render-mode.get()
    let route = _route-from-folders(route-prefix.get() + route-folders.get())
    let page = _page-info(
      title: title,
      route: route,
      kind: kind,
      level: level,
      heading-level: level,
      heading-format: heading-format,
      description: description,
      label: label,
    )

    if target() == "bundle" and mode == "web" {
      let page-body = if cover {
        _cover-content(page)
      } else if heading {
        [
          #html.elem("div", attrs: (class: "page-source-heading"), _page-heading(page))
          #body
        ]
      } else {
        body
      }
      _html-page(page, page-body)
    } else if cover {
      _pdf-cover()
    } else {
      if heading {
        _page-heading(page)
      }
      body
    }
  }
  if children != none {
    children
  }
}

#let _plain-heading-format(number, title) = if number != none { [#number #title] } else { [#title] }
#let _chapter-heading-format(number, title) = if number != none { [Chapter #number: #title] } else { [#title] }
#let _section-heading-format(number, title) = if number != none { [#sym.section#number #title] } else { [#title] }
#let _appendix-heading-format(number, title) = if number != none { [Appendix #number: #title] } else { [#title] }

#let docs-cover(..args) = _docs-page(
  kind: "cover",
  level: 0,
  cover: true,
  heading-format: _plain-heading-format,
  ..args,
)
#let docs-frontmatter(..args) = _docs-page(kind: "frontmatter", level: 1, heading-format: _plain-heading-format, ..args)
#let docs-chapter(..args) = _docs-page(kind: "chapter", level: 1, heading-format: _chapter-heading-format, ..args)
#let docs-subchapter(..args) = _docs-page(kind: "subchapter", level: 2, heading-format: _section-heading-format, ..args)
#let docs-subsubchapter(..args) = _docs-page(
  kind: "subsubchapter",
  level: 3,
  heading-format: _section-heading-format,
  ..args,
)
#let docs-appendix(..args) = _docs-page(kind: "appendix", level: 1, heading-format: _appendix-heading-format, ..args)
#let docs-backmatter(..args) = _docs-page(
  kind: "backmatter",
  level: 1,
  heading: false,
  heading-format: _plain-heading-format,
  ..args,
)

#let notes() = context {
  if target() == "bundle" {
    include "/src/assets/index.typ"
    _pdf-document(path: "pdf/notes.pdf")

    render-mode.update("web")
    context [
      #{
        include "/chapters/index.typ"
        _search-page()
        _todo-page()
        _not-found-page()
        _redirect-404-page()
      } #web-doc-label
    ]
  } else {
    _pdf-document()
  }
}
