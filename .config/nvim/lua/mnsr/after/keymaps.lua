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
km.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
km.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
km.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
km.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
km.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
km.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
km.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
km.set('n', '<leader>tc', '<cmd>Telescope colorscheme<CR>',
  { desc = '[T]elescope [C]olorscheme', noremap = true, silent = true })
km.set('n', '<leader>tm', '<cmd>Telescope marks<CR>', { desc = '[T]elescope [M]arks', noremap = true, silent = true })
km.set('n', '<leader>dg', '<cmd>Telescope dir live_grep<CR>',
  { desc = '[D]irectory [G]rep', noremap = true, silent = true })
km.set('n', '<leader>df', '<cmd>Telescope dir find_files<CR>',
  { desc = '[D]irectory [F]ind files', noremap = true, silent = true })
km.set('n', '<leader>gg', '<cmd>:LazyGit<CR>', { desc = '[G]it Lazy[g]it', noremap = true, silent = true })
--- END TELESCOPE ---

--- TELESCOPE FILE BROWSER ---
-- km.set('n', '<leader>fb', ':Telescope file_browser<CR>', { noremap = true, desc = '[F]ile [B]rowser' })
--- END TELESCOPE FILE BROWSER ---

--NVIM TREE --

km.set('n', '<leader>sf', '<cmd>NvimTreeToggle<CR>', { desc = '[E]xplorer [T]oggle' }) -- toggle file explorer
-- km.set("n", "<leader>se", "<cmd>NvimTreeFocus<CR>", { desc = "[F]ocus file [E]xplorer" })
km.set('n', '<leader>e', '<cmd>NvimTreeFindFile<CR>', { desc = '[E]xplorer focus on current [F]ile' })
km.set("n", "<leader>fc", "<cmd>NvimTreeCollapseKeepBuffers<CR>", { desc = "[F]ile explorer [C]ollapse" })
-- km.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "[F]ile explorer [R]efresh" }) -- refresh file explorer
