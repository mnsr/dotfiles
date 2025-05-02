local km = vim.keymap
local extras = require('mnsr.after.extras')

-- Lazy Plugin Manager shortcut
km.set('n', '<leader>lz', '<cmd>Lazy<cr>', { desc = '[L]a[Z]y nvim plugin manager' })

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
km.set('n', '<leader>en', function()
  builtin.find_files { cwd = vim.fn.stdpath('config') }
end, { desc = '[F]ind [F]iles' })
km.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
km.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
-- km.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
km.set('n', '<leader>fg', extras.live_multigrep, { desc = '[F]ind by [G]rep' })
km.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
km.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
km.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
km.set('n', '<leader>lr', builtin.lsp_references, { desc = '[L]ist [R]eferences' })
km.set('n', '<leader>ld', builtin.lsp_definitions, { desc = '[L]ist [D]efinitions' })
km.set('n', '<leader>sp', builtin.spell_suggest, { desc = '[SP]ell' })
km.set('n', '<leader>tv', builtin.quickfix, { desc = '[T]elescope [V]im options' })
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

km.set('n', '<leader>sf', '<cmd>NvimTreeToggle<CR>', { desc = '[S]how [F]inder' }) -- toggle file explorer
-- km.set("n", "<leader>se", "<cmd>NvimTreeFocus<CR>", { desc = "[F]ocus file [E]xplorer" })
km.set('n', '<leader>e', '<cmd>NvimTreeFindFile<CR>', { desc = '[E]xplorer focus on current [F]ile' })
km.set("n", "<leader>fc", "<cmd>NvimTreeCollapseKeepBuffers<CR>", { desc = "[F]ile explorer [C]ollapse" })
-- km.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", { desc = "[F]ile explorer [R]efresh" }) -- refresh file explorer
--
-- HARPOON --
-- local harpoon = require("harpoon")

-- -- REQUIRED
-- harpoon:setup()
-- -- REQUIRED

-- vim.keymap.set("n", "<leader>am", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<C-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- -- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-K>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-J>", function() harpoon:list():next() end)
