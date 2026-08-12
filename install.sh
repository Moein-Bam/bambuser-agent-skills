#!/usr/bin/env bash
#
# Install the Bambuser agent skills into the skills directories on this machine.
#
# Usage:
#   ./install.sh              Install into THIS project (./.claude/skills, ./.agents/skills)
#   ./install.sh --global     Install for ALL projects (~/.claude/skills, ~/.agents/skills)
#   ./install.sh --copy       Copy into every target (most compatible)
#   ./install.sh --link       Symlink every target (advanced; NOT loaded by Codex)
#   ./install.sh --help
#
# Default ("auto"): symlink the Claude Code dir (.claude/skills) so `git pull` refreshes it,
# and COPY the neutral dir (.agents/skills) because some tools (notably Codex) do not load a
# symlinked .agents/skills. Re-run this script after `git pull` to refresh copied targets.
# Tip: the cross-agent CLI `npx skills add bambuser/agent-skills` is an alternative to this script.

set -euo pipefail

SKILLS=(bambuser-integration bambuser-knowledge)
# Absolute path to skills/ next to this script, regardless of where it's called from.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="${SCRIPT_DIR}/skills"

SCOPE="project"
MODE="auto"   # auto | copy | link

for arg in "$@"; do
  case "$arg" in
    -g|--global) SCOPE="global" ;;
    --copy)      MODE="copy" ;;
    --link)      MODE="link" ;;
    -h|--help)
      sed -n '3,15p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *) echo "Unknown option: $arg (try --help)" >&2; exit 1 ;;
  esac
done

for skill in "${SKILLS[@]}"; do
  if [ ! -f "${SKILLS_DIR}/${skill}/SKILL.md" ]; then
    echo "Error: ${SKILLS_DIR}/${skill}/SKILL.md not found. Run this from inside the cloned repo." >&2
    exit 1
  fi
done

if [ "$SCOPE" = "global" ]; then
  CLAUDE_BASE="$HOME/.claude/skills"
  AGENTS_BASE="$HOME/.agents/skills"
else
  CLAUDE_BASE="$PWD/.claude/skills"
  AGENTS_BASE="$PWD/.agents/skills"
fi

echo "Installing skills: ${SKILLS[*]} (${SCOPE}, mode=${MODE}) from: ${SKILLS_DIR}"
if [ "$SCOPE" = "project" ]; then
  echo "  Target project root: ${PWD}  (run this from YOUR project, not the cloned repo)"
fi

install_one() {  # $1 = base dir, $2 = how (link|copy), $3 = skill name
  local base="$1" how="$2" skill="$3"
  local source="${SKILLS_DIR}/${skill}"
  local target="${base}/${skill}"
  mkdir -p "$base"
  # Idempotent: clear any prior install (symlink, dir, or file) before re-installing.
  if [ -e "$target" ] || [ -L "$target" ]; then
    rm -rf "$target"
  fi
  if [ "$how" = "link" ] && ln -s "$source" "$target" 2>/dev/null; then
    echo "  ✓ linked  ${target}"
  else
    cp -R "$source" "$target"
    [ "$how" = "link" ] && echo "  ✓ copied  ${target}  (symlink unsupported here)" \
                        || echo "  ✓ copied  ${target}"
  fi
}

case "$MODE" in
  copy) claude_how=copy; agents_how=copy ;;
  link) claude_how=link; agents_how=link ;;
  *)    claude_how=link; agents_how=copy ;;   # auto
esac

for skill in "${SKILLS[@]}"; do
  install_one "$CLAUDE_BASE" "$claude_how" "$skill"
  install_one "$AGENTS_BASE" "$agents_how" "$skill"
done

cat <<'EOF'

Done. Notes:
  • Claude Code reads .claude/skills; Cursor/Codex/Gemini/Copilot/Amp read .agents/skills.
  • Codex does NOT load a symlinked .agents/skills, so that target is copied by default.
  • Symlinked targets refresh on `git pull`; copied targets need a re-run of this script.
  • Verify: ls "<target>/bambuser-integration/SKILL.md" "<target>/bambuser-knowledge/SKILL.md"
    — then restart your agent / new session.
  • claude.ai users: allow 'bambuser.com' AND 'knowledge.bambuser.com' at
    claude.ai/settings/capabilities, or the skills cannot fetch the docs they rely on.
EOF
