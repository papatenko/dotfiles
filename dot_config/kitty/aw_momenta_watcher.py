# kitty global watcher: tag windows working in Momenta OS so ActivityWatch
# (awatcher records the kitty window title) counts them as Momenta Fire time.
# Windows whose foreground process is herdr are skipped; aw-herdr-bridge
# handles herdr panes via herdr's client.window_title.set API.
import os
from typing import Any

PROJECTS = {os.path.expanduser("~/Nextcloud/Apps/Momenta OS"): "Momenta OS"}


def _project(window) -> "str | None":
    try:
        procs = window.child.foreground_processes
        if any(os.path.basename((p.get("cmdline") or [""])[0]) == "herdr" for p in procs):
            return None
        cwd = window.child.foreground_cwd or window.child.current_cwd
    except Exception:
        return None
    if not cwd:
        return None
    cwd = os.path.realpath(cwd)
    for root, name in PROJECTS.items():
        root = os.path.realpath(root)
        if cwd == root or cwd.startswith(root + os.sep):
            return name
    return None


def _sync(window) -> None:
    proj = _project(window)
    base = window.child_title or ""
    if proj:
        want = f"{proj} · {base}" if base else proj
        if window.override_title != want:
            window.set_title(want)
    elif window.override_title and window.override_title.startswith(tuple(f"{n} ·" for n in PROJECTS.values()) + tuple(PROJECTS.values())):
        window.set_title(None)


def on_title_change(boss: Any, window: Any, data: dict) -> None:
    if data.get("from_child"):
        _sync(window)


def on_focus_change(boss: Any, window: Any, data: dict) -> None:
    if data.get("focused"):
        _sync(window)


def on_cmd_startstop(boss: Any, window: Any, data: dict) -> None:
    _sync(window)
