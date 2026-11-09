#!/usr/bin/env bash
# Build ~/.claude-team (CLAUDE_CONFIG_DIR for the second Claude Code account).
# Shares config with ~/.claude via symlinks; login, history, .claude.json and the
# OMC usage cache (plugins/oh-my-claudecode) stay separate. Idempotent; never touches credentials.
set -eu
src="$HOME/.claude"
dst="$HOME/.claude-team"
[ -d "$src" ] || exit 0
mkdir -p "$dst/plugins/oh-my-claudecode"
link() { [ -e "$1" ] && [ ! -e "$2" ] && [ ! -L "$2" ] && ln -s "$1" "$2" || true; }
for f in CLAUDE.md RTK.md settings.json settings.local.json keybindings.json skills hooks hud; do
  link "$src/$f" "$dst/$f"
done
for e in "$src"/plugins/* "$src"/plugins/.[!.]*; do
  [ -e "$e" ] || continue
  n=$(basename "$e")
  case "$n" in oh-my-claudecode|.usage-cache*) continue;; esac
  link "$e" "$dst/plugins/$n"
done
