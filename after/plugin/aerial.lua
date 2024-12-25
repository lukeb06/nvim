local aerial = require('aerial')

aerial.setup({
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
})

vim.keymap.set("n", "<leader>w", "<cmd>AerialToggle<CR>", { noremap = true, silent = true, desc = "Aerial Toggle" })
