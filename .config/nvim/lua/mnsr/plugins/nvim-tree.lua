return {
  'nvim-tree/nvim-tree.lua',
  event = { 'BufReadPre', 'BufNewFile', 'BufEnter' },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local nvimtree = require('nvim-tree')

    -- recommended settings from nvim-tree documentation
    -- vim.g.loaded_netrw = 1
    -- vim.g.loaded_netrwPlugin = 1
    -- vim.g.nvim_tree_respect_buf_cwd = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 40,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '', -- arrow when folder is closed
              arrow_open = '', -- arrow when folder is open
            },
          },
        },
      },
      tab = {
        sync = {
          close = true
        }
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          --quit_on_open = true
        },
      },
      filters = {
        custom = { '.DS_Store' },
      },
      git = {
        ignore = false,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })
  end,
}
