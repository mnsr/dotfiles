return {
  "RRethy/vim-illuminate",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 10,
      under_cursor = true,
      min_count_to_highlight = 1,
      case_insensitive_regex = false,
    })
  end,
}
