from __future__ import annotations

import json
import re
from pathlib import Path

from bs4 import BeautifulSoup, Tag


BLOCK_SELECTORS = [
    "p",
    "li:not([role='doc-endnote'])",
    "h2",
    "h3",
    "h4",
    "h5",
    "h6",
    "figcaption",
    ".abstract",
    ".recommendation",
    ".display-math",
    ".theorem-list-entry",
    ".thm-head",
    ".proof-head",
]

NOISE_SELECTORS = [
    ".page-nav",
    "sup[role='doc-backlink']",
    ".typst-multi-label-list",
    ".eq-tag",
    ".equation-tag-group",
    ".equation-tag-holder",
    ".page-source-heading",
    "script",
    "style",
]

SKIP_PATHS = {
    "404.html",
    "search/index.html",
    "page-not-found/index.html",
}


def normalize_whitespace(value: str) -> str:
    return re.sub(r"\s+", " ", value).strip()


def normalize_text(value: str) -> str:
    return normalize_whitespace(value).casefold()


def clean_node_html(node: Tag) -> Tag | None:
    soup = BeautifulSoup(str(node), "html.parser")
    tag = soup.find()
    if tag is None:
      return None

    for selector in NOISE_SELECTORS:
        for match in tag.select(selector):
            match.decompose()

    return tag


def block_anchor(node: Tag, main: Tag) -> str:
    current: Tag | None = node
    while current is not None and current is not main:
        if current.get("id"):
            return str(current["id"])
        current = current.parent if isinstance(current.parent, Tag) else None

    previous = node.find_previous(lambda tag: isinstance(tag, Tag) and tag.get("id"))
    if isinstance(previous, Tag) and previous.get("id"):
        return str(previous["id"])

    return ""


def block_record(node: Tag, main: Tag) -> dict[str, str] | None:
    cleaned = clean_node_html(node)
    if cleaned is None:
        return None

    text = normalize_whitespace(cleaned.get_text(" ", strip=True))
    if not text:
        return None

    html = str(cleaned)
    kind = "heading" if cleaned.name and cleaned.name.startswith("h") else "text"
    return {
        "anchor": block_anchor(node, main),
        "kind": kind,
        "html": html,
        "text": text,
        "textNormalized": normalize_text(text),
    }


def dedupe_blocks(blocks: list[dict[str, str]]) -> list[dict[str, str]]:
    unique: list[dict[str, str]] = []
    seen: set[tuple[str, str, str]] = set()

    for block in blocks:
        key = (block["anchor"], block["kind"], block["textNormalized"])
        if key in seen:
            continue
        seen.add(key)
        unique.append(block)

    return unique


def collect_pages(dist_dir: Path) -> list[dict[str, object]]:
    pages: list[dict[str, object]] = []

    for path in sorted(dist_dir.rglob("*.html")):
        rel_path = path.relative_to(dist_dir).as_posix()
        if rel_path in SKIP_PATHS:
            continue

        soup = BeautifulSoup(path.read_text(encoding="utf-8"), "html.parser")
        main = soup.select_one("main.content")
        if main is None:
            continue

        for selector in NOISE_SELECTORS:
            for match in main.select(selector):
                match.decompose()

        title_node = main.select_one(".page-title")
        title = normalize_whitespace(title_node.get_text(" ", strip=True) if title_node else "")
        if not title:
            title_tag = soup.find("title")
            title = normalize_whitespace(title_tag.get_text(" ", strip=True) if title_tag else "Untitled")

        blocks = []
        for selector in BLOCK_SELECTORS:
            for node in main.select(selector):
                record = block_record(node, main)
                if record is not None:
                    blocks.append(record)

        blocks = dedupe_blocks(blocks)
        route = "" if rel_path == "index.html" else rel_path.removesuffix("index.html").rstrip("/")
        page_text = normalize_whitespace(main.get_text(" ", strip=True))

        pages.append(
            {
                "title": title,
                "titleNormalized": normalize_text(title),
                "path": rel_path,
                "route": route,
                "textNormalized": normalize_text(page_text),
                "blocks": blocks,
            }
        )

    return pages


def write_search_index(dist_dir: Path, pages: list[dict[str, object]]) -> None:
    payload = {"pages": pages}
    index_js = "window.SEARCH_INDEX = " + json.dumps(payload, ensure_ascii=False, separators=(",", ":")) + ";\n"
    asset_dir = dist_dir / "assets"
    asset_dir.mkdir(parents=True, exist_ok=True)
    (asset_dir / "search-index.js").write_text(index_js, encoding="utf-8")


def copy_search_assets(root_dir: Path, dist_dir: Path) -> None:
    asset_dir = dist_dir / "assets"
    asset_dir.mkdir(parents=True, exist_ok=True)
    for name in ("search.css", "search.js"):
        source = root_dir / "src" / "assets" / name
        (asset_dir / name).write_text(source.read_text(encoding="utf-8"), encoding="utf-8")


def main() -> None:
    root_dir = Path(__file__).resolve().parent
    dist_dir = root_dir / "dist"
    if not dist_dir.exists():
        raise SystemExit("dist directory not found; compile the Typst bundle first.")

    pages = collect_pages(dist_dir)
    copy_search_assets(root_dir, dist_dir)
    write_search_index(dist_dir, pages)
    print(f"indexed {len(pages)} pages into {dist_dir / 'assets' / 'search-index.js'}")


if __name__ == "__main__":
    main()
