return {
	'RaafatTurki/hex.nvim',
	config = true,
	keys = {
		{ "<leader>ht", function() require('hex').toggle() end, desc = "Hex Toggle" },
	}
}
