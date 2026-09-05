(function () {
  "use strict";

  var THEMES = ["light", "dark", "auto"];
  var themeButton = document.querySelector(".theme-toggle");
  var themeButtonIcon = themeButton ? themeButton.querySelector(".icon") : null;
  var assetIcon = document.querySelector(".icon");
  var storedTheme = localStorage.getItem("theme") || "auto";
  var printThemeOverrideActive = false;
  var THEME_ICON_FILES = {
    light: "sun.svg",
    dark: "moon.svg",
    auto: "theme.svg"
  };

  function resolvedTheme(mode) {
    if (mode === "auto") {
      return matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
    }
    return mode;
  }

  function applyTheme(mode) {
    storedTheme = mode;
    localStorage.setItem("theme", mode);
    document.documentElement.dataset.theme = printThemeOverrideActive ? "light" : resolvedTheme(mode);
    if (themeButton) {
      themeButton.title = "Theme: " + mode.charAt(0).toUpperCase() + mode.slice(1);
      themeButton.setAttribute("aria-label", themeButton.title);
    }
    if (themeButtonIcon) {
      var currentSrc = themeButtonIcon.getAttribute("src") || "";
      var iconPath = currentSrc.replace(/[^/]+$/, THEME_ICON_FILES[mode] || THEME_ICON_FILES.auto);
      themeButtonIcon.setAttribute("src", iconPath);
      themeButtonIcon.setAttribute("alt", mode.charAt(0).toUpperCase() + mode.slice(1) + " theme");
    }
  }

  if (themeButton) {
    themeButton.addEventListener("click", function () {
      var next = THEMES[(THEMES.indexOf(storedTheme) + 1) % THEMES.length];
      applyTheme(next);
    });
  }

  matchMedia("(prefers-color-scheme: dark)").addEventListener("change", function () {
    if (storedTheme === "auto") {
      document.documentElement.dataset.theme = printThemeOverrideActive ? "light" : resolvedTheme("auto");
    }
  });

  applyTheme(storedTheme);

  var left = document.querySelector(".sidebar-left");
  var right = document.querySelector(".sidebar-right");
  var backdrop = document.getElementById("sidebar-backdrop");
  var leftToggle = document.getElementById("sidebar-toggle-left");
  var rightToggle = document.getElementById("sidebar-toggle-right");

  function closeSidebars() {
    if (left) left.classList.remove("open");
    if (right) right.classList.remove("open");
    if (backdrop) backdrop.classList.remove("visible");
  }

  function toggleSidebar(sidebar) {
    var shouldOpen = sidebar && !sidebar.classList.contains("open");
    closeSidebars();
    if (shouldOpen) {
      sidebar.classList.add("open");
      if (backdrop) backdrop.classList.add("visible");
    }
  }

  if (leftToggle && left) leftToggle.addEventListener("click", function () { toggleSidebar(left); });
  if (rightToggle && right) rightToggle.addEventListener("click", function () { toggleSidebar(right); });
  if (backdrop) backdrop.addEventListener("click", closeSidebars);

  document.addEventListener("keydown", function (event) {
    if (event.key === "Escape") closeSidebars();
  });

  function isEditableTarget(target) {
    if (!target) return false;
    if (target.isContentEditable) return true;
    var tagName = target.tagName;
    return tagName === "INPUT" || tagName === "TEXTAREA" || tagName === "SELECT";
  }

  function focusSearchInput() {
    var input = document.querySelector('form[data-search-form="true"] .search-input');
    if (!input) return false;
    input.focus();
    if (typeof input.select === "function") {
      input.select();
    }
    return true;
  }

  document.addEventListener("keydown", function (event) {
    if (event.key.toLowerCase() !== "k" || !(event.metaKey || event.ctrlKey) || event.altKey) return;
    if (isEditableTarget(event.target)) return;
    if (focusSearchInput()) {
      event.preventDefault();
    }
  });

  function fillReferenceLeaders(root) {
    root = root || document;
    if (!root.querySelectorAll) return;
    var ruler = document.createElement("span");
    ruler.style.cssText = "position:absolute;visibility:hidden;font-family:var(--sans);white-space:nowrap;";
    ruler.textContent = "..........";
    document.body.appendChild(ruler);
    var dotWidth = Math.max(1, ruler.getBoundingClientRect().width / 10);
    ruler.remove();

    root.querySelectorAll(".reference-list-entry").forEach(function (entry) {
      var dots = entry.querySelector(".reference-list-dots");
      var marker = entry.querySelector(".reference-list-end");
      var page = entry.querySelector(".reference-list-page");
      if (!dots || !marker || !page) return;

      dots.textContent = "";
      var entryRect = entry.getBoundingClientRect();
      var markerRect = marker.getBoundingClientRect();
      var pageWidth = page.getBoundingClientRect().width;
      var remaining = entryRect.right - markerRect.right - pageWidth;
      var count = Math.floor(Math.max(0, remaining) / dotWidth);
      dots.textContent = count >= 2 ? ".".repeat(count) : "";
    });
  }

  function normalizeDisplayMath(root) {
    root = root || document;
    if (!root.querySelectorAll) return;
    root.querySelectorAll('math[display="block"]').forEach(function (math) {
      var wrapper = math.closest(".display-math");
      if (!wrapper && math.parentNode) {
        wrapper = document.createElement("div");
        wrapper.className = "display-math";
        math.parentNode.insertBefore(wrapper, math);
        wrapper.appendChild(math);
      }

      if (!wrapper) return;
      if (wrapper.dataset.displayMathProcessed === "true") {
        placeEquationTagGroups(wrapper);
        return;
      }

      var scroll = math.closest(".equation-scroll");
      if (!scroll || !wrapper.contains(scroll)) {
        scroll = document.createElement("div");
        scroll.className = "equation-scroll";
        math.parentNode.insertBefore(scroll, math);
        scroll.appendChild(math);
      }

      setupDisplayMathTags(wrapper, math);
      wrapper.dataset.displayMathProcessed = "true";
    });
  }

  function tagGroupTop(items) {
    return items.reduce(function (sum, item) {
      return sum + item.top;
    }, 0) / items.length;
  }

  function setMathSpaceWidth(space, width) {
    var value = Math.max(0, Math.ceil(width + 8)) + "px";
    space.setAttribute("width", value);
    space.style.width = value;
  }

  function placeEquationTagGroups(wrapper) {
    var layer = wrapper.querySelector(":scope > .equation-tag-layer");
    if (!layer) return;

    var wrapperRect = wrapper.getBoundingClientRect();
    layer.querySelectorAll(".equation-tag-group").forEach(function (group) {
      var anchors = Array.from(group.querySelectorAll(".equation-tag")).map(function (tag) {
        return tag._equationTagAnchor;
      }).filter(Boolean);
      if (anchors.length === 0) return;

      var top = anchors.reduce(function (sum, anchor) {
        var rect = anchor.getBoundingClientRect();
        return sum + rect.top - wrapperRect.top - (parseFloat(getComputedStyle(group).fontSize) || 0) / 2;
      }, 0) / anchors.length;

      group.style.top = top + "px";
      var width = group.getBoundingClientRect().width;
      anchors.forEach(function (anchor) {
        if (anchor.tagName && anchor.tagName.toLowerCase() === "mspace") {
          setMathSpaceWidth(anchor, width);
        }
      });
    });
  }

  function setupDisplayMathTags(wrapper, math) {
    if (wrapper.dataset.equationTagsReady === "true") {
      placeEquationTagGroups(wrapper);
      return;
    }

    var tags = Array.from(wrapper.querySelectorAll(".eq-tag,.equation-tag")).filter(function (tag) {
      return !tag.closest(".equation-tag-layer");
    });
    if (tags.length === 0) return;

    var mathmlNs = "http://www.w3.org/1998/Math/MathML";
    var wrapperRect = wrapper.getBoundingClientRect();
    var items = tags.map(function (tag) {
      var tagRect = tag.getBoundingClientRect();
      var isInsideMath = math.contains(tag);
      var anchor = tag;

      tag.classList.add("equation-tag");

      if (isInsideMath) {
        anchor = document.createElementNS(mathmlNs, "mspace");
        anchor.setAttribute("class", "equation-tag-space");
        anchor.setAttribute("width", "0px");
        tag.parentNode.insertBefore(anchor, tag);
      } else {
        anchor = document.createElement("span");
        anchor.className = "equation-tag-anchor";
        var parent = tag.parentNode;
        var holder = parent && parent !== wrapper && parent.children.length === 1 ? parent : tag;
        holder.parentNode.insertBefore(anchor, holder);
        if (holder !== tag) {
          holder.classList.add("equation-tag-holder");
        }
      }

      tag._equationTagAnchor = anchor;
      return {
        tag: tag,
        anchor: anchor,
        top: tagRect.top - wrapperRect.top + tagRect.height / 2 + wrapper.scrollTop
      };
    }).sort(function (a, b) {
      return a.top - b.top;
    });

    var groups = [];
    var lineThreshold = 3;
    items.forEach(function (item) {
      var last = groups[groups.length - 1];
      if (last && Math.abs(item.top - tagGroupTop(last)) <= lineThreshold) {
        last.push(item);
      } else {
        groups.push([item]);
      }
    });

    var layer = document.createElement("div");
    layer.className = "equation-tag-layer";
    wrapper.appendChild(layer);

    groups.forEach(function (groupItems) {
      var group = document.createElement("div");
      group.className = "equation-tag-group";
      groupItems.forEach(function (item) {
        group.appendChild(externalEquationTag(item.tag, item.anchor));
      });
      layer.appendChild(group);
    });

    wrapper.dataset.equationTagsReady = "true";
    placeEquationTagGroups(wrapper);
  }

  function externalEquationTag(tag, anchor) {
    if (tag.tagName && tag.tagName.toLowerCase() !== "a") {
      tag._equationTagAnchor = anchor;
      return tag;
    }

    var replacement = document.createElement("div");
    Array.from(tag.attributes).forEach(function (attr) {
      if (attr.name !== "href") {
        replacement.setAttribute(attr.name, attr.value);
      }
    });
    replacement.classList.add("equation-tag");
    replacement.innerHTML = tag.innerHTML;
    replacement._equationTagAnchor = anchor;
    tag.remove();
    return replacement;
  }

  function safeReadJson(key, fallback) {
    try {
      return JSON.parse(localStorage.getItem(key) || "null") || fallback;
    } catch (_error) {
      return fallback;
    }
  }

  function safeWriteJson(key, value) {
    try {
      localStorage.setItem(key, JSON.stringify(value));
    } catch (_error) {
      // Keep navigation usable even when storage is unavailable.
    }
  }

  function navItemDepth(item) {
    var value = item.style.getPropertyValue("--depth") || "0";
    var depth = Number(value.trim());
    return Number.isFinite(depth) ? depth : 0;
  }

  function navStorageKeyForLink(link) {
    var href = link.getAttribute("href") || "";
    try {
      var url = new URL(href, window.location.href);
      return url.pathname.replace(/\/index\.html$/, "/");
    } catch (_error) {
      return href || link.textContent.trim();
    }
  }

  function setupGlobalNavCollapse() {
    var nav = document.querySelector(".global-nav");
    if (!nav) return;

    var items = Array.from(nav.querySelectorAll(".nav-item"));
    if (items.length === 0) return;

    var storageKey = "globalNavCollapsed";
    var collapsed = new Set(safeReadJson(storageKey, []));
    var parentItems = [];

    items.forEach(function (item, index) {
      var next = items[index + 1];
      var depth = navItemDepth(item);
      if (!next || navItemDepth(next) <= depth) return;

      var link = item.querySelector("a[href]");
      if (!link) return;

      var key = navStorageKeyForLink(link);
      var button = document.createElement("button");
      button.type = "button";
      button.className = "nav-collapse-toggle";
      button.setAttribute("aria-label", "Toggle " + link.textContent.trim());
      button.dataset.navKey = key;
      item.classList.add("has-children");
      item.appendChild(button);
      parentItems.push(item);

      button.addEventListener("click", function () {
        if (collapsed.has(key)) {
          collapsed.delete(key);
        } else {
          collapsed.add(key);
        }
        safeWriteJson(storageKey, Array.from(collapsed));
        applyGlobalNavCollapse();
      });
    });

    var currentPathName = window.location.pathname.replace(/\/index\.html$/, "/");
    var currentItemIndex = items.findIndex(function (item) {
      var link = item.querySelector("a[href]");
      return link && navStorageKeyForLink(link) === currentPathName;
    });

    if (currentItemIndex >= 0) {
      var currentDepth = navItemDepth(items[currentItemIndex]);
      var ancestorDepth = currentDepth;
      var modified = false;
      for (var i = currentItemIndex - 1; i >= 0; i--) {
        var depth = navItemDepth(items[i]);
        if (depth < ancestorDepth) {
          var link = items[i].querySelector("a[href]");
          if (link) {
            var key = navStorageKeyForLink(link);
            if (collapsed.has(key)) {
              collapsed.delete(key);
              modified = true;
            }
          }
          ancestorDepth = depth;
        }
      }
      if (modified) {
        safeWriteJson(storageKey, Array.from(collapsed));
      }
    }

    function applyGlobalNavCollapse() {
      var collapsedDepths = [];
      items.forEach(function (item) {
        var depth = navItemDepth(item);
        collapsedDepths = collapsedDepths.filter(function (parentDepth) {
          return parentDepth < depth;
        });

        item.hidden = collapsedDepths.length > 0;

        var button = item.querySelector(":scope > .nav-collapse-toggle");
        if (button) {
          var key = button.dataset.navKey;
          var isCollapsed = collapsed.has(key);
          item.classList.toggle("is-collapsed", isCollapsed);
          button.setAttribute("aria-expanded", String(!isCollapsed));
          if (isCollapsed) {
            collapsedDepths.push(depth);
          }
        }
      });
    }

    if (parentItems.length > 0) {
      applyGlobalNavCollapse();
    }
  }

  function upgradeMathLinks(root) {
    root = root || document;
    if (!root.querySelectorAll) return;
    var mathmlNs = "http://www.w3.org/1998/Math/MathML";

    root.querySelectorAll("math a[href]").forEach(function (anchor) {
      var mtext = document.createElementNS(mathmlNs, "mtext");
      mtext.setAttribute("class", "math-link");
      mtext.setAttribute("role", "link");
      mtext.setAttribute("tabindex", "0");
      mtext.setAttribute("data-href", anchor.getAttribute("href") || "");
      if (anchor.hasAttribute("title")) {
        mtext.setAttribute("title", anchor.getAttribute("title"));
      }
      if (anchor.hasAttribute("aria-label")) {
        mtext.setAttribute("aria-label", anchor.getAttribute("aria-label"));
      }
      mtext.textContent = anchor.textContent;
      anchor.replaceWith(mtext);
    });
  }

  function moveFootnotesAbovePageNav() {
    var endnotes = document.querySelector('section[role="doc-endnotes"]');
    var main = document.querySelector(".content");
    if (!endnotes || !main) return;

    var pageNav = main.querySelector(".page-nav");
    // typst appends endnotes after the main content
    // move them so they render before the previous/next cards.
    if (pageNav) {
      main.insertBefore(endnotes, pageNav);
    } else {
      main.appendChild(endnotes);
    }
  }

  function setupLocalTocRowNavigation(root) {
    root = root || document;
    if (!root.querySelectorAll) return;
    root.querySelectorAll(".local-toc li").forEach(function (item) {
      if (item.dataset.rowNavProcessed === "true") return;
      var primary = item.querySelector("a[href]");
      if (!primary) return;

      item.addEventListener("click", function (event) {
        if (event.defaultPrevented || event.target.closest("a[href]")) return;
        if (event.button !== 0 || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return;

        window.location.href = primary.href;
      });
      item.dataset.rowNavProcessed = "true";
    });
  }

  function whenDomReady(callback) {
    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", callback, { once: true });
    } else {
      callback();
    }
  }

  function expandSolutionsForPrint() {
    document.querySelectorAll("details.thm-solution").forEach(function (details) {
      details.dataset.printWasOpen = details.open ? "true" : "false";
      details.open = true;
    });
  }

  function restoreSolutionsAfterPrint() {
    document.querySelectorAll("details.thm-solution").forEach(function (details) {
      var wasOpen = details.dataset.printWasOpen === "true";
      details.open = wasOpen;
      delete details.dataset.printWasOpen;
    });
  }

  function applyPrintThemeOverride() {
    printThemeOverrideActive = true;
    document.documentElement.dataset.theme = "light";
  }

  function clearPrintThemeOverride() {
    if (!printThemeOverrideActive) return;
    printThemeOverrideActive = false;
    document.documentElement.dataset.theme = resolvedTheme(storedTheme);
  }

  function tocDepthForHeading(heading) {
    var level = Number(heading.tagName.slice(1));
    return Math.max(0, level - 2);
  }

  function nearestHeadingDepth(node) {
    var depth = 1;
    var cursor = node.previousElementSibling;
    while (cursor) {
      if (/^H[2-6]$/.test(cursor.tagName)) {
        return tocDepthForHeading(cursor) + 1;
      }
      cursor = cursor.previousElementSibling;
    }
    return depth;
  }

  function setupReferenceTooltips() {
    var tooltip = document.createElement("div");
    tooltip.className = "ref-tooltip";
    tooltip.setAttribute("role", "tooltip");
    tooltip.hidden = true;
    document.body.appendChild(tooltip);

    var activeTrigger = null;
    var hideTimer = null;

    var activePreviews = new Map(); // url -> previewObject

    var previewResizeObserver = typeof ResizeObserver !== "undefined" ? new ResizeObserver(function (entries) {
      for (var i = 0; i < entries.length; i++) {
        var el = entries[i].target;
        var contentEl = el.querySelector(".ref-preview-content");
        if (!contentEl) continue;

        var style = getComputedStyle(el);
        var padTop = parseFloat(style.paddingTop) || 0;
        var padBottom = parseFloat(style.paddingBottom) || 0;
        var borderTop = parseFloat(style.borderTopWidth) || 0;
        var borderBottom = parseFloat(style.borderBottomWidth) || 0;

        var intrinsicHeight = contentEl.offsetHeight + padTop + padBottom + borderTop + borderBottom;

        // Add a small buffer to prevent an infinitesimal scrollbar in some browsers
        var adjustedHeight = intrinsicHeight + 2;
        el.style.maxHeight = "min(" + adjustedHeight + "px, calc(100vh - var(--topbar-height) - 1.7rem))";
      }
    }) : null;
    function clearHideTimer() {
      if (hideTimer) {
        clearTimeout(hideTimer);
        hideTimer = null;
      }
    }

    function scheduleHide() {
      clearHideTimer();
      hideTimer = setTimeout(function () {
        tooltip.hidden = true;
        activeTrigger = null;
      }, 300);
    }

    function linkLabel(link, index, links) {
      var href = link.getAttribute("href") || link.getAttribute("data-href") || "";
      if (links.length === 1) return "Open";
      if (index === 0 || /\.pdf(?:#|$)/i.test(href)) return "PDF";
      if (index === links.length - 1) return "HTML";
      return "Link " + (index + 1);
    }

    function placeTooltip(trigger) {
      var rect = trigger.getBoundingClientRect();
      var tipRect = tooltip.getBoundingClientRect();
      var gap = 8;
      var left = rect.left + rect.width / 2 - tipRect.width / 2;
      left = Math.max(8, Math.min(left, window.innerWidth - tipRect.width - 8));
      tooltip.style.left = left + "px";
      tooltip.style.top = Math.min(rect.bottom + gap, window.innerHeight - tipRect.height - 8) + "px";
    }

    function showTooltip(trigger, linksData) {
      clearHideTimer();
      activeTrigger = trigger;
      tooltip.textContent = "";

      linksData.forEach(function (data) {
        var item = document.createElement("a");
        item.href = data.href;
        item.textContent = data.label;
        tooltip.appendChild(item);
      });

      var previewHref = previewSourceUrl(linksData);
      if (previewHref) {
        var previewButton = document.createElement("button");
        previewButton.type = "button";
        previewButton.setAttribute("aria-label", "Preview reference");

        var previewIcon = document.createElement("img");
        previewIcon.className = "icon";
        previewIcon.src = assetIcon && assetIcon.getAttribute("src")
          ? assetIcon.getAttribute("src").replace(/[^/]+$/, "eye.svg")
          : "assets/eye.svg";
        previewIcon.alt = "";
        previewButton.appendChild(previewIcon);

        previewButton.addEventListener("click", function (event) {
          event.preventDefault();
          event.stopPropagation();
          showPreview(trigger, linksData);
        });

        tooltip.appendChild(previewButton);
      }

      tooltip.hidden = linksData.length === 0;
      if (!tooltip.hidden) {
        placeTooltip(trigger);
      }
    }

    function placePreview(trigger, previewObj) {
      if (previewObj.hasDragged()) {
        previewObj.element.style.left = previewObj.dragState.left + "px";
        previewObj.element.style.top = previewObj.dragState.top + "px";
        previewObj.element.style.right = "";
        return;
      }

      var triggerRect = trigger.getBoundingClientRect();
      var previewRect = previewObj.element.getBoundingClientRect();
      var gap = 12;
      var minTop = parseFloat(getComputedStyle(document.documentElement).getPropertyValue("--topbar-height")) + 12;
      var maxTop = window.innerHeight - previewRect.height - gap;
      var rightSpace = window.innerWidth - triggerRect.right - gap;
      var leftSpace = triggerRect.left - gap;
      var belowSpace = window.innerHeight - triggerRect.bottom - gap;
      var aboveSpace = triggerRect.top - minTop - gap;
      var preferVertical = window.innerWidth < 720 || Math.max(rightSpace, leftSpace) < previewRect.width;

      previewObj.element.style.left = "";
      previewObj.element.style.right = "";
      previewObj.element.style.top = "";

      if (preferVertical && (belowSpace >= previewRect.height || aboveSpace >= previewRect.height || belowSpace > 140 || aboveSpace > 140)) {
        var top;
        if (belowSpace >= previewRect.height || belowSpace >= aboveSpace) {
          top = Math.min(maxTop, triggerRect.bottom + gap);
        } else {
          top = Math.max(minTop, triggerRect.top - previewRect.height - gap);
        }
        var centeredLeft = triggerRect.left + triggerRect.width / 2 - previewRect.width / 2;
        previewObj.element.style.left = Math.max(gap, Math.min(window.innerWidth - previewRect.width - gap, centeredLeft)) + "px";
        previewObj.element.style.top = top + "px";
        return;
      }

      previewObj.element.style.top = Math.max(minTop, Math.min(triggerRect.top, maxTop)) + "px";
      if (rightSpace >= previewRect.width || rightSpace >= leftSpace) {
        previewObj.element.style.left = Math.max(gap, Math.min(window.innerWidth - previewRect.width - gap, triggerRect.right + gap)) + "px";
      } else {
        previewObj.element.style.left = Math.max(gap, triggerRect.left - previewRect.width - gap) + "px";
      }
    }

    function clampPreviewPosition(left, top, preview) {
      var rect = preview.getBoundingClientRect();
      var gap = 8;
      var minTop = parseFloat(getComputedStyle(document.documentElement).getPropertyValue("--topbar-height")) + gap;
      var maxLeft = Math.max(gap, window.innerWidth - rect.width - gap);
      var maxTop = Math.max(minTop, window.innerHeight - rect.height - gap);
      return {
        left: Math.max(gap, Math.min(left, maxLeft)),
        top: Math.max(minTop, Math.min(top, maxTop))
      };
    }

    function applyDraggedPreviewPosition(left, top, previewObj) {
      var clamped = clampPreviewPosition(left, top, previewObj.element);
      if (!previewObj.dragState) {
        previewObj.dragState = {};
      }
      previewObj.dragState.left = clamped.left;
      previewObj.dragState.top = clamped.top;
      previewObj.element.style.left = clamped.left + "px";
      previewObj.element.style.top = clamped.top + "px";
      previewObj.element.style.right = "";
    }

    function previewSourceUrl(linksData) {
      for (var i = linksData.length - 1; i >= 0; i -= 1) {
        if (!/\.pdf(?:#|$)/i.test(linksData[i].href || "")) {
          return linksData[i].href;
        }
      }
      return linksData.length > 0 ? linksData[0].href : "";
    }

    function resolvePreviewAnchor(target) {
      if (!target) return null;

      function previewBlockSelector() {
        return ".thm-box, .thm-proof, .display-math, figure, li, p, h1, h2, h3, h4, h5, h6";
      }

      function nextPreviewBlockWithin(start, boundary) {
        var next = start.nextElementSibling;
        while (next) {
          if (next.matches("span[id^='loc-']")) {
            next = next.nextElementSibling;
            continue;
          }
          if (next.matches(previewBlockSelector())) {
            return next;
          }
          if (boundary && next.closest && next.closest(".thm-box, .thm-proof") !== boundary) {
            return null;
          }
          next = next.nextElementSibling;
        }
        return null;
      }

      if (target.matches && target.matches("span[id^='loc-']")) {
        var immediateBoundary = target.parentElement && target.parentElement.closest
          ? target.parentElement.closest(".thm-box, .thm-proof")
          : null;
        var immediateLocalMatch = nextPreviewBlockWithin(target, immediateBoundary);
        if (immediateLocalMatch) return immediateLocalMatch;
        var immediateFallbackMatch = nextPreviewBlockWithin(target, null);
        if (immediateFallbackMatch) return immediateFallbackMatch;
      }

      var direct = target.closest && target.closest(previewBlockSelector());
      if (direct) return direct;

      var cursor = target;
      while (cursor) {
        if (cursor.matches && cursor.matches(previewBlockSelector())) {
          return cursor;
        }
        if (cursor.matches && cursor.matches("span[id^='loc-']")) {
          var localBoundary = cursor.parentElement && cursor.parentElement.closest
            ? cursor.parentElement.closest(".thm-box, .thm-proof")
            : null;
          var localMatch = nextPreviewBlockWithin(cursor, localBoundary);
          if (localMatch) {
            return localMatch;
          }
          var fallbackMatch = nextPreviewBlockWithin(cursor, null);
          if (fallbackMatch) return fallbackMatch;
        }
        cursor = cursor.parentElement;
      }

      return target;
    }

    function clonePreviewNodes(doc, target) {
      var nodes = [];
      var main = doc.querySelector(".content") || doc.body;
      var anchor = resolvePreviewAnchor(target);
      if (!anchor) return nodes;

      if (/^H[1-6]$/.test(anchor.tagName)) {
        nodes.push(anchor.cloneNode(true));
        var next = anchor.nextElementSibling;
        while (next && nodes.length < 4) {
          if (/^H[1-6]$/.test(next.tagName)) break;
          if (next.closest && next.closest(".page-nav")) break;
          nodes.push(next.cloneNode(true));
          next = next.nextElementSibling;
        }
        return nodes;
      }

      if (anchor === main) {
        return [target.cloneNode(true)];
      }

      return [anchor.cloneNode(true)];
    }

    function preparePreviewContent(root) {
      if (!root) return;
      upgradeMathLinks(root);
      fillReferenceLeaders(root);
      setupLocalTocRowNavigation(root);
      if (setupReferenceTooltips.bindInto) {
        setupReferenceTooltips.bindInto(root);
      }
      root.querySelectorAll(".typst-multi-label-list,.ref-tooltip,.ref-preview").forEach(function (node) {
        node.remove();
      });
    }

    function renderPreviewFromDocument(doc, url) {
      if (!url.hash) {
        return "";
      }

      var targetId = decodeURIComponent(url.hash.slice(1));
      var target = doc.getElementById(targetId);
      if (!target) {
        return "";
      }

      var wrapper = doc.createElement("div");
      var previewNodes = clonePreviewNodes(doc, target);
      previewNodes.forEach(function (node) {
        wrapper.appendChild(node);
      });
      if (previewNodes.length === 1 && previewNodes[0].tagName && previewNodes[0].tagName.toLowerCase() === "li") {
        var li = previewNodes[0];
        var paragraph = doc.createElement("p");
        paragraph.innerHTML = li.innerHTML;
        wrapper.textContent = "";
        wrapper.appendChild(paragraph);
      }
      preparePreviewContent(wrapper);
      return wrapper.innerHTML || "";
    }

    function previewMarkupForUrl(rawHref) {
      if (!rawHref) return Promise.resolve("");

      var url;
      try {
        url = new URL(rawHref, window.location.href);
      } catch (_error) {
        return Promise.resolve("");
      }

      if (/\.pdf(?:#|$)/i.test(url.href)) {
        return Promise.resolve("");
      }

      if (url.pathname === window.location.pathname) {
        return Promise.resolve(renderPreviewFromDocument(document, url));
      }

      return fetch(url.href).then(function (response) {
        if (!response.ok) throw new Error("preview load failed");
        return response.text();
      }).then(function (html) {
        var parsed = new DOMParser().parseFromString(html, "text/html");
        return renderPreviewFromDocument(parsed, url);
      }).catch(function () {
        return "";
      });
    }

    function createPreviewObj(urlHref) {
      var element = document.createElement("aside");
      element.className = "ref-preview";
      element.innerHTML = '<button class="ref-preview-close" type="button" aria-label="Close preview">×</button><div class="ref-preview-content"></div>';
      document.body.appendChild(element);
      if (previewResizeObserver) {
        previewResizeObserver.observe(element);
      }

      var previewClose = element.querySelector(".ref-preview-close");
      var previewContent = element.querySelector(".ref-preview-content");

      var obj = {
        urlHref: urlHref,
        element: element,
        content: previewContent,
        dragged: false,
        dragState: null,
        hasDragged: function () {
          return !!(this.dragged && this.dragState && typeof this.dragState.left === "number" && typeof this.dragState.top === "number");
        },
        destroy: function () {
          if (previewResizeObserver) {
            previewResizeObserver.unobserve(element);
          }
          element.remove();
          activePreviews.delete(urlHref);
        }
      };

      previewClose.addEventListener("click", function (event) {
        event.preventDefault();
        event.stopPropagation();
        obj.destroy();
      });

      element.addEventListener("pointerdown", function (event) {
        if (event.button !== 0) return;
        if (event.target !== element) return; // Only drag on the padding/edges

        var rect = element.getBoundingClientRect();

        // Prevent drag on the bottom-right resize handle
        var isResizeHandle = (event.clientX - rect.left >= rect.width - 24) && 
                             (event.clientY - rect.top >= rect.height - 24);
        if (isResizeHandle) return;

        obj.dragged = true;
        obj.dragState = {
          left: rect.left,
          top: rect.top,
          pointerId: event.pointerId,
          offsetX: event.clientX - rect.left,
          offsetY: event.clientY - rect.top
        };
        element.setPointerCapture(event.pointerId);
        element.classList.add("dragging");
        event.preventDefault();
      });

      element.addEventListener("pointermove", function (event) {
        if (!obj.dragState || obj.dragState.pointerId !== event.pointerId) return;
        applyDraggedPreviewPosition(
          event.clientX - obj.dragState.offsetX,
          event.clientY - obj.dragState.offsetY,
          obj
        );
      });

      function stopPreviewDrag(event) {
        if (!obj.dragState || obj.dragState.pointerId !== event.pointerId) return;
        if (element.hasPointerCapture && element.hasPointerCapture(event.pointerId)) {
          element.releasePointerCapture(event.pointerId);
        }
        obj.dragState.pointerId = null;
        delete obj.dragState.offsetX;
        delete obj.dragState.offsetY;
        element.classList.remove("dragging");
      }

      element.addEventListener("pointerup", stopPreviewDrag);
      element.addEventListener("pointercancel", stopPreviewDrag);

      return obj;
    }

    function showPreview(trigger, linksData) {
      var href = previewSourceUrl(linksData);
      if (!href) return;

      var url;
      try {
        url = new URL(href, window.location.href);
      } catch (_error) {
        return;
      }

      var normalizedUrl = url.href;

      if (activePreviews.has(normalizedUrl)) {
        // Toggle off if already open
        activePreviews.get(normalizedUrl).destroy();
        return;
      }

      previewMarkupForUrl(normalizedUrl).then(function (markup) {
        if (!markup) return;

        // Before creating, check if it was opened during the fetch
        if (activePreviews.has(normalizedUrl)) return;

        var previewObj = createPreviewObj(normalizedUrl);
        activePreviews.set(normalizedUrl, previewObj);

        previewObj.content.innerHTML = markup;
        previewObj.element.style.visibility = "hidden";
        enhanceContent(previewObj.content);
        placePreview(trigger, previewObj);
        previewObj.element.style.visibility = "";
      });
    }

    function hideTooltip() {
      clearHideTimer();
      tooltip.hidden = true;
      activeTrigger = null;
    }

    function hideAllPreviews() {
      activePreviews.forEach(function (obj) {
        obj.destroy();
      });
    }

    function bindReferenceTooltips(root) {
      if (!root || !root.querySelectorAll) return;
      root.querySelectorAll(".typst-multi-label-list").forEach(function (source) {
        if (source.dataset.refTooltipProcessed === "true") return;
        let trigger = source.previousElementSibling;
        while (trigger && !(trigger.matches("a[href]") || trigger.matches(".math-link"))) {
          trigger = trigger.previousElementSibling;
        }
        if (!trigger) return;

        var links = Array.from(source.querySelectorAll("a[href], .math-link"));
        var linksData = links.map(function (link, index) {
          return {
            href: link.getAttribute("href") || link.getAttribute("data-href"),
            label: linkLabel(link, index, links)
          };
        });

        source.dataset.refTooltipProcessed = "true";
        source.remove();

        trigger.classList.add("ref-with-tooltip");

        trigger.addEventListener("mouseenter", function () {
          showTooltip(trigger, linksData);
        });
        trigger.addEventListener("mouseleave", scheduleHide);
        trigger.addEventListener("focus", function () {
          showTooltip(trigger, linksData);
        });
        trigger.addEventListener("blur", scheduleHide);
      });
    }

    tooltip.addEventListener("mouseenter", clearHideTimer);
    tooltip.addEventListener("mouseleave", scheduleHide);
    tooltip.addEventListener("focusin", clearHideTimer);
    tooltip.addEventListener("focusout", scheduleHide);

    addEventListener("scroll", function () {
      if (!tooltip.hidden && activeTrigger) {
        placeTooltip(activeTrigger);
      }
    }, { passive: true });

    addEventListener("resize", function () {
      if (!tooltip.hidden && activeTrigger) {
        placeTooltip(activeTrigger);
      }
      activePreviews.forEach(function (obj) {
        if (obj.hasDragged()) {
          applyDraggedPreviewPosition(obj.dragState.left, obj.dragState.top, obj);
        }
      });
    });

    document.addEventListener("keydown", function (event) {
      if (event.key === "Escape") {
        hideTooltip();
        hideAllPreviews();
      }
    });

    addEventListener("beforeprint", hideTooltip);
    addEventListener("beforeprint", hideAllPreviews);
    bindReferenceTooltips(document);
    setupReferenceTooltips.bindInto = bindReferenceTooltips;
  }


  function enhanceContent(root) {
    if (!root) return;
    upgradeMathLinks(root);
    normalizeDisplayMath(root);
    fillReferenceLeaders(root);
    setupLocalTocRowNavigation(root);
    if (setupReferenceTooltips.bindInto) {
      setupReferenceTooltips.bindInto(root);
    }
  }

  function setupPrintButton() {
    var button = document.querySelector(".print-button");
    if (!button) return;

    button.addEventListener("click", function () {
      window.print();
    });
  }

  function setupMathLinkNavigation() {
    function openMathLink(link, event) {
      var href = link.getAttribute("data-href");
      if (!href) return;
      if (event.type === "click") {
        if (event.button !== 0 || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return;
        event.preventDefault();
        window.location.href = href;
      } else if (event.key === "Enter" || event.key === " ") {
        event.preventDefault();
        window.location.href = href;
      }
    }

    document.addEventListener("click", function (event) {
      var link = event.target.closest && event.target.closest(".math-link");
      if (link) {
        openMathLink(link, event);
      }
    });

    document.addEventListener("keydown", function (event) {
      var link = event.target.closest && event.target.closest(".math-link");
      if (link) {
        openMathLink(link, event);
      }
    });
  }

  function setupSidebarScroll() {
    var left = document.querySelector(".sidebar-left");
    if (!left) return;

    var savedScroll = sessionStorage.getItem("sidebarScroll");
    if (savedScroll !== null) {
      left.scrollTop = parseInt(savedScroll, 10);
    }

    window.addEventListener("beforeunload", function () {
      sessionStorage.setItem("sidebarScroll", left.scrollTop);
    });
  }

  normalizeDisplayMath(document);
  setupGlobalNavCollapse();
  setupLocalTocRowNavigation(document);
  whenDomReady(moveFootnotesAbovePageNav);
  upgradeMathLinks(document);
  setupReferenceTooltips();
  setupMathLinkNavigation();
  setupPrintButton();
  setupSidebarScroll();
  addEventListener("beforeprint", expandSolutionsForPrint);
  addEventListener("afterprint", restoreSolutionsAfterPrint);
  addEventListener("beforeprint", applyPrintThemeOverride);
  addEventListener("afterprint", clearPrintThemeOverride);
  fillReferenceLeaders(document);
  addEventListener("resize", function () {
    fillReferenceLeaders(document);
    document.querySelectorAll(".display-math").forEach(placeEquationTagGroups);
  });
  addEventListener("load", function () {
    fillReferenceLeaders(document);
    document.querySelectorAll(".display-math").forEach(placeEquationTagGroups);
  });
})();
