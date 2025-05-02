-- See `:help vim.keymap.set()`
local km = vim.keymap

-- Keymaps for better default experience
-- km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
--
-- clear search highlights
km.set('n', '<leader>nh', ':nohl<CR>', { desc = '[N]o [H]ighlights' })

-- Save file shortcut
km.set({ 'n', 'v' }, '<C-s>', '<cmd>w<CR>', { desc = '[S]ave File', silent = true })

-- Window/workspace management
km.set('n', '<leader>wv', '<C-w>v', { desc = '[W]orkspace split [V]ertically' })
km.set('n', '<leader>wh', '<C-w>s', { desc = '[W]orkspace split [H]orizontally' })
km.set('n', '<leader>we', '<C-w>=', { desc = '[W]orkspace [E]qual size' })
km.set('n', '<leader>wx', '<cmd>close<CR>', { desc = '[S]plit workspace Close [X]' })

-- Tab management
km.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = '[T]ab [O]pen' })
km.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = '[T]ab close [X]' })
km.set('n', '<TAB>', '<cmd>bnext<CR>', { desc = '<TAB>Go to next tab' })
km.set('n', '<S-TAB>', '<cmd>bprev<CR>', { desc = '<Shift+TAB>Go to prev tab' })
km.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = '[T]ab [N]ext' })
km.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = '[T]ab [P]revious' })
km.set('n', '<leader>tb', '<cmd>tabnew %<CR>', { desc = '[T]Open current [B]uffer in new tab' })

km.set('n', '<leader>x', '<cmd>bd<cr>', { desc = '[X] Close Buffer' })
