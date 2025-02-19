require("utils.vimux")
require("utils.vim")

local term_maps = {
	{ "v", ":VimuxOpenRunner<CR>", "Open Vimux Pane" },
	{ "r", ":VimuxPromptCommand<CR>", "Run Command" },
	{ "j", ":VimuxTogglePane<CR>", "Toggle Vimux Pane" },
	{ "x", ":VimuxCloseRunner<CR>", "Close Vimux Pane" },

	-- Bun
	{
		"bd",
		function()
			vimux_run_command("bun dev")
		end,
		"Bun Dev",
	},
	{
		"bb",
		function()
			vimux_run_command("bun run build")
		end,
		"Bun Build",
	},
	{
		"bs",
		function()
			vimux_run_command("bun run start")
		end,
		"Bun Start",
	},
	{
		"bi",
		function()
			vimux_run_command("bun install")
		end,
		"Bun Install",
	},

	-- Node
	{
		"ns",
		function()
			vimux_run_command("npm start")
		end,
		"Node Start",
	},
	{
		"nb",
		function()
			vimux_run_command("npm build")
		end,
		"Node Build",
	},
	{
		"ni",
		function()
			vimux_run_command("npm install")
		end,
		"Node Install",
	},

	-- Docker
	{
		"dc",
		function()
			vimux_run_command("docker compose up --build")
		end,
		"Docker Compose",
	},

	{
		"h",
		function()
			vimux_run_command("python3 -m http.server 5500")
			vim.cmd(":!open http://localhost:5500")
		end,
		"HTTP Server",
	},
}

for _, map in ipairs(term_maps) do
	local mode = "n"
	local key = "<leader>j" .. map[1]
	local runner = map[2]
	local desc = map[3]

	register_keymap(mode, key, runner, desc)
end
