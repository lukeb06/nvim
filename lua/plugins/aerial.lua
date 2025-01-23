return {
    'stevearc/aerial.nvim',
    config = true,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>w", "<cmd>AerialToggle<CR>", noremap = true, silent = true, desc = "Toggle Aerial" },
    }
}
