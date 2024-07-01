return {
	"Shatur/neovim-session-manager",
	event = "User BaseFile",
	cmd = "SessionManager",
	opts = function()
		local config = require("session_manager.config")
		return {
			autoload_mode = config.AutoloadMode.Disabled,
			autosave_last_session = false,
			autosave_only_in_session = false,
		}
	end,
	config = function(_, opts)
		local session_manager = require("session_manager")
		session_manager.setup(opts)

		-- Auto save session
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			callback = function()
				for _, buf in ipairs(vim.api.nvim_list_bufs()) do
					-- Don't save while there's any 'nofile' buffer open.
					if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "nofile" then
						return
					end
				end
				session_manager.save_current_session()
			end,
		})
	end,
}
