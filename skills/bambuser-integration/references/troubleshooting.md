# Troubleshooting: how to diagnose, not a link index

Every product has a `troubleshooting/` section in the docs (Live ~16 articles, Shoppable Video ~11, Video Consultation ~9, Chat 3). **Don't memorize or guess article slugs** — once you've identified the symptom family below, fetch `https://bambuser.com/docs/llms.txt` and open the matching troubleshooting article for the product.

## Universal triage (run this first, in order)

1. **Region** — wrong-region embeds fail *silently* (player loads, content doesn't). Verify the embed host matches the workspace region before anything else ([`regions.md`](regions.md)). Explains most "show not found" / "player won't load" / "videos not appearing".
2. **Callback ordering** — `onBambuser…Ready` must be defined **before** the embed script loads; a cached script executes synchronously and a late callback never fires. Symptom: works on hard refresh, breaks on repeat visits (or vice versa).
3. **Script origin** — the embed must load from the official host, uncached and unmodified. Self-hosted/bundled copies break silently on update.
4. **Console + network** — check for CSP violations (common on Shopify — a CSP allowlist request doc exists), blocked third-party requests, 404s on IDs.
5. **IDs** — orgId, showId, video-ids, Application ID: right value, right region, right environment (a stage/test ID in production is a classic).
6. **Cookies/consent** — tracking and some features need first-party cookies; consent blockers cause *silent* attribution loss while playback works.

## Symptom families → likely cause

- **"Show not found" / player or videos don't appear** → region mismatch (1), then wrong/misspelled ID (5), then display rules (Chat) or distribution/playlist assignment (Shoppable Video).
- **Product tap opens the PDP in a new tab / minimizes the player** instead of the in-player cart → cart integration isn't fully registered; the product falls back to acting as a link.
- **One "combined variations" dropdown** instead of Color + Size → the 2-dimension variation model is mapped wrong ([`cart-and-product-data.md`](cart-and-product-data.md)).
- **Prices/images/stock wrong or "different from the dashboard"** → the auto-scraper and your hydration disagree; scraped placeholder data is showing. Check the product's `data-scraping` doc and hydration overrides.
- **Miniplayer breaks on navigation** → SPA routing, iframe context, or cross-origin navigation; each has a troubleshooting article. Ask how the site routes before debugging.
- **Stats/conversions missing while everything visibly works** → tracking, not playback: consent-blocked cookies, purchase event not firing on the confirmation page, legacy vs current tracker mixed up ([`tracking.md`](tracking.md)). For Chat: missing required Product View/Purchase events, or Product Feed issues.
- **FAB/widget button missing or misbehaving** → widget configuration and player-config articles under Live; for Chat, display rules.
- **REST API 403/429** → missing key scope / rate limit ([`rest-apis.md`](rest-apis.md)).

## Working a case

Reproduce → isolate (which of embed / cart / tracking / region layer?) → fetch the matching troubleshooting article via `llms.txt` → verify the fix with the product's verification page (tracking) or a hard-refresh + clean-profile test (embed). When writing to a customer, describe the cause and fix — not internal guesswork.
