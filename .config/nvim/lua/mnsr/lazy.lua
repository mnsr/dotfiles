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
  { import = 'mnsr.plugins.colorscheme' },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  -- 'nvim-telescope/telescope-file-browser.nvim',
  { import = 'mnsr.plugins.lsp.lspconfig' },
  { import = 'mnsr.plugins.linting' },
  { import = 'mnsr.plugins.nvim-cmp' },
  { import = 'mnsr.plugins.nvim-tree' },
  { import = 'mnsr.plugins.nvim-treesitter' },
  { import = 'mnsr.plugins.tmux-navigator' },
  { import = 'mnsr.plugins.telescope' },
  { import = 'mnsr.plugins.bufferline' },
  { import = 'mnsr.plugins.comments' },
  { import = 'mnsr.plugins.formatting' },
  { import = 'mnsr.plugins.gitsigns' },
  { import = 'mnsr.plugins.illuminate' },
  { import = 'mnsr.plugins.lualine' },
  { import = 'mnsr.plugins.tint' },
  { import = 'mnsr.plugins.todo-comments' },
  { import = 'mnsr.plugins.which-key' },
}

-- MNSR Settings
local settings = {
  install = {
    missing = true,
    colorscheme = { 'catppuccin' },
  },

  spec = {
    { import = 'lazyvim.plugins.extras.lang.typescript' },
    { import = 'lazyvim.plugins.extras.lang.json' },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'tohtml',
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
