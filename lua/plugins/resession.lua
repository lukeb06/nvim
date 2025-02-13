return {
	"stevearc/resession.nvim",
	config = function()
		local resession = require("resession")
		resession.setup({})

		local get_session_name = function()
			local name = vim.fn.getcwd()
			return name
		end

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				-- Only load the session if nvim was started with no args
				if vim.fn.argc(-1) == 0 then
					-- Save these to a different directory, so our manual sessions don't get polluted
					resession.load(get_session_name(), { dir = "dirsession", silence_errors = true })
				end
			end,
			nested = true,
		})
		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				if vim.fn.argc(-1) == 0 then
					resession.save(get_session_name(), { dir = "dirsession", notify = false })
				end
			end,
		})
	end,
}
