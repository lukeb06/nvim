local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local themes = require('telescope.themes')

telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--trim",
            "--multiline",
        },
        mappings = {
            n = {
                ['d'] = actions.delete_buffer
            }
        }
    }
})

local dropdown_theme = themes.get_dropdown({ winblend = 10 })

function clone(t) -- deep-copy a table
    if type(t) ~= "table" then return t end
    local meta = getmetatable(t)
    local target = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            target[k] = clone(v)
        else
            target[k] = v
        end
    end
    setmetatable(target, meta)
    return target
end

vim.keymap.set('n', '<leader>pf', function()
    local theme = clone(dropdown_theme)
    builtin.find_files(theme)
end, { desc = 'Project Find' })

vim.keymap.set('n', '<leader>ps', function()
    local theme = clone(dropdown_theme)
    theme.layout_config.width = 0.75
    builtin.live_grep(theme)
end, { desc = 'Project Search (grep)' })

-- vim.keymap.set('n', '<C-p>', function()
--     local theme = clone(dropdown_theme)
--     builtin.git_files(theme)
-- end, { desc = 'Telescope git files' })

vim.keymap.set('n', '<leader>pb', function()
    local theme = clone(dropdown_theme)
    theme.sort_mru = true
    theme.sort_lastused = true
    theme.initial_mode = 'normal'

    builtin.buffers(theme)
end, { desc = 'Project Buffers' })

vim.keymap.set('n', '<leader>pd', function()
    local theme = clone(dropdown_theme)
    theme.initial_mode = 'normal'

    builtin.diagnostics(theme)
end, { desc = 'Project Diagnostics' })

vim.keymap.set('n', 'gd', function()
    local theme = clone(dropdown_theme)
    theme.initial_mode = 'normal'

    builtin.lsp_definitions(theme)
end, { desc = "Telescope Definitions" })

vim.keymap.set('n', 'gr', function()
    local theme = clone(dropdown_theme)
    theme.initial_mode = 'normal'

    builtin.lsp_references(theme)
end, { desc = "Telescope References" })

vim.keymap.set('n', '<leader>pj', function()
    local theme = clone(dropdown_theme)
    theme.sort_mru = true
    theme.sort_lastused = true
    theme.layout_config.width = 0.75
    theme.initial_mode = 'normal'

    builtin.jumplist(theme)
end, { desc = 'Telescope Jumplist' })

vim.keymap.set('n', '<leader><leader>', builtin.resume, { desc = 'Telescope Resume' })
