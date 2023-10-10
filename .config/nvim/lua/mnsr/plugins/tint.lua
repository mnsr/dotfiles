return {
  "levouh/tint.nvim",
  config = function()
    require("tint").setup({
      tint = -60,
      saturation = 0.6,
      tint_background_colors = true,
    })
  end,
}
