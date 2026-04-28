#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$ROOT/plugins/apple-hig/skills/apple-human-interface-guidelines/SKILL.md"

if command -v codex >/dev/null 2>&1; then
  codex plugin marketplace add "$ROOT" || true
  python3 - <<'PY'
from pathlib import Path
cfg = Path.home()/'.codex'/'config.toml'
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
  echo "codex not found; skipped Codex registration"
fi

HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"
HERMES_SKILL_DIR="$HERMES_HOME/skills/design/apple-human-interface-guidelines"
mkdir -p "$HERMES_SKILL_DIR"
cp "$SKILL_SRC" "$HERMES_SKILL_DIR/SKILL.md"
echo "Hermes skill installed: $HERMES_SKILL_DIR/SKILL.md"

echo "Done. Restart Codex/Hermes sessions so the new skill is loaded."
