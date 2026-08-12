# Bambuser Agent Skills

[Agent Skills](https://agentskills.io) that teach your AI agent [Bambuser](https://bambuser.com) video commerce — **Live Shopping, Shoppable Video, Video Consultation, Chat, and the App Framework** *(Beta)*.

| Skill | For | Covers |
|-------|-----|--------|
| **`bambuser-integration`** | Developers integrating Bambuser into a site or app | Embeds, cart/product data, tracking, regions, SSO, mobile SDKs, REST APIs, App Framework |
| **`bambuser-knowledge`** | Anyone *using* Bambuser — hosts, agents, marketers, PMs | Dashboard how-tos, broadcasting/RTMP, bookings, moderation, stats, capabilities & limits |

Both are deliberately **thin**: the durable concepts and gotchas live in the skill, and the latest specifics are **fetched at runtime** from [bambuser.com/docs](https://bambuser.com/docs) and [knowledge.bambuser.com](https://knowledge.bambuser.com), so answers stay current as the docs evolve. They work with Claude Code, Cursor, OpenAI Codex, Gemini CLI, GitHub Copilot, Amp, and other tools that support the Agent Skills standard.

## Install

```bash
npx skills add bambuser/agent-skills      # into the current project
npx skills add -g bambuser/agent-skills   # or globally, for all your projects
```

> **claude.ai users (one-time):** allow `bambuser.com` and `knowledge.bambuser.com` at [claude.ai/settings/capabilities](https://claude.ai/settings/capabilities), or the skills can't fetch the docs they rely on.

**Verify:** `npx skills list` shows both skills — then start a new session.

<details>
<summary><b>Alternative — manual copy</b></summary>

```bash
git clone https://github.com/bambuser/agent-skills
mkdir -p ~/.claude/skills ~/.agents/skills
cp -r agent-skills/skills/* ~/.claude/skills/   # Claude Code (reads only .claude/skills)
cp -r agent-skills/skills/* ~/.agents/skills/   # Cursor / Codex / Gemini / Copilot / Amp
```

For a per-project install, copy into `./.claude/skills` and `./.agents/skills` of your project instead.
</details>

<details>
<summary><b>Alternative — <code>install.sh</code>, every agent at once</b></summary>

Symlinks the Claude Code dir (so `git pull` refreshes it) and copies the neutral `.agents/skills` dir (Codex doesn't load a symlinked one):

```bash
git clone https://github.com/bambuser/agent-skills
agent-skills/install.sh --global                                # all your projects
cd /path/to/your/project && /path/to/agent-skills/install.sh    # or per-project
```
</details>

## Use

Add the routing rules in your project's instructions file (`CLAUDE.md`, `AGENTS.md`, Cursor rules, etc.):

```text
Two Bambuser skills are installed — route by intent, not keyword:
- Writing or changing code (embeds, cart/product data, tracking, REST APIs,
  SSO, mobile SDKs, App Framework) → the bambuser-integration skill.
- Using the product, no code (dashboard how-tos, shows, broadcasting/RTMP,
  bookings, stats meanings, "can Bambuser do X?") → the bambuser-knowledge skill.
- Mixed requests: diagnose with bambuser-knowledge, fix with bambuser-integration.
- Never answer Bambuser specifics from memory — fetch the live docs first.
```

Now you can just ask in natural language — the skills trigger on Bambuser topics. Examples:

| Example prompt | Routes to |
|---|---|
| "Create a Bambuser live shopping landing page and enable mini player." | integration |
| "Set up `<bam-playlist>` shoppable video in carousel mode with a soft limit of 5." | integration |
| "Implement product and cart integration for the Bambuser player." | integration |
| "Pull show stats from the Bambuser REST API into our BI tool." | integration |
| "In Bambuser, how do I stream with an external camera over RTMP?" | knowledge |
| "On Bambuser dashboard, how are unique viewers counted in the stats page?" | knowledge |
| "Can I download the video after a Bambuser live show?" | knowledge |

## What's inside

```
skills/
├── bambuser-integration/   # SKILL.md + references: products, regions, cart & product
│                           # data, tracking, REST APIs, SSO, mobile SDKs, App Framework,
│                           # troubleshooting, doc index
└── bambuser-knowledge/     # SKILL.md + scripts/search.py (knowledge-base search)
                            # + references: knowledge-base map, curated FAQs per product
```

## License

[Apache-2.0](LICENSE) © Bambuser
