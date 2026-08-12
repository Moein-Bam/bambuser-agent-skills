# Tracking & analytics integration

How purchases and shopper behavior get attributed to Bambuser experiences, and how customers pull analytics into their own systems.

## Two generations — always check which one the customer has

- **Shopper Events Tracking** (current) — `window._bambuser.track(eventType, data)` for purchase, add-to-cart, product-view, wishlist, refund…; used by Live, Shoppable Video, and Video Consultation. Per-product page: `{live,shoppable-video,video-consultation}/shopper-events-tracking.md`.
- **Conversion Tracker** (legacy) — `window._bambuser.collect(...)` with `_bamls_*` cookies. **Superseded**; a migration guide exists (`live/migrate-from-legacy-conversion-tracking.md`). If a customer's code calls `.collect(`, they're on legacy — recommend migrating, don't mix the two.
- **Chat is separate**: `hero("track", { type: "ecommerce:purchase", … })`. For Chat, Product View + Purchase events are **required for the product to function** (recommendations + attribution), not optional analytics.

## Durable mechanics

- **First-party cookies are required** for attribution. If consent tooling blocks them, tracking fails **silently** — playback works, purchases just never attribute. This is the first suspect for "no conversion data" (see [`troubleshooting.md`](troubleshooting.md)).
- **Attribution window**: purchases attribute to a session/call for a period after the interaction (e.g. up to 30 days for Video Consultation calls) — verify current windows in the product's tracking doc before quoting them.
- The purchase event should fire on the **order confirmation page** with order ID, products, value, currency — the classic integration bug is firing it before payment completes or without a stable order ID.
- **Verification pages exist per product** (e.g. `live/shopper-events-tracking-live-verification.md`) — use them to prove an install works instead of waiting for dashboard stats.
- **Custom tracking tags** (`custom-tracking-tags.md`, Live + VC) let customers segment stats (e.g. per agent or campaign).

## Getting data *out* (four ways, Live and VC alike)

1. **Player/widget events on the page** — Live: listen to the `bambuser-liveshop-tracking-point` window event; VC: widget events. Full event list: `live/player-metrics.md`, `video-consultation/tracking-events.md`.
2. **GTM `dataLayer`** — events are pushed automatically if `dataLayer` exists; GTM templates exist. VC also has GTM **install** pages (`video-consultation/install-one-to-one-with-gtm.md`, `one-to-one-gtm-ga4.md`); Chat: `chat/integrate-chat-with-gtm.md`.
3. **CSV export** — BamHub → Stats → Reports. Live sales data refreshes **hourly**. The VC analytics page documents every CSV column.
4. **REST API** — stats endpoints; see [`rest-apis.md`](rest-apis.md).

Entry pages: `live/access-analytics-data.md`, `video-consultation/access-bambuser-analytic-data.md`. Fetch the product's tracking doc for exact payloads before writing code.
