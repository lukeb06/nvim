local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ['d'] = actions.delete_buffer
            }
        }
    }
})

vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files()
end, { desc = 'Project Find' })

vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Project Search (grep)' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>pb', function()
    builtin.buffers({ sort_mru = true, sort_lastused = true, initial_mode = 'normal' })
end, { desc = 'Project Buffers' })


vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "Telescope Definitions" })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "Telescope References" })

vim.keymap.set('n', '<leader><leader>', builtin.resume, { desc = 'Telescope Resume' })
