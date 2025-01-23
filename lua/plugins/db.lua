return {
    "kndndrj/nvim-dbee",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    build = function()
        -- Install tries to automatically detect the install method.
        -- if it fails, try calling it with one of these parameters:
        --    "curl", "wget", "bitsadmin", "go"
        require("dbee").install()
    end,
    config = function()
        require("dbee").setup({
            sources = {
                require("dbee.sources").MemorySource:new({
                    {
                        id = "test_sqlite",
                        name = "Local Messenger",
                        type = "sqlite",
                        url = "~/repos/settlemyre-messenger/database.db",
                    },
                    {
                        id = "aa_11",
                        name = "AA 11",
                        type = "sqlite",
                        url = "~/aa/aa11-sequelize-search-params/server/db/dev.db"
                    }
                }),
            },
        })

        vim.keymap.set("v", "r", '"vy:lua require("dbee").execute(vim.fn.getreg("v"))<CR>',
            { desc = "Run SQL", silent = true })
    end,
}
