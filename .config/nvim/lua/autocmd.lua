vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('dotfiles', { clear = true }),
  pattern = { '.tmux.conf', '.wezterm.lua', '.config/nvim/*' },
  -- command = [[!cp ~/.tmux.conf ~/dotfiles/%]],
  callback = function()
    print('files copied to ~/dotfiles')
    --vim.fn.jobstart({ 'cp ~/.tmux.conf ~/dotfiles/' })
    local ff = vim.fn.finddir('%')
    print(ff)
    -- vim.cmd([[!cp ~/% ~/dotfiles/%]])
    vim.cmd([[!rsync -a ~/% ~/dotfiles/%]])
  end,
})
