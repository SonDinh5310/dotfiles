return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle <cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
	opts = {
		modes = {
			test = {
				mode = "diagnostics",
				preview = {
					type = "split",
					relative = "win",
					position = "right",
					size = 0.3,
				},
				filter = {
					any = {
						buf = 0, -- current buffer
						{
							severity = vim.diagnostic.severity.ERROR, -- errors only
							-- limit to files in the current project
							function(item)
								return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
							end,
						},
					},
				},
			},
		},
	},
}
