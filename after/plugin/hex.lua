local hex = require('hex')

hex.setup()

vim.keymap.set('n', '<leader>hd', function()
    hex.dump()
end, { desc = 'Hex Dump' })

vim.keymap.set('n', '<leader>ha', function()
    hex.assemble()
end, { desc = 'Hex Assemble' })

vim.keymap.set('n', '<leader>ht', function()
    hex.toggle()
end, { desc = 'Hex Toggle' })
