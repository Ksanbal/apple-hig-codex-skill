#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$ROOT/plugins/apple-hig/skills/apple-human-interface-guidelines/SKILL.md"

if [ ! -f "$SKILL_SRC" ]; then
  echo "Missing skill file: $SKILL_SRC" >&2
  exit 1
fi

# 1) Codex: register this repository as a local plugin marketplace.
if command -v codex >/dev/null 2>&1; then
  codex plugin marketplace add "$ROOT" || true
  python3 - <<'PY'
from pathlib import Path
cfg = Path.home() / '.codex' / 'config.toml'
text = cfg.read_text() if cfg.exists() else ''
block = '[plugins."apple-hig@local-apple-design-skills"]\nenabled = true\n'
if '[plugins."apple-hig@local-apple-design-skills"]' not in text:
    if text and not text.endswith('\n'):
        text += '\n'
    text += '\n' + block
    cfg.parent.mkdir(parents=True, exist_ok=True)
    cfg.write_text(text)
print('Codex plugin enabled: apple-hig@local-apple-design-skills')
PY
else
  echo "codex not found; skipped Codex plugin registration"
fi

# 2) Claude Code: install as a global skill.
CLAUDE_SKILL_DIR="$HOME/.claude/skills/apple-human-interface-guidelines"
mkdir -p "$CLAUDE_SKILL_DIR"
cp "$SKILL_SRC" "$CLAUDE_SKILL_DIR/SKILL.md"
echo "Claude Code skill installed: $CLAUDE_SKILL_DIR/SKILL.md"

# 3) OpenCode: install as a global skill.
OPENCODE_SKILL_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/opencode/skills/apple-human-interface-guidelines"
mkdir -p "$OPENCODE_SKILL_DIR"
cp "$SKILL_SRC" "$OPENCODE_SKILL_DIR/SKILL.md"
echo "OpenCode skill installed: $OPENCODE_SKILL_DIR/SKILL.md"

echo "Done. Restart Codex, Claude Code, and OpenCode sessions so the new skill is loaded."
