local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Same scheme as kitty's current-theme.conf; wezterm ships it as a built-in.
config.color_scheme = "Moonfly (Gogh)"

-- Keybinds ported from ~/.config/kitty/kitty.conf and tabs.conf, plus
-- Konsole's default pane-management shortcuts (Konsole has no user overrides
-- on this system, so these are its stock defaults).
config.keys = {
	{ key = "Insert", mods = "SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

	-- Konsole: Split View Left/Right (Ctrl+()
	{ key = "(", mods = "CTRL", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- Konsole: Split View Top/Bottom (Ctrl+))
	{ key = ")", mods = "CTRL", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- Konsole: Toggle Maximize Current View (Ctrl+Shift+E)
	{ key = "E", mods = "CTRL|SHIFT", action = wezterm.action.TogglePaneZoomState },
	-- Konsole: Expand/Shrink View (Ctrl+Shift+]/[) -- approximated as directional
	-- resize since wezterm has no directionless "expand active pane" action.
	{ key = "]", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "[", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },

	-- kitty: alt+1..9 goto_tab 1..9 (wezterm tabs are 0-indexed)
	{ key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
	{ key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
	{ key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
	{ key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
	{ key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8) },

	-- kitty: map ctrl+t new_tab (deliberate, alongside kitty_mod+t new_tab_with_cwd;
	-- wezterm's default ctrl+shift+t already spawns with cwd, so only ctrl+t needs adding here)
	-- Caveat carries over: this steals ctrl+t from fzf's file widget in zsh.
	{ key = "t", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

	-- NOT ctrl+w -- that is zsh's backward-kill-word.
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },

	{ key = "PageUp", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
	{ key = "PageDown", mods = "CTRL|SHIFT", action = wezterm.action.MoveTabRelative(1) },
}

return config
