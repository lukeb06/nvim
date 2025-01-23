return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
        local harpoon = require("harpoon")

        require("telescope").load_extension("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Harpoon Add" })

        vim.keymap.set("n", "<leader>e", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon Menu" })

        vim.keymap.set("n", "<C-m>", function()
            harpoon:list():next()
        end, { desc = "Harpoon Next" })

        vim.keymap.set("n", "<C-n>", function()
            harpoon:list():prev()
        end, { desc = "Harpoon Prev" })
    end,
}
