return {
  "numToStr/Comment.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function() -- runs require('Comment').setup()
    require("Comment").setup({
      -- ignore empty lines
      ignore = "^$",

      ---Add a space b/w comment and the line
      padding = true,

      ---Whether the cursor should stay at its position
      sticky = true,

      toggler = {
        ---Line-comment toggle keymap
        line = "<C-/>",
        ---Block-comment toggle keymap
        block = "gbc",
      },

      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = "<C-/>",
        ---Block-comment keymap
        block = "gb",
      },

      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = "gcO",
        ---Add comment on the line below
        below = "gco",
        ---Add comment at the end of line
        eol = "gcA",
      },

      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
      ---Function to call before (un)comment
      pre_hook = nil,
      ---Function to call after (un)comment
      post_hook = nil,
    })
  end,
}
