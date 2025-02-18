return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	opts = {
		lsp = {
			signature = {
				enabled = false,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		cmdline = {
			view = "cmdline",
		},
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
			{
				filter = {
					event = "lsp",
					kind = "progress",
					cond = function(message)
						local client = vim.tbl_get(message.opts, "progress", "client")
						return client == "lua_ls"
					end,
				},
				opts = { skip = true },
			},
		},
	},
}
