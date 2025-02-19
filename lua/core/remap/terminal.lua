require("utils.vimux")
require("utils.vim")

local term_maps = {
	{ "v", ":VimuxOpenRunner<CR>", "Vimux Open" },
	{ "r", ":VimuxPromptCommand<CR>", "Vimux Prompt" },
	{ "j", ":VimuxTogglePane<CR>", "Vimux Toggle" },
	{ "x", ":VimuxCloseRunner<CR>", "Vimux Close" },

	-- Bun
	{
		"bd",
		function()
			vimux_run_command("bun dev")
		end,
		"Run bun dev",
	},
	{
		"bb",
		function()
			vimux_run_command("bun run build")
		end,
		"Run bun build",
	},
	{
		"bs",
		function()
			vimux_run_command("bun run start")
		end,
		"Run bun start",
	},
	{
		"bi",
		function()
			vimux_run_command("bun install")
		end,
		"Run bun install",
	},

	-- Node
	{
		"ns",
		function()
			vimux_run_command("npm start")
		end,
		"Run npm start",
	},
	{
		"nb",
		function()
			vimux_run_command("npm build")
		end,
		"Run npm build",
	},
	{
		"ni",
		function()
			vimux_run_command("npm install")
		end,
		"Run npm install",
	},

	-- Docker
	{
		"dc",
		function()
			vimux_run_command("docker compose up --build")
		end,
		"Run docker compose",
	},

	{
		"h",
		function()
			vimux_run_command("python3 -m http.server 5500")
			vim.cmd(":!open http://localhost:5500")
		end,
		"Start HTTP Server",
	},
}

for _, map in ipairs(term_maps) do
	local mode = "n"
	local key = "<leader>j" .. map[1]
	local runner = map[2]
	local desc = map[3]

	register_keymap(mode, key, runner, desc)
end
