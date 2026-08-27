---
name: bambuser-knowledge
description: >
  Non-technical Bambuser product knowledge for customer-facing and how-to questions that don't involve writing code. Use whenever a request concerns using Bambuser rather than integrating it: the dashboard (BamHub), creating/hosting/moderating shows, broadcasting options (RTMP, external cameras, pre-recorded video, multistreaming), the Video Consultation agent tool, bookings and queues, chat moderation, understanding stats and reports (viewers, conversion, attribution), supported browsers and devices, product capabilities and limits, accessibility, data retention, subtitles/translations, or any "can Bambuser do X?" question. Answers from curated FAQ references and fetches fresh articles from the public knowledge base at knowledge.bambuser.com (via its search API). For embed/cart/API/code work, use the bambuser-integration skill instead — the two are companions.
license: Apache-2.0
metadata:
  organization: Bambuser
  version: "1.0.0"
---

# Bambuser Knowledge

The non-technical companion to `bambuser-integration`. This skill answers **product, dashboard, and how-to questions** — the kind a marketer, host, agent, or project lead asks — without assuming a developer is in the room.

**Routing between the two skills:** if the request is about embedding, cart/product-data code, tracking code, REST APIs, SSO configuration, mobile SDKs, or the App Framework → use `bambuser-integration`. If it's about *using* the products — shows, broadcasts, the dashboard, the agent tool, stats, capabilities, policies — it belongs here. Many conversations cross over; use both.

## Sources

**Authoritative — fetch live:**

1. **The public knowledge base** — `https://knowledge.bambuser.com` — step-by-step dashboard/agent how-tos, tutorials, and troubleshooting written for non-developers. The source of truth for UI walkthroughs, which change as the dashboard evolves (mechanism below).
2. **The developer docs** — `https://bambuser.com/docs/llms.txt` — when a question turns out to have a technical edge (exact limits, event names, config). Fetch the specific `.md` page rather than answering from memory.

**A starting point, not an authority:**

3. **The FAQ references in this skill** (`references/faqs-*.md`) — curated answers to ~370 real customer questions, organized by product and topic, exported from Bambuser's internal FAQ database. Use them to orient fast and to recognize a question you've seen before; cross-product questions (accessibility, data retention, cookies, general capabilities) are in `faqs-cross-product.md`.

The FAQ files are **dated snapshots**. Where an FAQ answer and a live source disagree, **the live source wins** — and an FAQ answer about limits, tracking, regions, retention, or pricing is worth one live check before you repeat it.

**Known-stale area — purchase tracking.** **Shopper Events Tracking is current.** Some FAQ answers still present the legacy "Conversion Tracking script" / `window._bambuser.collect` as *the* way to track purchases; that is out of date. The legacy conversion tracker is one event (`purchase`) of Shopper Events, it still works, and legacy installs should migrate. See `live/shopper-events-tracking.md` and `live/migrate-from-legacy-conversion-tracking.md`.

## Searching the knowledge base

The knowledge base is a Helpjuice site. It is **server-rendered** (a plain fetch returns the full article text), has an **`llms.txt` index**, and exposes the **same search API the site's search bar uses** — a plain GET returning JSON, no key needed.

**Preferred — the bundled script.** [`scripts/search.py`](scripts/search.py) (python3, stdlib only) queries that API and prints only what an answer needs — title, category, URL, ~350-char snippet — stripping the rest of the payload:

```bash
scripts/search.py login issue        # top 5 matches
scripts/search.py -n 10 RTMP         # top 10
```

The snippet is often enough to answer outright; when it isn't, fetch the printed URL for the full article.

**Fallback — query the endpoint yourself** if the script can't run (no shell/python3 — e.g. on claude.ai, use web fetch) or exits non-zero: fetch `https://knowledge.bambuser.com/search?query=<url-encoded keywords>`. It returns a JSON array; each element is `{"question": {…}}` and the only fields that matter are `name` (title), `url` (relative article link — drop its `?from_search=…` suffix and prefix `https://knowledge.bambuser.com`), `long_answer_sample` (snippet), and `first_category` (section). Ignore everything else — the bulk of the payload (`indexable_body`, `body_txt`, avatars…) is noise.

| Other needs | Fetch |
|------|-------|
| Browse / enumerate articles | `https://bambuser.com/knowledgebase/llms.txt` — all articles with one-line descriptions, grouped by product (Live Shopping, Shoppable Video, Video Consultation, Chat, Common). Note it lives on **bambuser.com**, not the knowledge domain |
| Read one article | The URL from a search result or the llms.txt index |

**Rules that matter:**

- **Never guess an article URL** — slugs are not predictable and a wrong guess 404s. Discover via search (or the llms.txt index), then fetch the exact URL.
- Search matching is per-token OR: long natural-language queries pad the list with weak matches. Query with 1–3 distinctive keywords (`RTMP`, `login issue`, `multistream`) and judge relevance from `name` + snippet, not result count. A query where no token matches returns `[]` — retry with a synonym.
- When the snippet isn't enough, fetch the full article; pages include site navigation boilerplate — extract the article body, ignore the chrome. **Unlike the developer docs, articles have no `.md` variant** — appending `.md` silently returns the same HTML.
- Search-result and llms.txt URLs use the prefix-less form `…/<category-slug>/<article-slug>`; the `/en_US/`-prefixed form also resolves. Category landing pages are `…/en_US/<category-slug>` (e.g. `/en_US/live`); a few top-level pages use a numeric-ID slug (e.g. `/en_US/845303-bambuser-glossary`).
- A structural map of the knowledge base (what lives where) is in [`references/knowledge-base.md`](references/knowledge-base.md).

## Answering conventions

- Write answers a non-developer can act on: name the dashboard menu path (e.g. *BamHub → Stats → Reports*) rather than an API.
- For capability/limit questions ("how many viewers", "can I download the video"), give the FAQ answer but verify numbers against a live source when it's load-bearing.
- Customer-facing tone: clear, concise, no internal jargon, no code unless asked. If the honest answer is "this needs a developer", say so and point at what the developer would use (the `bambuser-integration` skill / the developer docs).
- Cite the knowledge-base article or doc page you used.

> **claude.ai users:** allow `bambuser.com` and `knowledge.bambuser.com` at `claude.ai/settings/capabilities`, or live fetches are blocked.

## Reference files

- [`references/knowledge-base.md`](references/knowledge-base.md) — map of knowledge.bambuser.com: categories, URL patterns, what each section covers.
- [`references/faqs-live.md`](references/faqs-live.md) — Live Shopping Q&A (stats definitions, broadcasting, dashboard, player behavior…).
- [`references/faqs-video-consultation.md`](references/faqs-video-consultation.md) — Video Consultation Q&A (agent tool, bookings, queues, call stats…).
- [`references/faqs-shoppable-video.md`](references/faqs-shoppable-video.md) — Shoppable Video Q&A.
- [`references/faqs-chat.md`](references/faqs-chat.md) — Chat Q&A.
- [`references/faqs-cross-product.md`](references/faqs-cross-product.md) — questions spanning products (accessibility, cookies, data retention, capabilities).
