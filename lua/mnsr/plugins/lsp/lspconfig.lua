return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    -- [[ Configure LSP ]]
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      local builtin = require('telescope.builtin')
      local lspBuf = vim.lsp.buf
      -- A function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', lspBuf.rename, '[R]e[n]ame')
      nmap('<leader>ca', lspBuf.code_action, '[C]ode [A]ction')

      nmap('gd', '<cmd>tab split | lua vim.lsp.buf.definition()<cr>', '[G]oto [D]efinition')
      nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
      nmap('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', lspBuf.type_definition, 'Type [D]efinition')
      nmap('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', lspBuf.hover, 'Hover Documentation')
      nmap('<C-k>', lspBuf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', lspBuf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', lspBuf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', lspBuf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(lspBuf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        lspBuf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    --
    --  If you want to override the default filetypes that your language server will attach to you can
    --  define the property 'filetypes' to the map in question.
    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      rust_analyzer = {},
      tsserver = {
        --single_file_support = false,
      },
      -- html = { filetypes = { 'html', 'twig', 'hbs' } },

      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require('mason-lspconfig')

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end,
    })
    -- Error msgs (diagnostics)
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    })

    -- You will likely want to reduce updatetime which affects CursorHold
    -- note: this setting is global and should be set only once
    vim.o.updatetime = 250
    vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

    -- Borders
    vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
    vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

    local border = {
      { '🭽', 'FloatBorder' },
      { '▔', 'FloatBorder' },
      { '🭾', 'FloatBorder' },
      { '▕', 'FloatBorder' },
      { '🭿', 'FloatBorder' },
      { '▁', 'FloatBorder' },
      { '🭼', 'FloatBorder' },
      { '▏', 'FloatBorder' },
    }

    local border2 = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
    --
    -- To instead override globally
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border2
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
  end,
}
