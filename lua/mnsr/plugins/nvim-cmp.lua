return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    -- Snippet Engine & its associated nvim-cmp source
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    -- [[ Configure nvim-cmp ]]
    -- See `:help cmp`
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup({})

    -- cmp  options/setup
    local cmpOptions = {
      enabled = function()
        if vim.bo.buftype == 'prompt' then
          return false
        end
        return true
      end,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
          vim.fn['vnsip#anonymous'](args.body)
        end,
      },
      -- CMP Mappings
      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete({}),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      -- CMP Borders
      border = {
        completion = true,
        documentation = true,
      },
      window = {
        completion = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
          winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
        },
        documentation = {
          border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
          winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None',
        },
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    }

    cmp.setup(cmpOptions)
  end,
}
