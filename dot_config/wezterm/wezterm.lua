local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Moonfly (same scheme as kitty's current-theme.conf, ported by hand for exact color match)
-- https://github.com/bluz71/vim-moonfly-colors/blob/master/extras/moonfly-kitty.conf
config.colors = {
	background = "#080808",
	foreground = "#bdbdbd",
	cursor_bg = "#9e9e9e",
	cursor_border = "#9e9e9e",
	cursor_fg = "#080808",
	selection_bg = "#b2ceee",
	selection_fg = "#080808",
	ansi = {
		"#323437",
		"#ff5d5d",
		"#8cc85f",
		"#e3c78a",
		"#80a0ff",
		"#cf87e8",
		"#79dac8",
		"#c6c6c6",
	},
	brights = {
		"#949494",
		"#ff5189",
		"#36c692",
		"#c6c684",
		"#74b2ff",
		"#ae81ff",
		"#85dc85",
		"#e4e4e4",
	},
	tab_bar = {
		active_tab = {
			bg_color = "#80a0ff",
			fg_color = "#080808",
		},
		inactive_tab = {
			bg_color = "#323437",
			fg_color = "#b2b2b2",
		},
	},
}

-- Keybinds ported from ~/.config/kitty/kitty.conf and tabs.conf
config.keys = {
	{ key = "Insert", mods = "SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

	-- kitty: map ctrl+shift+alt+enter launch --location=hsplit --cwd=current
	-- (wezterm splits already inherit the current pane's cwd by default)
	{
		key = "Enter",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

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
