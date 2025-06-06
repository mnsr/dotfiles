return {
  'pathEdenEast/nightfox.nvim',
  name = 'nightfox',
  lazy = false,
  priority = 1000,
  config = function()
    local setup = {
      options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath('cache') .. '/nightfox',
        compile_file_suffix = '_compiled', -- Compiled file suffix
        transparent = false, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        module_default = true, -- Default enable value for modules
        colorblind = {
          enable = false, -- Enable colorblind support
          simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
          severity = {
            protan = 0, -- Severity [0,1] for protan (red)
            deutan = 0, -- Severity [0,1] for deutan (green)
            tritan = 0, -- Severity [0,1] for tritan (blue)
          },
        },
        styles = { -- Style to be applied to different syntax groups
          comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
          conditionals = 'NONE',
          constants = 'NONE',
          functions = 'bold,italic',
          keywords = 'bold,italic',
          numbers = 'NONE',
          operators = 'NONE',
          strings = 'NONE',
          types = 'bold',
          variables = 'NONE',
        },
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
        modules = { -- List of various plugins and additional options
          -- ...
        },
      },
      palettes = {
        nightfox = {
          bg1 = '#101721',
        },
      },
      specs = {},
      groups = {},
    }

    require('nightfox').setup(setup)

    vim.cmd.colorscheme('nightfox')
  end,
}
