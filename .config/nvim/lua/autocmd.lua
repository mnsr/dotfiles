vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  desc = "Auto format before save",
  pattern = { "*.ts", "*.tsx", "*.lua", "*.js", "*.html" },
  callback = function(args)
    vim.lsp.buf.format()
    require('conform').format({ bufnr = args.buf })
  end
})

local homeFolder = vim.fn.expand('~')

vim.api.nvim_create_autocmd({ 'BufWritePost', 'FileWritePost' }, {
  desc = "Auto update dotfiles repo on change.",
  group = vim.api.nvim_create_augroup('dotfiles', { clear = true }),
  pattern = {
    homeFolder .. '/.zshrc',
    homeFolder .. '/.tmux.conf',
    homeFolder .. '/.wezterm.lua',
    homeFolder .. '/.config/nvim/**/*',
    homeFolder .. '/.config/git/config',
    homeFolder .. '/.config/ghostty/*',
  },
  callback = function()
    local currentFile = vim.fn.expand('%:p:~')
    vim.cmd('!rsync -a ' .. currentFile .. ' ~/dotfiles/' .. string.sub(currentFile, 3))
    print('files copied to ~/dotfiles')
  end,
})
