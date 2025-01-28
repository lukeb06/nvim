return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require("conform")

        local opts = {
            formatters_by_ft = {
                markdown = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                typescriptreact = { "prettier" },
                javascriptreact = { "prettier" },
                liquid = { "prettier" },
                python = { "ruff" },
            }
        }

        conform.setup(opts)

        vim.keymap.set("n", "<leader>fc", conform.format, { desc = "Format with Conform" })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                conform.format({ bufnr = args.buf })
            end,
        })
    end,
}
