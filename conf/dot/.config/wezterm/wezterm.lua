local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.color_scheme = "Abernathy"
-- config.color_scheme = "Brogrammer"
config.color_scheme = "Dark+"
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 10.0
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	-- Create a new tab in the same domain at the current pane.
	{
		key = "t",
		mods = "ALT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
}

-- ALT + NUMBER to move to that postion
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
