#!/bin/bash
# Linux system vitals for the tmux status bar: CPU% and memory used.
#
# CPU: short delta sample of /proc/stat (aggregate, not per-process — avoids
#   the cost and inaccuracy of `ps -A -o %cpu` / `top`).
# Memory: MemTotal - MemAvailable from /proc/meminfo, matching what most
#   Linux tools report as "used" (excludes reclaimable cache/buffers).

read -r _ u1 n1 s1 i1 w1 irq1 sirq1 _ < /proc/stat
sleep 0.1
read -r _ u2 n2 s2 i2 w2 irq2 sirq2 _ < /proc/stat

idle1=$((i1 + w1))
idle2=$((i2 + w2))
total1=$((u1 + n1 + s1 + i1 + w1 + irq1 + sirq1))
total2=$((u2 + n2 + s2 + i2 + w2 + irq2 + sirq2))

dtotal=$((total2 - total1))
didle=$((idle2 - idle1))

cpu=$(awk -v dt="$dtotal" -v di="$didle" 'BEGIN {
  if (dt > 0) { v = (dt - di) * 100 / dt; if (v < 0) v = 0; if (v > 100) v = 100; printf "%.0f", v }
  else printf "?"
}')

if [ -r /proc/meminfo ]; then
  eval "$(awk '
    /^MemTotal:/     { print "total=" $2 }
    /^MemAvailable:/ { print "avail=" $2 }
  ' /proc/meminfo)"
fi

if [ -n "${total:-}" ] && [ -n "${avail:-}" ] && [ "$total" -gt 0 ]; then
  used=$((total - avail))
  read -r usedg totalg pct <<<"$(awk -v u="$used" -v t="$total" \
    'BEGIN { printf "%.1f %.0f %.0f", u/1048576, t/1048576, u*100/t }')"
  printf 'CPU %s%%  MEM %sG/%sG (%s%%)' "${cpu:-?}" "$usedg" "$totalg" "$pct"
else
  printf 'CPU %s%%  MEM ?' "${cpu:-?}"
fi
