# App Framework *(Beta)*

A platform for building **custom apps** that extend Bambuser surfaces — virtual try-on (VTO), custom screens, dialogs, and side-panel tools inside the player and the agent view. **Not an embed**: treat requests here as app development (build → test in sandbox → publish), not snippet pasting.

## Mental model

- An app = an **app manifest** + your hosted app code, run in a **sandbox**. Start from the sandbox template (`app-framework/getting-started.md`).
- Three UI surface types, each with its own API: **Screen** (full-area views), **Dialog** (modal panels), **Tool** (side-panel views in the player). Learn pages explain when to use which (`app-framework/learn/ui/{screens,dialogs,tools}.md`); build pages give the APIs (`app-framework/build/api/{screen,dialog,tool}.md`).
- **Calls/VTO API** (`app-framework/build/api/calls-vto.md`) powers try-on inside Video Consultation calls.
- A **design library** (`app-framework/build/design-library.md`) keeps apps visually consistent with the player.

## VTO: pick the pattern first

Three documented example patterns — choose based on the customer's VTO vendor before writing anything:

1. **Custom provider** (`build/examples/vto-custom-provider.md`) — integrate a vendor's engine as a provider.
2. **Session tool** (`build/examples/vto-session-tool.md`) — VTO as an in-call tool.
3. **Data via product hydration** (`build/examples/vto-data-via-ph.md`) — feed VTO data through the existing hydration path.

## Gotchas

- **Beta**: APIs and availability can change; always fetch the live pages rather than trusting remembered signatures, and flag beta status to customers.
- The publish page slug is literally **`app-framework/publish-you-app.md`** ("you", not "your") — the intuitive slug 404s.
- App access/publishing may require Bambuser to enable things on the workspace — confirm with the customer's contact before promising a self-service flow.

Full page list: `https://bambuser.com/docs/llms-app-framework.txt` (or `llms.txt`); overview at `app-framework/overview.md`, architecture at `app-framework/learn/app-architecture.md`, manifest at `app-framework/learn/app-manifest.md` (base `https://bambuser.com/docs/`).
