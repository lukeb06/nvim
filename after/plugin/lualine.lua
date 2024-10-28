require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
    },
    sections = {
        lualine_a = {{'filename', path = 1}, 'branch', 'mode'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'filetype', 'progress', 'location'}
    },
    extensions = {'nvim-tree', 'mason'}
}

