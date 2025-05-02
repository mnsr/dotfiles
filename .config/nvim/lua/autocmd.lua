vim.api.nvim_create_autocmd({ "BufDelete" }, {
  desc = "Close NVIM Tree on buffer delete",
  pattern = "*",
  callback = function()
    vim.cmd.NvimTreeClose()
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    ---@diagnostic disable-next-line: missing-parameter
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        desc = "Auto format before save",
        -- pattern = { "*.ts", "*.tsx", "*.lua", "*.js", "*.html" },
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
          -- require('conform').format({ bufnr = args.buf })
        end
      })
    end
  end
})

local homeFolder = vim.fn.expand('~')

-- For syncing dotfiles only. Should not be run for anything other than that
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
