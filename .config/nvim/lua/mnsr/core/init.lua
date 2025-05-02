local opt = vim.opt
local api = vim.api
local wo = vim.wo

-- line numbers
opt.relativenumber = true
opt.number = true
wo.signcolumn = "yes"

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus") -> use "+p instead
opt.undofile = true

-- split windows
opt.splitright = true
opt.splitbelow = true

-- pum = popup menu
opt.pumheight = 10

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,preview"

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

opt.swapfile = false

api.nvim_set_hl(0, "LineNr", { fg = "white" })
api.nvim_set_hl(0, "NormalNC", { bg = 0, ctermbg = "none" })
api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
vim.cmd([[hi NormalNC guibg=NONE ctermbg=NONE]])
--opt.iskeyword:append("-")
