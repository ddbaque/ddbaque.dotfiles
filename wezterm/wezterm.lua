---     ____              _     __   _____               ___       __          _
---    / __ \____ __   __(_)___/ /  / ___/__  _______   /   | ____/ /___ ___  (_)___
---   / / / / __ `/ | / / / __  /   \__ \/ / / / ___/  / /| |/ __  / __ `__ \/ / __ \
---  / /_/ / /_/ /| |/ / / /_/ /   ___/ / /_/ (__  )  / ___ / /_/ / / / / / / / / / /
--- /_____/\__,_/ |___/_/\__,_/   /____/\__, /____/  /_/  |_\__,_/_/ /_/ /_/_/_/ /_/
---                                    /____/

--- My Wezterm config file

local wezterm = require("wezterm")
local act = wezterm.action

local fish_path = "/usr/bin/fish"
local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.default_prog = { fish_path, "-l" }

config.color_scheme = "Tokyo Night" -- You can change this to a lila-oriented theme
config.font = wezterm.font_with_fallback({
	{ family = "Iosevka Nerd Font", scale = 1.4, weight = "Medium" },
	{ family = "FantasqueSansM Nerd Font", scale = 1.3 },
})
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
	brightness = 0.35,
}

-- Key bindings
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

	-- Pane keybindings
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},

	-- Tab keybindings
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "n", mods = "LEADER", action = act.ShowTabNavigator },
	{
		key = "e",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Renaming Tab Title...:" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
	-- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
	{ key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

	-- Lastly, workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- Colores personalizadas (Tonos lilas brillantes)
config.colors = {
	foreground = "#C3CDFF", -- Claro, pero brillante
	background = "#000000", -- Fondo oscuro para contraste
	cursor_bg = "#bb9af7", -- Lila brillante para el cursor
	cursor_border = "#bb9af7", -- Mismo color para el borde
	cursor_fg = "#1a1b26", -- Color del texto en el cursor

	-- Definición de colores ANSI (para comandos y texto)
	ansi = { "#1a1b26", "#ff5555", "#C77DFF", "#f1fa8c", "#bd93f9", "#ff79c6", "#8be9fd", "#f8f8f2" },
	brights = { "#6272a4", "#ff6e6e", "#9EABFF", "#ffffa5", "#d3afff", "#ff92d0", "#6ae3d0", "#ffffff" },

	-- Colores de selección y elementos resaltados
	selection_bg = "#bb9af7",
	selection_fg = "#1a1b26",

	-- Colores de los tabs
	tab_bar = {
		background = "#000000", -- Fondo oscuro para el tab bar
		active_tab = {
			bg_color = "#4B39F2", -- Color lila brillante para la pestaña activa
			fg_color = "#EDF0FF",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#1D174F", -- Fondo más oscuro para pestañas inactivas
			fg_color = "#DEE5FF", -- Texto de pestañas inactivas
		},
		inactive_tab_hover = {
			bg_color = "#7c7f93", -- Resaltado suave para las pestañas inactivas
			fg_color = "#1a1b26",
		},
	},
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false

-- Configuración de la barra de estado
wezterm.on("update-status", function(window, pane)
	-- Workspace name
	local stat = window:active_workspace()
	local stat_color = "#9EABFF" -- Lila brillante
	-- It's a little silly to have workspace name all the time
	-- Utilize this to display LDR or current key table name
	if window:active_key_table() then
		stat = window:active_key_table()
		stat_color = "#7dcfff"
	end
	if window:leader_is_active() then
		stat = "LDR"
		stat_color = "#7A68FF"
	end

	local basename = function(s)
		-- Nothing a little regex can't fix
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- Current working directory
	local cwd = pane:get_current_working_dir()
	if cwd then
		if type(cwd) == "userdata" then
			-- Wezterm introduced the URL object in 20240127-113634-bbcac864
			cwd = basename(cwd.file_path)
		else
			-- 20230712-072601-f4abf8fd or earlier version
			cwd = basename(cwd)
		end
	else
		cwd = ""
	end

	-- Current command
	--
	local cmd = pane:get_foreground_process_name()
	-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
	cmd = cmd and basename(cmd) or ""

	-- Time
	local time = wezterm.strftime("%H:%M")

	-- IP address
	local function get_local_ip()
		local handle = io.popen("hostname -i | awk '{print $1}'")
		local result = handle:read("*a")
		handle:close()
		return result:gsub("\n", "")
	end

	-- Battery
	local bat = ""
	local bat_color = "#FFFFFF" -- default color
	for _, b in ipairs(wezterm.battery_info()) do
		local charge_percentage = b.state_of_charge * 100
		local icon = ""
		-- Asigna el color según el porcentaje
		if charge_percentage >= 95 then
			icon = wezterm.nerdfonts.md_battery
			bat_color = "#69FF94" -- Green
		elseif charge_percentage >= 80 then
			icon = wezterm.nerdfonts.md_battery_80
			bat_color = "#69FF94" -- Green
		elseif charge_percentage >= 40 then
			icon = wezterm.nerdfonts.md_battery_60
			bat_color = "#9D4EDD" -- Violet (for very low battery)
		elseif charge_percentage >= 20 then
			icon = wezterm.nerdfonts.md_battery_30
			bat_color = "#F2AB53" -- Yellow
		else
			icon = wezterm.nerdfonts.md_battery_10
			bat_color = "#C92929" -- Red
		end

		if b.state == "Charging" then
			icon = wezterm.nerdfonts.md_battery_charging
			bat_color = "#00DFF8" -- cyan
		end
		bat = icon .. " " .. string.format("%.0f%%", b.state_of_charge * 100)
	end

	-- Left status (left of the tab line)
	window:set_left_status(wezterm.format({
		{ Foreground = { Color = stat_color } },
		{ Text = "  " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
		{ Text = " |" },
	}))

	-- Right status
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_earth .. " " .. get_local_ip() },
		{ Text = " | " },
		{ Foreground = { Color = bat_color } }, -- yellow
		{ Text = bat },
		{ Text = "  " },
	}))
end)

return config
