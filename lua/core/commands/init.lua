require("core.commands.git")

-- I like the twilight.nvim plugin, but the functionality of dim (from snacks.nvim) is much much better
local dimmed = false
vim.api.nvim_create_user_command("Twilight", function()
	if dimmed then
		require("snacks").dim.disable()
	else
		require("snacks").dim.enable()
	end
	dimmed = not dimmed
end, {
	nargs = 0,
	desc = "Toggle Twilight",
})

-- :Q to quit because I accidentally do capital sometimes
vim.api.nvim_create_user_command("Q", function()
	vim.cmd(":q")
end, {
	nargs = 0,
	desc = "Quit",
})
