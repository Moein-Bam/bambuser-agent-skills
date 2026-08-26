# REST APIs & webhooks

Server-side automation across Bambuser: **six separate APIs** on one host, sharing one auth model, one rate limit, and one regional base URL.

## Backend only — never call from the front end

The REST API is authenticated with a **long-lived API key that grants org-wide access**. Putting it in browser JavaScript, a mobile app bundle, or any client-side config **leaks it to every visitor**. There is no CORS-friendly, public-scoped variant and no short-lived browser token.

- Call it from **your server, a serverless function, or a batch job** — proxy to the browser only the specific data the page needs.
- The rate limit is **per API key**, so client-side calls also fan out into 429s across your users.
- Rule of thumb: browser code uses the **embed/player APIs** (`player`, `oneToOneEmbed`, `hero`, tracking); server code uses REST.

## First: does this task need REST at all?

**Don't propose the REST API by default.** Most Bambuser work is done with the embed/client-side APIs or in the dashboard, and a REST answer there is wrong — it adds an API key, a server, and a rate limit to a problem that didn't have them.

Reach for REST only when **both** hold:

1. **There is a backend** — a server, serverless function, middleware, scheduled job, or BI pipeline the customer can actually deploy. A Shopify theme, SPA, mobile app, or static site is **not** a backend. If the user hasn't said they have one, **ask** before designing around it.
2. **The scenario requires it** — the thing genuinely can't be done from the player, the widget, or the dashboard.

Signals that it doesn't need REST: rendering a player, hydrating products for a live shopper, adding to cart, tracking a purchase, showing a FAB or channel widget, changing settings an admin can change in BamHub, reading data the `player` object already exposes. Answer those client-side.

If you do introduce REST, say **why** the client-side path doesn't cover it, and never present it as a simpler alternative to an embed API that already works.

## When to reach for it

Once those conditions hold, use REST for work that happens **outside a shopper's session**: syncing a product catalog, creating/scheduling shows or connect links from a CMS or PIM, pulling stats into a BI warehouse, exporting chat transcripts or call transcriptions, managing dashboard users, bulk-managing Shoppable Video videos/playlists, automating App Framework installs, honouring a GDPR request, or registering webhooks. Don't use it to fetch data a page could get from the player, and don't poll it for near-real-time state — subscribe to a **webhook** instead.

## The six APIs — and when to use each

All of them live on the same host and share the same auth, rate limit, and regional base URLs. Each has an HTML docs page (a tab in the portal) and a fetchable OpenAPI 3 spec at the same path plus **`/spec`**. Paths below are relative to `https://liveshopping-api.bambuser.com` (or the EU host).

| API (portal tab) | HTML docs | OpenAPI spec | Use it when you need to… |
|---|---|---|---|
| **Live** (`one-to-many`) | `/v1/docs/api/one-to-many` | `…/one-to-many/spec` | Create/schedule/update **shows** and their products, channels, tags, assets, broadcasts; read chat messages, pinned comments, highlights, chat transcripts; drive **shows-on-PDP** via highlighted-product lookups; pull **Live stats** (per show, all shows, activity, orders, traffic acquisition); manage dashboard users and webhooks. |
| **Video Consultation** (`one-to-one`) | `/v1/docs/api/one-to-one` | `…/one-to-one/spec` | Read **call** details, transcriptions, and accepted/missed **call stats**; create **connect links** to wire in your own booking system; receive **Appointedd / Booxi** booking callbacks; list virtual-try-on calls; manage agents (users) and their assets; manage webhooks. |
| **Shoppable Video** (`vod`) | `/v1/docs/api/vod` | `…/vod/spec` | **Bulk-manage on-demand videos** — list/query/count videos and view counts, update metadata, clip and preview; upload and track **media assets**; manage **captions** per language; build and maintain **video playlists** that `<bam-playlist>` renders. |
| **Product Catalog** (`product-catalog`) | `/v1/docs/api/product-catalog` | `…/product-catalog/spec` | Manage the org's **product catalog** used across products — list/search (`q`, `sort`, `feedId`), count, create, update (PATCH), delete products, either org-wide or scoped to a **feed**. Reach for it when a store has no live product-hydration endpoint or wants Bambuser to hold the catalog. |
| **Apps** (`apps`) | `/v1/docs/api/apps` | `…/apps/spec` | Automate the **App Framework**: create apps from a manifest and publish new **revisions**, list installations, install/update/uninstall apps in an org (`/app-installations`), configure which **custom elements** (Screens, Tools, Dialogs) a host uses, and issue **installation keys** so a specific org can install your private app. |
| **Shopper data** (`shopper-data`) | `/v1/docs/api/shopper-data` | `…/shopper-data/spec` | Retrieve or **erase shopper-submitted PII** captured in the experience (e.g. `competition-entry` records with name/email/phone, their `purposes` and `metadata`). Filter by `data.email` / `data.phone` or created-date range. This is the endpoint for **GDPR access/erasure requests** and for exporting competition entries into a CRM. |

Gotcha worth knowing before writing Product Catalog code: products created **inside a feed** (`POST /v1/product-catalog/feeds/{feedId}/products`) are **ephemeral** — the next feed sync makes the feed source the source of truth and drops anything not present in it. To add a product permanently, add it to the feed source, or create it org-wide (`POST /v1/product-catalog/products`, no feed association).

Choosing between them: **content and stats** → the product API (Live / VC / Shoppable Video); **the products shown inside that content** → Product Catalog; **extending the surfaces** → Apps; **personal data a shopper typed in** → Shopper data.

### Fetch the spec, not the portal

The portal is a **ReDoc app — a plain fetch returns an empty JS shell**. Always fetch the `/spec` URL for exact endpoints, parameters, scopes, and schemas. The specs are **large and may be gzip-encoded** (the Shoppable Video one is) — save to a file and query it (e.g. `jq '.paths | keys'`) rather than reading it whole. Every spec's `info.description` carries the current auth, rate-limit, and base-URL rules; each endpoint states its **required scope**. All of these paths exist on the EU host too.

## Base URL (region-specific)

| Region | Base URL | Dashboard |
|---|---|---|
| **Global** | `https://liveshopping-api.bambuser.com/v1` | `https://lcx.bambuser.com/` |
| **EU** | `https://liveshopping-api-eu.bambuser.com/v1` | `https://lcx-eu.bambuser.com/` |

Pick the one matching the workspace's dashboard URL — **ask if you don't know** (see [`regions.md`](regions.md)). An API key is only valid in its own region; the wrong host returns auth errors, not data.

Version is in the path (`/v1`). Additive changes (new params, new response fields) are **not** breaking — ignore response fields you don't know. Endpoints marked alpha/beta/unstable may break.

> Path quirk: the **Shoppable Video** and **Product Catalog** specs declare no `servers` and their paths already include the `/v1` prefix (`/v1/vod/videos`, `/v1/product-catalog/products`), so join those against the **host root**. Live, Video Consultation, Apps, and Shopper data use `/v1` as the server URL with paths relative to it. Either way the final URL is `…bambuser.com/v1/…` — just don't double the `/v1`.

## Auth

- Header: `Authorization: Token YOUR_API_KEY` — **`Token`, not `Bearer`**.
- Keys are created in **BamHub → Settings → Integrations → API Keys**, with **scopes chosen at creation** (e.g. `READ_SHOWS`, `WRITE_SHOWS`, `READ_CHANNELS`). A **403 with a valid key** almost always means a missing scope — regenerate the key with the right set.
- Store keys in server-side secrets (env vars / secret manager), rotate on exposure.
- **Shopper data is the exception**: its spec says to **contact Bambuser support** for a key rather than self-serving one in BamHub — expect an ask, not a dashboard click.

## Rate limiting

Default **5 requests per 10-second moving window** per key; over it the API returns **429**. Some endpoints document their own limit — check the spec. Design for it: prefer batch endpoints over per-item loops, cache stats pulls, back off on 429, and prefer webhooks to polling.

## Webhooks (outbound)

Webhooks are **part of the same API documentation pages** as the REST endpoints — browse the `Webhooks` tag on the product's portal (`…/docs/api/one-to-many#tag/Webhooks`, `…/docs/api/one-to-one#tag/Webhooks`) or read the webhook schemas and payload examples inside the fetched spec. There are **no webhooks for Shoppable Video (`vod`)**.

Prefer webhooks over polling — the 5 req / 10 s limit makes polling for show or call state a losing game.

### Registering a receiver in the dashboard (the usual route)

**Switch to the right product's dashboard first.** Webhook settings are per product, so for Video Consultation webhooks you must be in the **Video Consultation** dashboard, not Live. Then:

1. Log in to the Bambuser dashboard and **switch to the product** whose events you want (Live / Video Consultation).
2. **Settings → Integrations → Webhooks.**
3. **Add Webhook** → enter the destination HTTPS URL (your developers provide it).
4. Optionally add **custom headers** for authentication (e.g. `Authorization: <shared secret>`) — Bambuser sends from **no fixed IP**, so header-based auth is the way to secure the endpoint, not IP allowlisting.
5. **Choose the topics** to subscribe to, save, and make sure the webhook is **enabled**. You can then test the events from the dashboard.

Step-by-step guide with screenshots: `https://knowledge.bambuser.com/settings/guide-to-setting-up-webhooks-in-the-bambuser-dashboard`. The link to the technical webhook docs is also surfaced in the dashboard at Settings → Integrations → Webhooks.

### Registering via the API

`POST /webhooks` (scope **`WRITE_WEBHOOKS`**) with `name`, `url`, `topics[]`, and `headers{}` — all four are required:

```json
{ "name": "My webhook", "url": "https://example.com/webhook",
  "topics": ["show"], "headers": { "authorization": "my-api-key" } }
```

Topics (from the specs — verify against the live spec before coding):

- **Live (`one-to-many`)**: `show`, `product`, `user`, `product-highlight`, `broadcast` — each delivering add/update/remove style events (e.g. `update-show` carries `state` / `isLive`, the usual way to react to a show going live).
- **Video Consultation (`one-to-one`)**: `call-started`, `call-ended` (start/end time, products presented, chat record), `call-missed`, `call-summary`, `customer-waiting-for-call`, `customer-waiting-for-booked-call`, `appointment` (confirmation / cancellation / reschedule / reminder).

### Receiving and verifying

- Delivery is a **POST to your HTTPS URL, retried until it gets a 200** — and **duplicates are possible**, so handlers must be **idempotent** (dedupe on the event id).
- **Verify authenticity** by re-fetching the event from the source: `GET /webhooks/{eventId}` (scope **`READ_WEBHOOKS`**) returns the original event, confirming both contents and origin.
- Respond 200 fast and process asynchronously; a slow handler earns retries.
- Inbound booking webhooks are the mirror image: Video Consultation exposes `POST /bookings/appointeddWebhook` and `POST /bookings/booxiWebhook` for **Appointedd** and **Booxi** to call *into* Bambuser.

## Doc entry points

`live/access-analytics-data.md`, `live/create-custom-channel-layout.md`, `live/shows-on-pdp.md`, `video-consultation/access-bambuser-analytic-data.md`, `video-consultation/how-to-integrate-your-booking-system.md`, `video-consultation/call-summary-email-integration.md`, `video-consultation/commission-tracking.md` (base `https://bambuser.com/docs/`).
