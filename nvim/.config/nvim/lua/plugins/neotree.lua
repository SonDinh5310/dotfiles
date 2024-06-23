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
            window = {
                position = "right",
            }
        })
        vim.keymap.set("n", "<C-n>", "<CMD>Neotree toggle<CR>", {})
        vim.keymap.set("n", "<leader>bf", "<CMD>Neotree buffers reveal float<CR>", {})
    end
}
