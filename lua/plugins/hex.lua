return {
    'RaafatTurki/hex.nvim',
    config = true,
    keys = {
        { "<leader>hd", function() require('hex').dump() end,     { desc = "Hex Dump" } },
        { "<leader>ha", function() require('hex').assemble() end, { desc = "Hex Assemble" } },
        { "<leader>ht", function() require('hex').toggle() end,   { desc = "Hex Toggle" } },
    }
}
