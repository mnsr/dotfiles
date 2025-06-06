return {
  'stevearc/conform.nvim',
  enabled = false,
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 10000,
        lsp_format = "fallback",
      },
    })

    vim.keymap.set({ 'n', 'v' }, '<leader>fm', function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = 'Format file or range (in visual mode)' })
  end,
}
