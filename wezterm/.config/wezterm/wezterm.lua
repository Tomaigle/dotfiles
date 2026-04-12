local wezterm = require("wezterm")
local config = wezterm.config_builder()

local home = os.getenv("HOME")

config.default_prog = { "/usr/bin/fish", "-l" }

config.unix_domains = {
	{ name = "unix" },
}
config.default_gui_startup_args = { "connect", "unix" }

config.set_environment_variables = {
	PATH = home .. "/go/bin:" .. home .. "/.local/bin:" .. (os.getenv("PATH") or ""),
}

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1500 }

wezterm.on("update-status", function(window, pane)
	local workspace = window:active_workspace()
	local color = "#c4746e" -- A soft red from Kanagawa Dragon palette

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = color } },
		{ Attribute = { Intensity = "Bold" } },
		{ Text = "    " .. workspace .. "  " },
	}))
end)

config.keys = {
	{ key = "v", mods = "LEADER", action = wezterm.action.SplitPane({ direction = "Right", size = { Percent = 50 } }) },
	{ key = "n", mods = "LEADER", action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 50 } }) },

	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },

	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

	{ key = "s", mods = "LEADER", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },

	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Text = "Enter name for new workspace: " },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(wezterm.action.SwitchToWorkspace({ name = line }), pane)
				end
			end),
		}),
	},
}

config.color_scheme = "Kanagawa Dragon (Gogh)"
config.window_background_opacity = 0.9
config.enable_tab_bar = true

config.window_decorations = "TITLE | RESIZE"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.0

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false

return config
