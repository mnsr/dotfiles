-- lualine.nvim : https://github.com/nvim-lualine/lualine.nvim
--+-------------------------------------------------+
--| A | B | C                             X | Y | Z |
--+-------------------------------------------------+
--
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require('lualine')
    local lazy_status = require('lazy.status') -- to configure lazy pending updates count

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '|', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree', 'NvimTree_1' },
      },
      globalstatus = false,
      always_show_tabline = false,
      always_divide_middle = true,
      winbar = {
        lualine_a = {
          {
            'buffers',
            show_filename_only = true,
            mode = 0,
            show_modified_status = true,
            icons_enabled = false,
          },

        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            icons_enabled = true,
            padding = 2,
          },
        },
        lualine_c = {
          { 'filename', path = 1 },
        },
        lualine_x = {
          {
            'lsp_status',
            icon = '', -- f013
            symbols = {
              -- Standard unicode symbols to cycle through for LSP progress:
              spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
              -- Standard unicode symbol for when LSP is done:
              done = '✓',
              -- Delimiter inserted between LSP names:
              separator = ' ',
            },
            -- List of LSP names to ignore (e.g., `null-ls`):
            ignore_lsp = {},
          }
        },
        lualine_y = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e64' },
          },
          -- { 'fileformat' },
          { 'filetype' },
        },
      },
    })
  end,
}
