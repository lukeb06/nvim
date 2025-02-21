local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local themes = require("telescope.themes")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--trim",
			"--multiline",
		},
		mappings = {
			n = {
				["d"] = actions.delete_buffer,
			},
		},
	},
})

local dropdown_theme = themes.get_dropdown({ winblend = 5 })

local function clone(t) -- deep-copy a table
	if type(t) ~= "table" then
		return t
	end
	local meta = getmetatable(t)
	local target = {}
	for k, v in pairs(t) do
		if type(v) == "table" then
			target[k] = clone(v)
		else
			target[k] = v
		end
	end
	setmetatable(target, meta)
	return target
end

local vimtils = require("utils.vim")

local function set_keymap(key, func, desc)
	vimtils.register_keymap("n", key, func, desc)
end

set_keymap("<leader>pf", function()
	local theme = clone(dropdown_theme)
	builtin.find_files(theme)
end, "Project Find")

set_keymap("<leader>ps", function()
	local theme = clone(dropdown_theme)
	theme.layout_config.width = 0.8
	builtin.live_grep(theme)
end, "Project Search (grep)")

-- vim.keymap.set('n', '<C-p>', function()
--     local theme = clone(dropdown_theme)
--     builtin.git_files(theme)
-- end, { desc = 'Telescope git files' })

set_keymap("?", function()
	local theme = clone(dropdown_theme)
	theme.layout_config.width = 0.8
	builtin.current_buffer_fuzzy_find(theme)
end, "Telescope Search Buffer")

set_keymap("<leader>pb", function()
	local theme = clone(dropdown_theme)
	theme.sort_mru = true
	theme.sort_lastused = true
	theme.initial_mode = "normal"

	builtin.buffers(theme)
end, "Project Buffers")

set_keymap("<leader>pd", function()
	local theme = clone(dropdown_theme)
	theme.initial_mode = "normal"

	builtin.diagnostics(theme)
end, "Project Diagnostics")

set_keymap("gd", function()
	local theme = clone(dropdown_theme)
	theme.initial_mode = "normal"

	builtin.lsp_definitions(theme)
end, "Telescope Definitions")

set_keymap("gr", function()
	local theme = clone(dropdown_theme)
	theme.initial_mode = "normal"

	builtin.lsp_references(theme)
end, "Telescope References")

set_keymap("<leader>pj", function()
	local theme = clone(dropdown_theme)
	theme.sort_mru = true
	theme.sort_lastused = true
	theme.layout_config.width = 0.8
	theme.initial_mode = "normal"

	builtin.jumplist(theme)
end, "Telescope Jumplist")

set_keymap("<leader><leader>", builtin.resume, "Telescope Resume")
