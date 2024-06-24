return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            window = {
                position = "right",
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                }
            }
        })
        vim.keymap.set("n", "<C-n>", "<CMD>Neotree toggle<CR>", {})
        vim.keymap.set("n", "<leader>bf", "<CMD>Neotree buffers reveal float<CR>", {})
    end
}
