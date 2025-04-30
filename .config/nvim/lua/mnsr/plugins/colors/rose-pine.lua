-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		local rose_pine = require("rose-pine")

		rose_pine.setup({
			-- highlight_groups = {
			-- 	Comments = { italic = false, fg = "foam" },
			-- 	Variable = {italic = false },
			-- 	Property = {italic = false },
			-- 	Parameter = {italic = false },
			-- 	Function = {italic = false },
			-- 	Lsp = { italic = false }
			-- },

			styles = {
			 italic = false,
			 transparency = true
		 }
		})

		vim.cmd("colorscheme rose-pine")
	end
}

