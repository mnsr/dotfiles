------------------------------------------
-- WEZTERM CONFIG ------------------------
-- github.com/mnsr/dotfiles --------------
------------------------------------------

-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.window_close_confirmation = 'AlwaysPrompt'
config.front_end = 'WebGpu' -- IMPORTANT on macOS
config.audible_bell = 'Disabled'

-- Fonts
config.font = wezterm.font_with_fallback({
  -- { family = "JetBrains Mono", weight = "Medium" },
  { family = 'Pragmata Pro', weight = 'Medium' },
  { family = 'Symbols Nerd Font Mono', scale = 0.75 },
})
config.font_size = 17.0 -- PragmataPro
-- config.font_antialias = "Subpixel"
config.freetype_load_target = 'Normal'
config.freetype_load_flags = 'NO_HINTING'
config.cell_width = 0.9
config.line_height = 1.4
config.bold_brightens_ansi_colors = true

-- Window
config.initial_cols = 160
config.initial_rows = 60
config.macos_window_background_blur = 30
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.9
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
  left = 10,
  right = 8,
  bottom = 0,
  top = 12,
}
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- Tab
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
-- config.window_frame = {
-- 	font = wezterm.font("Pragmata Pro", { weight = "Bold" }),
-- 	font_size = 12.0,
-- }

-- Theme
local customScheme = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
customScheme.tab_bar.background = '#040404'
customScheme.tab_bar.inactive_tab.bg_color = '#0f0f0f'
customScheme.tab_bar.new_tab.bg_color = '#080808'
-- config.color_scheme = "Catppuccin Mocha"
config.color_schemes = {
  ['OLEDppuccin'] = customScheme,
}
config.color_scheme = 'OLEDppuccin'

-- *************************************************
-- Keybinds																				 *
-- *************************************************
local act = wezterm.action

local tmuxLeader = act.SendKey({ key = 'a', mods = 'CTRL' })
-- fn assignKey - Helper fn to assign keys below
-- assigns using leader key
local assignKey = function(key, mod, action)
  return {
    key = key,
    mods = mod,
    action = action,
  }
end

local assignMultipleKey = function(key, mod, send, sendKey)
  local action = act.Multiple({
    tmuxLeader,
    act.SendKey({ key = send }),
    sendKey or nil,
  })
  return assignKey(key, mod, action)
end

config.keys = {
  assignKey('v', 'CMD', act.PasteFrom('Clipboard')), -- allow paste
  -----------------------------------------
  -- TMUX SPLIT ---------------------------
  -----------------------------------------
  assignMultipleKey('s', 'CMD', '%'), -- Horizontal
  assignMultipleKey('d', 'CMD', '"'), -- Vertical
  -----------------------------------------
  -- TMUX NAVIGATE ------------------------
  -----------------------------------------
  assignMultipleKey('j', 'CMD', 'DownArrow'), -- Down
  assignMultipleKey('k', 'CMD', 'UpArrow'), -- Up
  assignMultipleKey('h', 'CMD', 'LeftArrow'), -- Left
  assignMultipleKey('l', 'CMD', 'RightArrow'), -- Right
  assignMultipleKey('H', 'CMD|SHIFT', 'p'), -- Previous Window
  assignMultipleKey('L', 'CMD|SHIFT', 'n'), -- Next Window
  -----------------------------------------
  assignMultipleKey(':', 'CMD|SHIFT', ':'), -- Commands
  -----------------------------------------
  -- TMUX LIST WINDOWS --------------------
  -----------------------------------------
  assignMultipleKey('s', 'CMD|SHIFT', 's'), -- show sessions
  assignMultipleKey('w', 'CMD|SHIFT', 'w'), -- show windows
  assignMultipleKey('n', 'CMD|SHIFT', 'c'), -- new window
  -----------------------------------------
  -----------------------------------------
  -- WEZTERM - PANES
  -----------------------------------------
  assignKey(
    '-',
    'CMD|SHIFT',
    act.SplitHorizontal({ domain = 'CurrentPaneDomain' })
  ),
  assignKey(
    '=',
    'CMD|SHIFT',
    act.SplitVertical({ domain = 'CurrentPaneDomain' })
  ),
  assignKey('Tab', 'ALT', act.ActivatePaneDirection('Next')),
  assignKey('w', 'CMD', act.CloseCurrentTab({ confirm = true })), -- confirmation close
  assignKey('w', 'CMD', act.CloseCurrentPane({ confirm = true })), -- confirmation close
}

-- and finally, return the configuration to wezterm
return config
