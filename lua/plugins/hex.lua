return {
	"RaafatTurki/hex.nvim",
	config = true,
	keys = {
		{
			"<leader>bh",
			function()
				require("hex").toggle()
			end,
			desc = "Hex Toggle",
		},
	},
}
