return {
  "nvim-tree/nvim-tree.lua",
  event = { "BufReadPre", "BufNewFile", "BufEnter" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")

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
        width = 35,
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
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>ft", "<cmd>NvimTreeToggle<CR>", { desc = "[F]ile explorer [T]oggle" }) -- toggle file explorer
    keymap.set("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "[F]ocus file [E]xplorer" })
    keymap.set("n", "<leader>ff", "<cmd>NvimTreeFindFile<CR>", { desc = "[F]ocus explorer on current [F]ile" })
    keymap.set("n", "<leader>fc", "<cmd>NvimTreeCollapseKeepBuffers<CR>", { desc = "[F]ile explorer [C]ollapse" })
    keymap.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "[F]ile explorer [R]efresh" }) -- refresh file explorer
  end,
}
