#!/usr/bin/env bash
# Set the LibreOffice icon style (no Papirus/Adwaita set exists for LO 26.x).
# Change STYLE and re-apply to switch (e.g. sukapura_dark_svg, sukapura_svg, karasa_jaga_svg, colibre_dark_svg).
STYLE=sukapura_dark_svg
F="$HOME/.config/libreoffice/4/user/registrymodifications.xcu"
[ -f "$F" ] || exit 0
if pgrep -x soffice.bin >/dev/null; then
  echo "LibreOffice is running; close it and re-run 'chezmoi apply'." >&2
  exit 0
fi
python3 -I - "$F" "$STYLE" <<'PY'
import re, sys
p, style = sys.argv[1], sys.argv[2]
s = open(p, encoding="utf-8").read()
pat = re.compile(r'(<item oor:path="/org\.openoffice\.Office\.Common/Misc"><prop oor:name="SymbolStyle"[^>]*><value>)[^<]*(</value>)')
if pat.search(s):
    s = pat.sub(r'\g<1>' + style + r'\g<2>', s, count=1)
else:
    s = s.replace('</oor:items>', '<item oor:path="/org.openoffice.Office.Common/Misc"><prop oor:name="SymbolStyle" oor:op="fuse"><value>' + style + '</value></prop></item>\n</oor:items>', 1)
open(p, "w", encoding="utf-8").write(s)
PY
