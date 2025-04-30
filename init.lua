vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.vscode then
  print("Running Neovim - Mansoor's Config")
  require('mnsr.core.vscode')
else
  require('mnsr.core')
  require('mnsr.core.keymaps')
  require('mnsr.lazy')
  require('mnsr.after.keymaps')
  require('autocmd')
end
