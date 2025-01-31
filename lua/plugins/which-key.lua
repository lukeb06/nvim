return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        vim.keymap.set('n', '<leader>?', function()
            require("which-key").show({ global = true })
        end, { desc = "Buffer Local Keymaps (which-key)" })


        local wk = require("which-key")
        wk.add({
            { "<leader>g",  group = "Git" },
            { "<leader>p",  group = "Project" },
            { "<leader>t",  group = "Tree" },
            { "<leader>b",  group = "Buffer" },
            { "<leader>j",  group = "Terminal" },
            { "<leader>h",  group = "Hex/Harpoon" },
            { "<leader>jb", group = "Bun" },
            { "<leader>jn", group = "Node" },
            { "<leader>jd", group = "Docker" },
        })
    end,
}
