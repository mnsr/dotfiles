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
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = true, -- dims the background color of inactive window
    shade = 'dark',
    percentage = 0.55, -- percentage of the shade to apply to the inactive window
  },
  styles = {
    comments = { 'italic' },
    conditionals = { 'bold' },
    loops = {},
    functions = { 'bold' },
    keywords = { 'bold', 'italic' },
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = { 'bold' },
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

local embark = themeSetup('embark', 'mnsr/embark', 1000)

local nightOwl = themeSetup('night-owl', 'oxfist/night-owl.nvim', 1000)

local tokyoNight = themeSetup('tokyonight', 'folke/tokyonight.nvim', 1000)

return {
  -- catppuccin,
  -- embark,
  -- nightOwl,
  tokyoNight,
}
