require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "⟳",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"eslint",
		"pyright",
		"gopls",
		"html",
		"emmet_ls",
		"dockerls",
		"tailwindcss",
		"bashls",
		"shopify_theme_ls",
		"sqls",
	},
	handlers = {
		-- Default handler
		function(server_name)
			local server_config = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(client, bufnr)
					--
				end,
			}

			-- Server-specific configurations
			if server_name == "lua_ls" then
				server_config.settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				}
			elseif server_name == "tsserver" then
				server_config.settings = {
					completions = { completeFunctionCalls = true },
					javascript = { suggest = { autoImports = true } },
					typescript = { suggest = { autoImports = true } },
				}
			elseif server_name == "tailwindcss" then
				server_config.filetypes = {
					"html",
					"javascriptreact",
					"typescriptreact",
					"liquid",
				}
			elseif server_name == "pyright" then
				server_config.settings = {
					python = {
						analysis = {
							typeCheckingMode = "off",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				}
			end

			require("lspconfig")[server_name].setup(server_config)
		end,

		-- Special handler for Shopify
		["shopify_theme_ls"] = function()
			require("lspconfig").shopify_theme_ls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				settings = {
					themeCheck = {
						enabled = true,
						autoCorrect = true,
						liquidHTML = true,
					},
				},
			})
		end,
	},
})
