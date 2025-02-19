local actions = {}

function register_keymap(mode, key, cmd, desc)
	vim.keymap.set(mode, key, cmd, { desc = desc, silent = true })

	if actions[mode] == nil then
		actions[mode] = {}
	end

	actions[mode][key] = { cmd = cmd, desc = desc }
end

local function create_menu()
	local Menu = require("nui.menu")

	local lines = {}

	local mode = vim.api.nvim_get_mode().mode

	local _actions = actions[mode]

	if _actions == nil then
		vim.notify("No actions for mode: " .. mode)
		return
	end

	for _, action in pairs(_actions) do
		local item = Menu.item(action.desc, { cmd = action.cmd })
		table.insert(lines, item)
	end

	local menu = Menu({
		position = "50%",
		size = {
			width = "50%",
			height = "50%",
		},
		border = {
			style = "single",
			text = {
				top = "[history.nvim]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		lines = lines,
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			-- print("Menu Closed!")
		end,
		on_submit = function(item)
			vim.notify(type(item.cmd))
			if type(item.cmd) == "function" then
				item.cmd()
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(item.cmd, true, true, true), "n", false)
			end
		end,
	})

	-- mount the component
	menu:mount()
end

vim.keymap.set("n", "<leader><leader>", create_menu, { desc = "Create Menu", silent = true })
