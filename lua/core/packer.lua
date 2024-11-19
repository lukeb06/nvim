-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'lukeb06/abyss.nvim',
        run = function()
            local status, abyss = pcall(require, 'abyss')
            if not status then return end

            abyss.setup()
        end
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'theprimeagen/harpoon'
    use 'tpope/vim-fugitive'

    use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' })
    use({ 'neovim/nvim-lspconfig' })
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp' })

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'L3MON4D3/LuaSnip'

    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    use 'lewis6991/gitsigns.nvim'     -- OPTIONAL: for git status

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use "supermaven-inc/supermaven-nvim"

    use "nvim-lualine/lualine.nvim"
    use "stevearc/resession.nvim"
    use "christoomey/vim-tmux-navigator"
    use "folke/which-key.nvim"
    use "preservim/vimux"

    use "lukas-reineke/lsp-format.nvim"

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
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
                    python = { "ruff" }
                }
            })
        end,
    })

    use 'meznaric/key-analyzer.nvim'
    use 'ThePrimeagen/vim-be-good'

    use 'onsails/lspkind.nvim'

    use 'nvzone/volt'
    use 'nvzone/minty'

    use 'ray-x/lsp_signature.nvim'

    use 'stevearc/aerial.nvim'

    use 'stevearc/overseer.nvim'
    use 'andrew-george/telescope-themes'
    use 'catppuccin/nvim'
end)
