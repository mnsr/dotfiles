return {
  "leath-dub/snipe.nvim",
  keys = {
    { "<C-p>", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
  },
  opts = {
    ui = {
      hints = {
        dictionary = 'asfghl;wertyuiop',
      },
      navigate = {
        close_buffers = 'D',
        cancel_snipe = '<esc>'
      },
      open_win_override = {
        border = "rounded",
      },
      icon = true,
      sort = 'default',
      preselect_current = true,

      -- Open buffer in vertical split
      open_vsplit = "V",

      -- Open buffer in split, based on `vim.opt.splitbelow`
      open_split = "H",

      -- Change tag manually
      change_tag = "C",

      buffer_format = { "-> ", "icon", "filename", " - (", "directory", ")", function(buf)
        if vim.fn.isdirectory(vim.api.nvim_buf_get_name(buf.id)) == 1 then
          return " ", "SnipeText"
        end
      end },
    }
  },
  -- function()
  --   local snipe = require('snipe')
  --   snipe.setup({
  --     ui = {
  --     }
  --   })
  -- end

}
