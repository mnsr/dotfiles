-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		local rose_pine = require("rose-pine")

		rose_pine.setup({
			variant = "auto",   -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = true,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = true,
				migrations = true,
			},

			styles = {
				italic = false,
				transparency = true
			},

			highlight_groups = {
				-- 	Comments = { italic = false, fg = "foam" },
				-- 	Variable = {italic = false },
				-- 	Property = {italic = false },
				-- 	Parameter = {italic = false },
				-- 	Function = {italic = false },
				-- 	Lsp = { italic = false }
			},

			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",

				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",

				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",

				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
			palette = {},
			before_highlight = function()
			end,
		})

		vim.cmd("colorscheme rose-pine")
	end
}
