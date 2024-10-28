local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Project Find' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Project Search (grep)' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Project Buffers' })
