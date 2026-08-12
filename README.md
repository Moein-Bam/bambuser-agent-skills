# Bambuser Agent Skills

[Agent Skills](https://agentskills.io) that teach your AI agent how to work with [Bambuser](https://bambuser.com) video-commerce products — **Live Shopping, Shoppable Video, Video Consultation, Chat, and the App Framework *(Beta)***.

Two complementary skills:

| Skill | For | Typical questions |
|-------|-----|-------------------|
| **`bambuser-integration`** | Developers integrating Bambuser into a website, app, or storefront | Embeds, cart/product data, tracking code, regions, SSO, mobile SDKs, REST APIs, App Framework |
| **`bambuser-knowledge`** | Anyone *using* Bambuser — hosts, agents, marketers, PMs | Dashboard how-tos, broadcasting/RTMP, bookings, moderating, stats, capabilities & limits |

They work with **Claude Code, Cursor, OpenAI Codex, Gemini CLI, GitHub Copilot, Amp**, and other tools that support the open Agent Skills standard, plus a Markdown fallback for rules-based tools.

## Why these skills

Bambuser's docs change. Rather than freezing a copy that goes stale, the skills are deliberately **thin and durable**: they carry the concepts shared across products (the ready-callback pattern, the cart/product-data model, Global vs EU regions) and the non-obvious gotchas — then **fetch the latest specifics at runtime** from [bambuser.com/docs](https://bambuser.com/docs) (the `llms.txt` index + per-page `.md`) and [knowledge.bambuser.com](https://knowledge.bambuser.com) (via its search API and `llms.txt` index). Answers stay current as the docs evolve.

## Install

> **One-time, for claude.ai users:** allow the `bambuser.com` and `knowledge.bambuser.com` domains at [claude.ai/settings/capabilities](https://claude.ai/settings/capabilities), or the skills can't fetch the docs they rely on. (Claude Code, Cursor, Codex, etc. allow web fetches by default, though enterprise network policies may still block them.)

### Recommended — the cross-agent installer

The [`skills` CLI](https://agentskills.io) installs into whichever agent you use:

```bash
# Into the current project (committed, shared with your team):
npx skills add bambuser/agent-skills

# Or globally, for all your projects:
npx skills add -g bambuser/agent-skills
```

### Script — install into every agent at once

`install.sh` installs both skills into the right per-agent directories: it **symlinks** the Claude Code dir (so `git pull` refreshes it) and **copies** the neutral `.agents/skills` dir (Codex doesn't load a symlinked one).

```bash
git clone https://github.com/bambuser/agent-skills

# Global — simplest; works across all your projects:
agent-skills/install.sh --global

# Per-project — installs into ./.claude/skills and ./.agents/skills of the CURRENT directory,
# so run it from your project root:
cd /path/to/your/project && /path/to/agent-skills/install.sh
```

### Manual — copy the skill folders

No CLI needed. Clone, then copy the folders under `skills/` into your agent's skills directory. **Global** (all your projects):

```bash
git clone https://github.com/bambuser/agent-skills
mkdir -p ~/.claude/skills ~/.agents/skills
cp -r agent-skills/skills/* ~/.claude/skills/   # Claude Code (reads ONLY .claude/skills)
cp -r agent-skills/skills/* ~/.agents/skills/   # Cursor / Codex / Gemini / Copilot / Amp
```

**Per-project** — run from *your own project's root* (not from inside the clone):

```bash
mkdir -p .claude/skills .agents/skills
cp -r /path/to/agent-skills/skills/* .claude/skills/   # Claude Code
cp -r /path/to/agent-skills/skills/* .agents/skills/   # everyone else
```

**Verify:** `npx skills list`, or `ls .claude/skills/bambuser-integration/SKILL.md .claude/skills/bambuser-knowledge/SKILL.md` — then restart your agent / start a new session. If you previously installed an earlier Bambuser skill under a different name (e.g. `bambuser-core`), remove it so the triggers don't collide.

### Rules-based tools (Windsurf, Cline, Continue)

These don't support skills, but they read Markdown context. Copy this repo's [`AGENTS.md`](AGENTS.md) to your project root — it names the products and regions and points the agent at the skills and the live docs. Windsurf reads root `AGENTS.md` directly; for **Cline** (`.clinerules/`) and **Continue** (`.continue/rules/`) drop it in that tool's rules folder.

## Use them

Just ask your agent in natural language — the skills trigger on Bambuser topics:

```text
"Embed a Bambuser live shopping show on our PDP and wire up add-to-cart."      → integration
"Set up the <bam-playlist> shoppable video component with our product feed."   → integration
"Which Bambuser embed host do we use for an EU workspace?"                     → integration
"Pull show stats from the Bambuser REST API into our BI tool."                 → integration
"How do I stream with an external camera over RTMP?"                          → knowledge
"How are unique viewers counted in the stats page?"                           → knowledge
"Can shoppers download the video after a live show?"                          → knowledge
```

The integration skill identifies the product, applies the shared concepts, and fetches the exact, current detail from the docs before writing code. The knowledge skill answers from curated FAQs and fetches fresh knowledge-base articles.

## What's inside

```
skills/
├── bambuser-integration/
│   ├── SKILL.md                        # durable concepts + the doc-fetching mechanism
│   └── references/
│       ├── products.md                 # the five products in depth + gotchas
│       ├── regions.md                  # Global vs EU (per-product encoding + hosts)
│       ├── cart-and-product-data.md    # shared product object, factory chain, callbacks
│       ├── tracking.md                 # Shopper Events vs legacy, GTM, analytics export
│       ├── rest-apis.md                # REST APIs & webhooks (incl. fetchable OpenAPI specs)
│       ├── sso.md                      # dashboard SSO (SAML/OIDC) + slug asymmetries
│       ├── mobile-sdks.md              # native SDKs vs WebView, region enum
│       ├── app-framework.md            # build-and-publish model, Screen/Dialog/Tool/VTO
│       ├── troubleshooting.md          # triage order + symptom→cause families
│       └── doc-index.md                # validated entry-point pages + llms-*.txt bundles
└── bambuser-knowledge/
    ├── SKILL.md                        # non-technical routing + knowledge-base fetching
    ├── scripts/
    │   └── search.py                   # knowledge-base search (title + URL + snippet only)
    └── references/
        ├── knowledge-base.md           # map of knowledge.bambuser.com
        └── faqs-*.md                   # curated Q&A per product + cross-product
```

## License

[Apache-2.0](LICENSE) © Bambuser
