local km = vim.keymap

-- Lazy Plugin Manager shortcut
km.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = '[L]azy nvim plugin manager' })

--- TELESCOPE ---
local builtin = require('telescope.builtin')
-- See `:help telescope.builtin`
km.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
km.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
km.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = '[/] Fuzzily search in current buffer' })

km.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
km.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
km.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
km.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
km.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
km.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
km.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
km.set('n', '<leader>sb', builtin.buffers, { desc = '[S]how [B]uffers' })
--- END TELESCOPE ---
--
--- TELESCOPE FILE BROWSER ---
-- km.set('n', '<leader>fb', ':Telescope file_browser<CR>', { noremap = true, desc = '[F]ile [B]rowser' })
--- END TELESCOPE FILE BROWSER ---

--- WHICH KEY ---
require('which-key').register({
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  ['<leader>f'] = { name = '[F]ile explorer', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]ab / [T]erminal', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
})
---END WHICH KEY---
