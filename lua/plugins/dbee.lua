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
				require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
				require("dbee.sources").MemorySource:new({
					{
						id = "aa_11",
						name = "AA 11",
						type = "sqlite",
						url = "~/aa/aa11-sequelize-search-params/server/db/dev.db",
					},
					{
						id = "mod_4",
						name = "Mod 4 Project",
						type = "sqlite",
						url = "~/aa/mod_4_project/backend/db/dev.db",
					},
					{
						id = "mod_5",
						name = "Mod 5 Project",
						type = "sqlite",
						url = "~/aa/travelly/backend/db/dev.db",
					},
					{
						id = "practice",
						name = "Practice",
						type = "sqlite",
						url = "~/aa/order-up/aa18-python-order-up/instance/dev.db",
					},
				}),
			},
		})
	end,
}
