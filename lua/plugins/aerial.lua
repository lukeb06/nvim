return {
    'stevearc/aerial.nvim',
    config = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>a", "<cmd>AerialToggle<CR>", noremap = true, silent = true, desc = "Toggle Aerial" },
    }
}
