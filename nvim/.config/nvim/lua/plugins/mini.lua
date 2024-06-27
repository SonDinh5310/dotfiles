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
		version = "*",
		config = function()
			require("mini.indentscope").setup({
				draw = { animation = require("mini.indentscope").gen_animation.none() },
			})
		end,
	},
}
