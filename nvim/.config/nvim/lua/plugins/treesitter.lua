return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "html", "css", "javascript", "typescript", "tsx", "lua" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
