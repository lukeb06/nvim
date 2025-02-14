return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		local opts = {
			formatters_by_ft = {
				lua = { "stylua" },
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
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
		}

		conform.setup(opts)

		vim.keymap.set("n", "<leader>bfc", conform.format, { desc = "Format with Conform" })
	end,
}
