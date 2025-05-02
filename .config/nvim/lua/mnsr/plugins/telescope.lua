return {
  'nvim-telescope/telescope.nvim',
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
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local ts = require('telescope')
    local actions = require('telescope.actions')
    local utils = require('telescope.utils')

    ts.setup({
      defaults = {
        layout_strategry = 'vertical',
        layout_config = { height = 0.95, width = 0.99 },
        path_display = function(opts, path)
          local tail = utils.path_tail(path)
          return string.format('%s - (%s)', tail, path)
        end,
        file_ignore_patterns = { ".DS_Store" },
        mappings = {
          i = {
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next,     -- move to next result
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<A-cr>'] = function(bufnr)                 -- open in new split vertical
              require('telescope.actions.set').select(bufnr, 'vertical')
            end,
          },
        },
      },
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
          -- theme = 'ivy',
        },
      },
      extensions = {
        undo = {},
        fzf = {},
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }

          -- pseudo code / specification for writing custom displays, like the one
          -- for "codeactions"
          -- specific_opts = {
          --   [kind] = {
          --     make_indexed = function(items) -> indexed_items, width,
          --     make_displayer = function(widths) -> displayer
          --     make_display = function(displayer) -> function(e)
          --     make_ordinal = function(e) -> string
          --   },
          --   -- for example to disable the custom builtin "codeactions" display
          --      do the following
          --   codeactions = false,
          -- }
        }
      },
    })

    pcall(ts.load_extension('undo'))
    pcall(ts.load_extension('fzf'))
    pcall(ts.load_extension('ui-select'))
  end,
}
