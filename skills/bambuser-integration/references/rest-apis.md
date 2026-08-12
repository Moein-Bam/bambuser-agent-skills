# REST APIs & webhooks

Server-side automation for Live Shopping and Video Consultation. **Intended for server-side use** — don't put API keys in browser code.

## Where the real reference lives (non-obvious)

The API portal `https://liveshopping-api.bambuser.com/v1/docs/api` is a **ReDoc app — a plain fetch returns an empty JS shell**. The machine-readable sources an agent can actually fetch are the raw OpenAPI 3.0 specs:

- **Live**: `https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many/spec`
- **Video Consultation**: `https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one/spec`

Fetch the spec (not the portal) for exact endpoints, parameters, and payload schemas. Humans can browse the portal at `/v1/docs/api/one-to-many` and `/v1/docs/api/one-to-one`.

## Auth, base URL, limits

- Base URL: `https://liveshopping-api.bambuser.com/v1` (no documented EU variant — if data residency is a concern, verify with Bambuser).
- Header: `Authorization: Token YOURAPIKEY` — note **`Token`, not `Bearer`**.
- Keys are created in **BamHub → Settings → Integrations → API Keys**, with **scopes chosen at creation** (e.g. `READ_SHOWS`, `WRITE_SHOWS`, `READ_CHANNELS`…). Each endpoint's required scope is stated in the spec. "403 with a valid key" usually means a missing scope — regenerate with the right ones.
- Rate limit: default **5 requests / 10-second moving window**, then 429. Batch and cache accordingly.

## What each API covers (orientation, not a reference)

- **Live (`one-to-many`)**: shows CRUD + per-show chat messages, pinned comments, highlights, products (incl. batch), broadcasts, tags, channels, assets; products & highlighted-products lookups (drives shows-on-PDP); channels; stats (per show / all shows / activity / orders / traffic acquisition); dashboard users; webhook management.
- **Video Consultation (`one-to-one`)**: call details + transcriptions; call stats (accepted/missed); connect links (booking-system integration); inbound booking webhooks for **Appointedd** and **Booxi**; virtual try-on calls; users; webhook management.

## Webhooks (outbound)

Configured in **BamHub → Settings → Integrations → Webhooks** (or via `POST /webhooks`). Delivery: POST to your HTTPS URL, **retries until 200**, **duplicates possible** — make handlers idempotent.

- Live collections: `show`, `product`, `user`, `product-highlight` (add/update/remove), `broadcast` (add).
- VC collections: `call-ended` (start/end time, products presented, chat record), `call-started`, `call-missed`, `call-summary`, `customer-waiting-*`, `appointment` (confirmation/cancellation/rescheduled/reminder), `shopper` (pre/in/post-call, missed, blocked/unblocked).

Payload examples are inside the specs' webhook descriptions.

## Doc entry points

`live/access-analytics-data.md`, `live/create-custom-channel-layout.md`, `live/shows-on-pdp.md`, `video-consultation/access-bambuser-analytic-data.md`, `video-consultation/how-to-integrate-your-booking-system.md`, `video-consultation/call-summary-email-integration.md`, `video-consultation/commission-tracking.md` (base `https://bambuser.com/docs/`).
