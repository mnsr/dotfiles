-- Theme Setup
local function themeSetup(name, path, priority, setup)
  return {
    path,
    name = name,
    lazy = false,
    priority = priority,
    config = function()
      if setup then
        require(name).setup(setup)
      end
      vim.cmd.colorscheme(name)
    end,
  }
end

-- testing
local catppuccin = themeSetup('catppuccin', 'catppuccin/nvim', 1000, {
  flavour = 'mocha',
  no_italic = false,
  no_bold = false,
  no_underline = false,
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = true,         -- sets terminal colors (e.g. `g:terminal_color_0`)
  -- dim_inactive = {
  --   enabled = false, -- dims the background color of inactive window
  --   shade = 'dark',
  --   percentage = 0.55, -- percentage of the shade to apply to the inactive window
  -- },
  styles = {
    comments = { 'italic' },
    conditionals = { 'bold' },
    loops = {},
    functions = { 'bold', 'italic' },
    keywords = { 'italic' },
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  custom_highlights = function(colors)
    return {
      -- Comment = { fg = colors.flamingo },
      -- TabLineSel = { bg = colors.pink },
      CmpBorder = { fg = colors.surface2 },
      -- Pmenu = { bg = colors.none },
    }
  end,
  integrations = {
    cmp = { enabled = true, border = true },
    gitsigns = { enabled = true, border = true },
    nvimtree = true,
    treesitter = true,
    which_key = { enabled = true, border = true },
  },
})

-- local kanagawa = themeSetup('kanagawa', 'rebelot/kanagawa.nvim', 1000, {
--   compile = false, -- enable compiling the colorscheme
--   undercurl = true, -- enable undercurls
--   commentStyle = { italic = true },
--   functionStyle = { bold = true, italic = true },
--   keywordStyle = { bold = true, italic = true },
--   statementStyle = { bold = true },
--   typeStyle = {},
--   transparent = false, -- do not set background color
--   dimInactive = true, -- dim inactive window `:h hl-NormalNC`
--   terminalColors = true, -- define vim.g.terminal_color_{0,17}
--   colors = { -- add/modify theme and palette colors
--     palette = {},
--     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
--   },
--   -- overrides = function(colors) -- add/modify highlights
--   --   return {}
--   -- end,
--   theme = 'wave', -- Load "wave" theme when 'background' option is not set
--   background = { -- map the value of 'background' option to a theme
--     dark = 'wave', -- try "dragon" !
--     light = 'lotus',
--   },
-- })

-- local nightfox = require('mnsr.plugins.colors.nightfox')
-- local embark = themeSetup('embark', 'mnsr/embark', 1000)
-- local nightOwl = themeSetup('night-owl', 'oxfist/night-owl.nvim', 1000)
-- local tokyoNight = themeSetup('tokyonight', 'folke/tokyonight.nvim', 1000)

return {
  -- nightfox,
  -- kanagawa,
  catppuccin,
  -- embark,
  -- nightOwl,
  -- tokyoNight,
}
