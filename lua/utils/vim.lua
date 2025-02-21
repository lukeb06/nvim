local actions = {}

-- Sort actions by description
local function sort_actions(mode)
	table.sort(actions[mode], function(a, b)
		return a.desc < b.desc
	end)
end

local function register_keymap(mode, key, cmd, desc)
	vim.keymap.set(mode, key, cmd, { desc = desc, silent = true })

	if actions[mode] == nil then
		actions[mode] = {}
	end

	table.insert(actions[mode], { key = key, cmd = cmd, desc = desc })

	sort_actions(mode)
end

local function create_menu()
	local Menu = require("nui.menu")
	local NuiText = require("nui.text")
	local NuiLine = require("nui.line")

	local lines = {}

	local mode = string.lower(vim.api.nvim_get_mode().mode)

	local _actions = actions[mode]

	if _actions == nil then
		vim.notify("No actions for mode: " .. mode)
		return
	end

	for _, action in pairs(_actions) do
		local line = NuiLine()

		line:append(NuiText(" ", "Comment"))
		line:append(NuiText(action.desc, "Normal"))
		line:append(NuiText("  ", "Comment"))
		line:append(NuiText(action.key, "Comment"))

		local item = Menu.item(line, { cmd = action.cmd })
		table.insert(lines, item)
	end

	local menu = Menu({
		position = "50%",
		size = {
			width = "25%",
			height = "40%",
		},
		border = {
			style = "single",
			text = {
				top = "[Command Palette]",
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
			focus_next = { "j", "<Down>", "<Space>" },
			focus_prev = { "k", "<Up>", "<S-Space>" },
			close = { "<Esc>", "<C-c>", "q" },
			submit = { "<CR>" },
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

vim.api.nvim_create_user_command("CommandPallete", create_menu, {})

local M = {}

M.register_keymap = register_keymap

return M

-- vim.keymap.set("n", "<leader><leader>", create_menu, { desc = "Command Pallete", silent = true })
-- vim.keymap.set("v", "<leader><leader>", create_menu, { desc = "Command Pallete", silent = true })
