-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        -- vim.keymap.set('n', 'K', 'vim.lsp.buf.hover', opts)
        -- vim.keymap.set('n', 'gd', 'vim.lsp.buf.definition', opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references', opts)
        vim.keymap.set('n', 'gs', 'vim.lsp.buf.signature_help', opts)
        vim.keymap.set('n', '<F2>', 'vim.lsp.buf.rename', opts)
        vim.keymap.set('n', '<F4>', 'vim.lsp.buf.code_action', opts)
    end,
})

local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_format = lspkind.cmp_format({
    mode = 'symbol_text', -- show only symbol annotations
    preset = 'codicons',
    symbol_map = {
        Supermaven = "",
    },
    maxwidth = {
        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- can also be a function to dynamically calculate max width such as
        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        menu = 50,             -- leading text (labelDetails)
        abbr = 50,             -- actual suggestion item
    },
    ellipsis_char = '...',     -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    show_labelDetails = false, -- show labelDetails in menu. Disabled by default
})


require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
    },
    sources = {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 4 },
        { name = 'path' },
        -- { name = 'supermaven' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-g>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = cmp_format,
    },
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        }
    },
})
