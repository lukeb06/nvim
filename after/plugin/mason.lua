require("lsp-format").setup {}
require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { "lua_ls", "ts_ls", "eslint", "pyright", "gopls", "html", "emmet_ls", "dockerls", "tailwindcss" },
    handlers = {
        function(server_name)
            if server_name == 'lua_ls' then
                require('lspconfig')[server_name].setup({
                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using
                                -- (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = {
                                    'vim',
                                    'require'
                                },
                            },
                            workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            -- Do not send telemetry data containing a randomized but unique identifier
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                    on_attach = require("lsp-format").on_attach
                })
            else
                require('lspconfig')[server_name].setup({
                    on_attach = require("lsp-format").on_attach
                })
            end
        end,
    },
})
