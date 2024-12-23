vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View" })

vim.keymap.set("i", "jk", "<Esc>")

-- Tree Toggle
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle" })
vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle" })
-- Tree Focus
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFindFile, { desc = "Tree Focus" })

-- Select All
vim.keymap.set("n", "<leader>sa", "gg_vGg_", { desc = "Select All" })
-- Yank All
vim.keymap.set("n", "<leader>ya", "magg_vGg_y`a", { desc = "Yank All" })
-- Format All
vim.keymap.set("n", "<leader>fa", "magg=G`a", { desc = "Format All" })
-- Clipboard All
vim.keymap.set("n", "<leader>ca", "magg_vGg_\"+y`a", { desc = "Copy All" })
-- Format Block
vim.keymap.set("n", "<leader>fb", "ma?{<CR>v%=`a", { desc = "Format Block" })

--------------------------------------------------------------------------------
-- Git Keymaps
--------------------------------------------------------------------------------

-- Git Status
vim.keymap.set("n", "<leader>gs", vim.cmd.Gstatus, { desc = "Git Status" })
-- Git Push
vim.keymap.set("n", "<leader>gp", vim.cmd.Gpush, { desc = "Git Push" })
-- Git Blame
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>", { desc = "Git Blame" })



-- Terminal Keymaps
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>jv", ":VimuxOpenRunner<CR>", { desc = "Open Vimux Pane" })
vim.keymap.set("n", "<leader>jr", ":VimuxPromptCommand<CR>", { desc = "Run Command" })
vim.keymap.set("n", "<leader>jb", ":VimuxRunCommand \"bun dev\" <CR>", { desc = "Bun Dev" })
vim.keymap.set("n", "<leader>jh", ":VimuxRunCommand \"python3 -m http.server 5500\" <CR>", { desc = "HTTP Server" })
vim.keymap.set("n", "<leader>jd", ":VimuxRunCommand \"docker compose up --build\" <CR>", { desc = "Docker Compose Up" })
vim.keymap.set("n", "<leader>jc", function()
    vim.cmd(":VimuxRunCommand \"vimc\"")
    vim.cmd(":VimuxZoomRunner")
end, { desc = "Edit nvim config" })

vim.keymap.set("n", "<leader>jx", ":VimuxCloseRunner<CR>", { desc = "Close Vimux Pane" })


-- ESC Fix
vim.keymap.set("n", "<ESC>", "<NOP>", { noremap = true })


-- Diagnostics
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostics Float" })


vim.keymap.set("n", "<leader>q", ":wqa<CR>", { desc = "Save and Quit" });




local last_bufnr = nil

-- Update the last buffer whenever switching away from the current buffer
vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
        last_bufnr = vim.fn.bufnr("%")
    end,
})


-- Function to switch to the last visited buffer
local function switch_to_last_buffer()
    if last_bufnr and vim.api.nvim_buf_is_valid(last_bufnr) then
        vim.cmd("buffer " .. last_bufnr)
    else
        print("No previous buffer to switch to.")
    end
end

-- Map <leader>r to call the function
vim.keymap.set("n", "<leader>r", switch_to_last_buffer, { desc = "Switch to Last Buffer", noremap = true, silent = true })


-- vim.cmd(":VimuxOpenRunner")
-- vim.cmd(":VimuxTogglePane")
