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

-- General
-- config.debug_key_events = true
config.allow_win32_input_mode = true
config.window_close_confirmation = 'AlwaysPrompt'
config.front_end = 'WebGpu' -- IMPORTANT on macOS to enable Metal
config.prefer_egl = true --https://wezfurlong.org/wezterm/config/lua/config/prefer_egl.html?h=prefer_egl
config.audible_bell = 'Disabled'
-- config.dpi = 144.0

-- Fonts
config.font = wezterm.font_with_fallback({
  -- {
  --   family = 'Operator Mono Lig',
  --   weight = 'Medium',
  --   stretch = 'Expanded',
  --   harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
  -- },
  -- {
  --   family = 'JetBrains Mono',
  --   weight = 'DemiBold',
  --   stretch = 'Expanded',
  --   harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
  -- },
  {
    family = 'Pragmata Pro',
    weight = 'DemiBold',
    stretch = 'Expanded',
    harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
  },
  -- { family = 'Symbols Nerd Font Mono', scale = 0.75 },
})

-- config.font_size = 20.0 -- PragmataPro
-- config.line_height = 1.4 -- PragmataPro
config.line_height = 1.25 -- JetBrainsMono
config.font_size = 19.0 -- OperatorMono
-- config.line_height = 1.1 -- JetBrainsMono
-- config.font_size = 16.0 -- JetBrainsMono
config.freetype_load_target = 'Normal' -- HorizontalLcd|Normal|VerticalLcd|Mono|Light
config.freetype_load_flags = 'DEFAULT' --'NO_HINTING|FORCE_AUTOHINT|DEFAULT|NO_AUTOHINT|NO_BITMAP'
config.cell_width = 0.9
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

--------------------------------------------------
-- Keybinds																				 *
--------------------------------------------------
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

-- helper fn for tmux key binds
local assignMultipleKey = function(key, mod, send, sendKey)
  local action = act.Multiple({
    tmuxLeader,
    act.SendKey({ key = send }),
    sendKey or nil,
  })
  return assignKey(key, mod, action)
end

-- Load keybinds
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
  assignMultipleKey('RightArrow', 'CMD|SHIFT', ')'), -- Next Session
  assignMultipleKey('LeftArrow', 'CMD|SHIFT', '('), -- Next Session
  -----------------------------------------
  assignMultipleKey(':', 'CMD|SHIFT', ':'), -- TMUX Commands
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
  assignKey('Tab', 'ALT', act.ActivatePaneDirection('Next')), -- switch between splits
  assignKey('w', 'CMD', act.CloseCurrentTab({ confirm = true })), -- confirmation close
  assignKey('w', 'CMD', act.CloseCurrentPane({ confirm = true })), -- confirmation close
  -----------------------------------------
  -- VIM
  -----------------------------------------
  assignKey( -- Comment shortcut for vim
    '/',
    'CMD',
    act.Multiple({
      act.SendKey({ key = ' ' }),
      act.SendKey({ key = 'g' }),
      act.SendKey({ key = 'c' }),
      act.SendKey({ key = 'c' }),
    })
  ),
}

-- and finally, return the configuration to wezterm
return config
