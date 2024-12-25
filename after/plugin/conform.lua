local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        markdown = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        typescriptreact = { "prettierd" },
        javascriptreact = { "prettierd" },
        liquid = { "prettierd" },
        python = { "ruff" },
    }
})

vim.keymap.set("n", "<leader>fc", conform.format, { desc = "Format with Conform" })

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})
