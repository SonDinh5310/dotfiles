return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		require("onedarkpro").setup({
			options = {
				terminal_colors = true,
			},
			styles = {
				types = "NONE",
				methods = "NONE",
				numbers = "NONE",
				strings = "NONE",
				comments = "italic",
				keywords = "bold,italic",
				constants = "NONE",
				functions = "NONE",
				operators = "NONE",
				variables = "NONE",
				parameters = "NONE",
				conditionals = "italic",
				virtual_text = "NONE",
				Normal = "NONE",
				Folded = "NONE",
				SignColumn = "NONE",
				Statusline = "NONE",
				Tabline = "NONE",
			},
		})
		vim.cmd("colorscheme onedark_vivid")
	end,
}
