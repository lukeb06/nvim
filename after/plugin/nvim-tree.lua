require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
        side = "right",
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    }
})

