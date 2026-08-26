---
name: bambuser-integration
description: >
  Expert assistant for integrating Bambuser video-commerce products into any website, app, or storefront. Use whenever a request mentions Bambuser, live shopping, shoppable video, video consultation, one-to-one calls, the chat / hero widget, the App Framework, embedding a Bambuser player, cart or product-data integration, shopper-events tracking, the server-side REST APIs and webhooks, or choosing a Bambuser data region (Global vs EU). Identifies which of the five products is in play, applies the concepts shared across them (the ready-callback pattern, the cart/product-data model, regions), and — crucially — fetches the latest specifics from the official docs at bambuser.com/docs (the llms.txt index + per-page .md) instead of relying on memorized detail. Use it not only to explain but to write and wire real embed, cart, and tracking code into a site or Shopify theme. Trigger keywords include onBambuserLiveShoppingReady, onBambuserOneToOneReady, bam-playlist, HeroWebPluginSettings, oneToOneEmbed, initBambuserLiveShopping.
license: Apache-2.0
metadata:
  organization: Bambuser
  version: "1.0.0"
---

# Bambuser

This skill helps you integrate Bambuser's video-commerce products. It carries the concepts that are **common across the products** and tells you **how to get current, specific detail** without guessing. Per-product depth lives in `references/`, and exact, volatile detail lives in the **official docs** — which this skill fetches at runtime.

## Operating principle: concepts here, detail from the live docs

This skill deliberately holds **durable knowledge** — what each product is, its key objects, the integration decisions a customer faces, and the non-obvious "relevances" that are hard to learn by skimming a page or two. It **defers volatile specifics to the official documentation**: exact attribute lists, event payload fields, config keys, endpoint schemas, CSS variables, and embed hosts change over time. Fetch them when a task needs them so your answer matches the latest docs rather than a frozen copy.

→ See **"Fetching the documentation"** below for the mechanism. Use it liberally — it is the point of this skill.

## Ask before you assume — gather brand-specific inputs first

Integrations depend on values **specific to the customer's workspace and store**. Never invent or hardcode them, and don't scaffold a placeholder you can't verify — **ask a short, specific question** (and say where to find the answer), then proceed. First try to recover the value from the customer's existing embed snippet, codebase, or live site; if it isn't there, ask. Typical unknowns:

- **Data region** — Global or EU? Find it from the dashboard/login URL: `lcx.bambuser.com` = Global, `lcx-eu.bambuser.com` = EU (details in [`references/regions.md`](references/regions.md)). It determines every host/path, so confirm it before emitting any URL.
- **Organization ID** (`orgId` / the `org-id` attribute) — needed by most embeds.
- **Content identifiers** — e.g. Live Shopping `showId`; Shoppable Video `video-ids` or the playlist/distribution setup; Chat **Application ID(s)** (region-specific). Confirm the exact config keys in the product's setup doc.
- **`currency` / `locale`** — whenever cart is involved.
- **Store cart/product APIs** — do client-side `getProduct` / `getCart` / `addToCart` / `updateCart` / `removeFromCart` (and `search` for Video Consultation) already exist in their code, or should you implement them? Ask before writing cart handlers (see [`references/cart-and-product-data.md`](references/cart-and-product-data.md)).

## The five products at a glance

| Product | What it does | Embed pattern | Key global object |
|---------|--------------|---------------|-------------------|
| **Live Shopping** (One-to-Many) | One-to-many live (and recorded) video shows with interactive shopping | `initBambuserLiveShopping()` + `onBambuserLiveShoppingReady` | `player` |
| **Shoppable Video** | On-demand short-form videos (<5 min) with product cards, embedded as a web component | `<bam-playlist>` web component | `player` (shared with Live) |
| **Video Consultation** (One-to-One) | One-to-one video calls between a shopper and an agent | `new BambuserOneToOneEmbed()` + `onBambuserOneToOneReady` | `oneToOneEmbed` |
| **Chat** (a.k.a. "Hero") | Text chat widget connecting shoppers to in-store experts | `window.HeroWebPluginSettings` + `hero()` command queue | `hero` |
| **App Framework** *(Beta)* | A platform to build custom apps/tools (e.g. virtual try-on) that extend the player and agent surfaces | Sandbox app + manifest (not a one-line embed) | n/a (Screen / Dialog / Tool / VTO APIs) |

Within the docs, **Mobile SDKs, REST APIs, and SSO are sub-topics of the products above**, not separate products (e.g. the mobile SDKs are documented under Live Shopping).

Full per-product concepts, when-to-use, and the non-obvious gotchas are in [`references/products.md`](references/products.md).

## Routing: which product is in play?

Identify the product first; if it's genuinely ambiguous, ask. Common signals:

- "live stream" / "broadcast" / "live show" / "show ID" → **Live Shopping**
- "video on the product page" / "short video" / "playlist" / `bam-playlist` → **Shoppable Video**
- "video call" / "one-to-one" / "consultation" / "booking" / "queue" / `oneToOneEmbed` → **Video Consultation**
- "chat widget" / "text chat" / `hero` / "in-store expert" → **Chat**
- "virtual try-on / VTO" / "build an app/tool" / "extend the player or agent" → **App Framework**
- "iOS / Android / React Native SDK" / "native app" / "WebView" → **Mobile SDKs** — see [`references/mobile-sdks.md`](references/mobile-sdks.md)
- "REST API" / "stats endpoint" / "webhook" / "API key" / "server-side" / "bulk import" → **REST APIs** (only when a backend is in play — see the REST section) — see [`references/rest-apis.md`](references/rest-apis.md)
- "purchase tracking" / "conversion" / "GTM" / "analytics" / "attribution" → **Tracking** — see [`references/tracking.md`](references/tracking.md)
- "SSO" / "SAML" / "Okta" / "Azure AD" / "dashboard login" → **SSO** — see [`references/sso.md`](references/sso.md)
- "doesn't work" / "not appearing" / "no data" / "worked before" → start from [`references/troubleshooting.md`](references/troubleshooting.md)

A single integration often spans several topics (e.g. embed Live + cart + tracking + a REST stats pull). Read the relevant section of `references/products.md` and fetch each topic's doc page rather than forcing one page to cover everything.

## Environments: Global vs EU (ask if unknown)

**Every workspace lives in exactly one region — Global or EU — and the products use different embed hosts/API paths per region.** Using the wrong region is a top cause of "player won't load" / "show not found" / "data not appearing" problems.

You usually **cannot guess** the region. Determine it from the customer's existing embed snippet, their workspace/login domain (`lcx.bambuser.com` = Global, `lcx-eu.bambuser.com` = EU), or onboarding info. If none is available, **ask which region the workspace is in** before emitting URLs.

Region is **not encoded uniformly** across products — this is a frequent footgun:

- **Live Shopping / Shoppable Video** — a **subdomain** swap (`lcx-embed.bambuser.com` → `lcx-embed-eu.bambuser.com`).
- **Video Consultation** — an **`/eu/` path** segment (`one-to-one.bambuser.com/embed.js` → `one-to-one.bambuser.com/eu/embed.js`).
- **Mobile SDKs** — a region **enum** whose non-EU value is literally `US` (not "Global"). The type name is platform-specific (Android `OrganizationServer.US`; iOS `BambuserVideoPlayer(server: .US)`) — fetch the platform's setup doc for the exact name.
- **Chat** and the **Channel widget** have **no documented EU host variant** (Chat selects environment via its Application ID).
- **REST APIs** — a **host** swap (`liveshopping-api.bambuser.com` → `liveshopping-api-eu.bambuser.com`); an API key only works in its own region.

Exact, current hosts per product/topic — and the data-residency reasoning — are in [`references/regions.md`](references/regions.md). When in doubt, confirm the host against the live doc page (next section).

## The ready-callback pattern

Most products expose their object through a global "ready" callback you must **define before the embed script loads** (a cached script can execute synchronously, so a late callback is missed):

| Product | Ready callback |
|---------|----------------|
| Live Shopping | `window.onBambuserLiveShoppingReady = (player) => { … }` |
| Shoppable Video | `window.onBambuserLiveShoppingReady = (player) => { … }` (same as Live) |
| Video Consultation | `window.onBambuserOneToOneReady = (BambuserOneToOneEmbed) => { … }` |
| Channel / FAB widgets | `window.onBambuserWidgetReady = (widget) => { … }` |
| Chat | No ready callback — uses the `hero()` command queue, safe to call immediately |

## Shared cart & product-data model

Live Shopping, Shoppable Video, and Video Consultation share **one mental model** for cart/product integration. (Chat does **not** — it tracks behavior via `hero("track", …)` and recommends from a Product Feed.)

The flow is always: **hydrate product data** so the player/widget shows correct names, prices, variants, and stock, then **handle cart actions** (add / update / remove / checkout) by calling the store's own cart endpoints and reporting success or failure back through a callback.

- **Event names differ by product** — Live/Shoppable Video use `player.EVENT.*` constants; Video Consultation uses string event names.
- **Dependency:** in Live/Shoppable Video, cart actions only work once product data is hydrated; in Video Consultation the cart handlers are independent of hydration.
- **Product hydration uses a shared factory/builder chain** supporting up to **2 variation dimensions** (typically Color + Size — flatten anything beyond that).
- **Callback convention is uniform:** `callback(true)` success · `callback(false)` generic failure · `callback({ success: false, reason: 'out-of-stock' })` · `callback({ success: false, reason: 'custom-error', message: '…' })`.
- **Alternative:** a dashboard **Product Feed** (CSV/XML) can supply product data instead of the hydration event, but you still implement the cart action handlers.

The full product object shape, the factory chain, callback formats, and a workflow for discovering a specific store's cart/product endpoints are in [`references/cart-and-product-data.md`](references/cart-and-product-data.md). The current, authoritative payload fields are in each product's cart doc — **fetch them when writing real code.**

## Tracking, in one breath

- **Live, Shoppable Video, Video Consultation** — Shopper Events Tracking via `window._bambuser.track(eventType, data)` (purchase, add-to-cart, product-view, wishlist, refund…). Requires first-party cookies; if cookies are blocked, tracking fails silently but playback is unaffected.
- **Chat** — a separate API, `hero("track", { type: "ecommerce:purchase", … })`. Product View and Purchase events are **required** for Chat to function.
- GTM templates exist for all of them. Legacy Conversion Tracker installs still exist in the wild — identify and migrate, don't mix. Depth (generations, attribution, the four ways to pull analytics out): [`references/tracking.md`](references/tracking.md); exact payloads in each product's tracking doc — fetch it.

## REST APIs — backend only

**Don't bring the REST API up unless the task actually calls for it.** The default answer to a Bambuser question is the **embed / client-side API** (`player`, `oneToOneEmbed`, `hero`, tracking, dashboard settings). Only propose REST when **both** are true: there is a **backend to run it from** (a server, serverless function, middleware, CI job — not a Shopify theme, SPA, or static site on its own), **and** the use case genuinely can't be done client-side or in the dashboard — bulk/scheduled sync, server-to-server automation, warehouse exports, GDPR erasure, webhook receivers. If the user hasn't indicated a backend, ask before designing around it rather than assuming one exists.

Never hand a REST call to browser, mobile-app, or theme code, and never offer it as a "simpler alternative" to a client-side API that already solves the problem.

Bambuser exposes **six server-side REST APIs** on one host for work that happens outside a shopper's session. Portal tabs (HTML docs) — append **`/spec`** to any of them for the fetchable OpenAPI 3 spec:

| API | Docs path | Use it for |
|---|---|---|
| **Live** | `/v1/docs/api/one-to-many` | shows, show products, channels, tags, broadcasts, chat/transcripts, highlights, Live stats, users |
| **Video Consultation** | `/v1/docs/api/one-to-one` | calls & transcriptions, call stats, connect links for booking systems, agents |
| **Shoppable Video** | `/v1/docs/api/vod` | bulk video management, media assets & uploads, captions, playlists |
| **Product Catalog** | `/v1/docs/api/product-catalog` | the org's product catalog: search/create/update/delete, org-wide or per feed |
| **Apps** | `/v1/docs/api/apps` | App Framework automation: apps & revisions, installs, custom elements, installation keys |
| **Shopper data** | `/v1/docs/api/shopper-data` | read/erase shopper-submitted PII (e.g. competition entries) — GDPR access & erasure |

Paths are relative to the regional base URL below. Rule of thumb: **content & stats** → the product API; **the products inside that content** → Product Catalog; **extending the surfaces** → Apps; **PII a shopper typed in** → Shopper data.

- **Never call it from front-end code.** Auth is a long-lived, org-wide **API key** (`Authorization: Token …` — not `Bearer`), created in BamHub → Settings → Integrations → API Keys with **scopes fixed at creation**. In the browser it leaks to every visitor. Client code uses the player/embed APIs; server code uses REST.
- **Rate-limited per key** — default **5 requests / 10-second moving window**, then 429. Batch, cache, and prefer webhooks over polling.
- **Base URL is region-specific:** Global `https://liveshopping-api.bambuser.com/v1` · EU `https://liveshopping-api-eu.bambuser.com/v1`. Match the workspace's dashboard (`lcx` vs `lcx-eu`); ask if unknown.
- **Fetch the OpenAPI 3 spec, not the portal** — the portal is a ReDoc JS shell that fetches empty. Specs can be large and gzip-encoded; save to a file and query it.

**Webhooks** are documented on those same API pages (the `Webhooks` tag) — none exist for Shoppable Video. Prefer them over polling. Receivers are registered **per product**: switch to that product's dashboard first (e.g. the Video Consultation dashboard for call events), then **Settings → Integrations → Webhooks** — or `POST /webhooks` with `name`/`url`/`topics`/`headers`. Delivery retries until 200 and **can duplicate**, so handlers must be idempotent; secure with custom headers (Bambuser sends from no fixed IP) and verify an event with `GET /webhooks/{eventId}`. Dashboard walkthrough: `https://knowledge.bambuser.com/settings/guide-to-setting-up-webhooks-in-the-bambuser-dashboard`.

Endpoint families, webhook topics, and spec-fetching tips: [`references/rest-apis.md`](references/rest-apis.md).

## Fetching the documentation (the mechanism this skill depends on)

The official docs at `https://bambuser.com/docs` are published LLM-first. **Prefer them over memory for any specific attribute, event field, config key, endpoint, host, or limit** — and treat them as the source of truth when this skill and a doc page disagree (the docs are newer).

| Need | Fetch |
|------|-------|
| Discover the exact page for a topic | `https://bambuser.com/docs/llms.txt` — site-wide index: every page as a `.md` link with a one-line description, grouped by product. |
| One page's full content | The page URL with **`.md`** appended, e.g. `https://bambuser.com/docs/live/cart-integration.md`. A 404 means a wrong slug → fall back to `llms.txt`; if the content doesn't match your topic, also fall back. |
| Everything for one product | `https://bambuser.com/docs/llms-<slug>.txt` — note Live Shopping's slug is **`live`**: `llms-live.txt`, `llms-shoppable-video.txt`, `llms-video-consultation.txt`, `llms-chat.txt`, `llms-app-framework.txt`. These are **very large and may exceed a single fetch window** — prefer targeted `.md` pages, and don't conclude a topic is absent from a truncated bundle read. |
| The entire documentation | `https://bambuser.com/docs/llms-full.txt` (very large — prefer `llms.txt` + targeted `.md`). |

**How to use it well:**

1. Map the request to a product (routing above) and a topic.
2. **Fetch `llms.txt`, find the entry whose description matches, and use its exact `.md` URL** — this is the robust path because doc slugs can change. A short, pre-validated list of common entry-point pages is in [`references/doc-index.md`](references/doc-index.md), but if a slug 404s, fall back to `llms.txt`.
3. Pull detail from the fetched Markdown — don't paraphrase from memory when exact values matter.
4. Cite the doc page you used.

> **claude.ai users:** allow the `bambuser.com` domain at `claude.ai/settings/capabilities`, or the `WebFetch` of the docs is blocked and this skill can't retrieve detail.

## Output conventions

- Always pair the **embed script** with the **initialization / event-handler** code.
- Define ready callbacks **before** loading embed scripts.
- Never self-host Bambuser scripts — load from the official CDN/host.
- Use the correct **region** (ask if unknown) and set `currency`/`locale` whenever cart is involved.
- Include error handling in cart callbacks; surface out-of-stock via the callback `reason`.
- Match the mode to the question: a **customer-facing answer** stays clear and free of internal detail; an **internal investigation** can include code references and implementation depth.
- **Default to client-side/embed APIs and dashboard settings.** Reach for the REST API only when there's a backend to call it from *and* the scenario requires it (see the REST section) — never in front-end code, and never as an unprompted suggestion.

## Reference files

- [`references/products.md`](references/products.md) — the five products in depth: what each is, when to use it, key objects/widgets, and the non-obvious gotchas.
- [`references/regions.md`](references/regions.md) — Global vs EU: how to determine the region, the per-product region-encoding conventions, and the exact hosts (verify against the live docs).
- [`references/cart-and-product-data.md`](references/cart-and-product-data.md) — the shared product object, the factory/builder chain, callback formats, the Product Feed alternative, and a workflow for discovering a specific store's cart/product endpoints.
- [`references/tracking.md`](references/tracking.md) — Shopper Events vs legacy Conversion Tracker, attribution mechanics, GTM, and the four ways to pull analytics out.
- [`references/rest-apis.md`](references/rest-apis.md) — REST APIs & webhooks for Live, Shoppable Video, and Video Consultation: why they're backend-only, the fetchable OpenAPI spec URLs (the human portal is a JS shell), regional base URLs, auth/scopes/rate limits, endpoint families, and webhook setup (dashboard + API), topics, and verification.
- [`references/sso.md`](references/sso.md) — dashboard SSO: SAML/OIDC options and the per-product slug asymmetry.
- [`references/mobile-sdks.md`](references/mobile-sdks.md) — native SDKs vs WebView, per-platform slug patterns, the `US`/`EU` region enum.
- [`references/app-framework.md`](references/app-framework.md) — the build-and-publish model, Screen/Dialog/Tool/VTO APIs, VTO patterns, beta caveats.
- [`references/troubleshooting.md`](references/troubleshooting.md) — the universal triage order and symptom→cause families; fetch exact articles via `llms.txt`.
- [`references/doc-index.md`](references/doc-index.md) — a short, validated map of common entry-point doc pages per product, plus the `llms-*.txt` bundle list. A convenience snapshot — `llms.txt` is always authoritative.
