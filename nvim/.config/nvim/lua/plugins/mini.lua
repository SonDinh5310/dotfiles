return {
	{
		"echasnovski/mini.surround",
		version = "*",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.cursorword",
		version = "*",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPre", "BufNewFile" },
		version = "*",
		config = function()
			require("mini.indentscope").setup({
				draw = { animation = require("mini.indentscope").gen_animation.none() },
				symbol = "▏",
			})

			-- Disable indentscope when in these file types
			init = function()
				vim.api.nvim_create_autocmd("FileType", {
					desc = "Disable indentscope for certain filetypes",
					pattern = {
						"help",
						"Trouble",
						"trouble",
						"Lazy",
						"Mason",
						"notify",
						"better_term",
						"toggleterm",
						"lazyterm",
						"dashboard",
						"neo-tree",
					},
					callback = function()
						vim.b.miniindentscope_disable = true
					end,
				})
			end
		end,
	},
}
