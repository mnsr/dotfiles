return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    'debugloop/telescope-undo.nvim',
  },
  config = function()
    local ts = require('telescope')
    local actions = require('telescope.actions')

    ts.setup({
      pickers = {
        find_files = {
          find_command = {
            'fd',
            '.',
            '--type',
            'file',
            '--hidden',
            '--strip-cwd-prefix',
          },
          hidden = true,
        },
      },
      extensions = {
        undo = {},
      },
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<A-cr>'] = function(bufnr) -- open in new split vertical
              require('telescope.actions.set').select(bufnr, 'vertical')
            end,
            -- ["<cr>"] = function(bufnr) -- open in new tab
            --   -- require("telescope.actions.set").edit(bufnr, "tab drop") -- open in current buffer
            --   require("telescope.actions.set").select(bufnr, "tab")
            -- end,
          },
        },
      },
    })

    pcall(ts.load_extension('undo'))
    pcall(ts.load_extension('fzf'))
  end,
}
