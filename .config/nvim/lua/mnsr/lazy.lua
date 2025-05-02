-- Lazy NVIM
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- MNSR Plugins
local imports = {
  { import = 'mnsr.plugins.colors.rose-pine' },
  -- { import = 'mnsr.plugins.colorscheme' },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  -- 'nvim-telescope/telescope-file-browser.nvim',
  { import = 'mnsr.plugins.web-devicons' },
  { import = 'mnsr.plugins.lsp.lspconfig' },
  { import = 'mnsr.plugins.linting' },
  { import = 'mnsr.plugins.nvim-cmp' },
  { import = 'mnsr.plugins.nvim-tree' },
  { import = 'mnsr.plugins.nvim-treesitter' },
  { import = 'mnsr.plugins.tmux-navigator' },
  { import = 'mnsr.plugins.telescope' },
  { import = 'mnsr.plugins.telescope-dir' },
  { import = 'mnsr.plugins.blankline' },
  -- { import = 'mnsr.plugins.bufferline' },
  { import = 'mnsr.plugins.comments' },
  { import = 'mnsr.plugins.flash' },
  { import = 'mnsr.plugins.formatting' },
  { import = 'mnsr.plugins.gitsigns' },
  { import = 'mnsr.plugins.illuminate' },
  { import = 'mnsr.plugins.lazygit' },
  { import = 'mnsr.plugins.lualine' },
  { import = 'mnsr.plugins.oil' },
  { import = 'mnsr.plugins.snipe' },
  { import = 'mnsr.plugins.database' },
  -- { import = 'mnsr.plugins.harpoon' },
  { import = 'mnsr.plugins.session' },
  { import = 'mnsr.plugins.tint' },
  { import = 'mnsr.plugins.todo-comments' },
  { import = 'mnsr.plugins.which-key' },
}

-- MNSR Settings
local settings = {
  install = {
    missing = true,
    colorscheme = { 'rose-pine' },
  },

  spec = {
    { import = 'lazyvim.plugins.extras.lang.vim' },
    { import = 'lazyvim.plugins.extras.lang.lua' },
    { import = 'lazyvim.plugins.extras.lang.rust' },
    { import = 'lazyvim.plugins.extras.lang.typescript' },
    { import = 'lazyvim.plugins.extras.lang.json' },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'matchit',
        'tar',
        'tarPlugin',
        'rrhelper',
        'spellfile_plugin',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
        'tutor',
        'rplugin',
        'syntax',
        'synmenu',
        'optwin',
        'compiler',
        'bugreport',
        'ftplugin',
      },
    },
  },
}

require('lazy').setup(imports, settings)
