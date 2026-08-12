# Map of knowledge.bambuser.com

The public, non-technical help center. ~170 articles. **Always discover exact URLs via the search API (`https://knowledge.bambuser.com/search?query=<keywords>`) or the llms.txt index (`https://bambuser.com/knowledgebase/llms.txt`)** — slugs below are entry points that were valid when written, not a guarantee.

## How it's organized

Four product hubs plus cross-product material. Article patterns URL patterns are usually as below:
- Shoppable Video: `/en_US/*shoppable-video*` 
- Video Consultation: `/en_US/video-consultation*` or `/en_US/one-to-one*`
- Chat: `/en_US/chat*`or `/en_US/introducing-chat*` or `/en_US/agent-tool*`

| Hub | Landing page | What's inside |
|-----|--------------|---------------|
| **Live** | `/en_US/live` | Getting started, launching your first show, streaming options (RTMP, pre-recorded video, external cameras), dashboard how-tos, video tutorials, FAQs, features, player integration pointers, troubleshooting (largest section) |
| **Shoppable Video** | `/en_US/shoppable-video` | Getting started, features, troubleshooting |
| **Video Consultation** | `/en_US/videoconsultation` *(note: no hyphen)* | Getting started, agent tool, dashboard, bookings, before/during/after a call, privacy settings, statistics, app usage, FAQs, troubleshooting |
| **Chat** | `/en_US/chat` | Introducing Chat, agent onboarding, inviting users, contacts, Bam Hub settings, troubleshooting |

Cross-product topics (in the llms.txt index, mostly under **Common**): settings & user management, generating API keys (`/settings/generating-api-keys` — referenced from the developer docs), dashboard sign-in, show creation & moderation, stats & broadcast reports, widgets (FAB), product imports, tracking, supported browsers, onboarding.

Special pages: glossary (`/en_US/845303-bambuser-glossary`), product updates (`/2308280-bambuser-product-updates`). One Swedish (`/sv_SE/…`) article exists; everything else is `/en_US/`.

## Fetching notes

- **Prefer the bundled [`scripts/search.py`](../scripts/search.py)** — it wraps the search API below and prints only title, category, URL, and snippet. The notes here document the raw mechanism, which is also the fallback when the script can't run.
- **Search API** (same one the site's search bar uses): `GET https://knowledge.bambuser.com/search?query=<url-encoded keywords>` returns a JSON array, no key needed. Per result, read `question.name` (title), `question.url` (relative link — strip the `?from_search=…` param and prefix `https://knowledge.bambuser.com`), `question.long_answer_sample` (snippet), `question.first_category` (section). Matching is per-token OR, so use 1–3 distinctive keywords; `[]` means no token matched.
- **llms.txt index**: `https://bambuser.com/knowledgebase/llms.txt` — all articles with one-line descriptions, grouped Live Shopping / Shoppable Video / Video Consultation / Chat / Common. It lives on **bambuser.com**; `knowledge.bambuser.com/llms.txt` 404s. Use it to browse a topic area; use search for a targeted question.
- Search-result and llms.txt URLs have no `/en_US/` prefix; the prefixed form also resolves.
- Server-rendered: a plain HTTP fetch of an article returns full readable text. No JS rendering needed, no API key, no observed rate limiting.
- **No `.md` variant of articles** (unlike the developer docs — appending `.md` silently returns the same HTML) — fetch the HTML and read the article body; skip the navigation boilerplate ("Welcome to Bambuser Knowledge Base…").
- Guessed URLs 404 — go through search or the llms.txt index.
- When a knowledge-base article and the developer docs (`bambuser.com/docs`) overlap, the developer docs are more current for anything technical; the knowledge base is more current for dashboard UI walkthroughs.
