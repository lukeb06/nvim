vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View", silent = true })

vim.keymap.set("i", "jk", "<Esc>")

-- Tree Toggle
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle", silent = true })
vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle", silent = true })

-- Select All
vim.keymap.set("n", "<leader>sa", "gg_vGg_", { desc = "Select All", silent = true })
-- Yank All
vim.keymap.set("n", "<leader>ya", "magg_vGg_y`a", { desc = "Yank All", silent = true })
-- Format All
vim.keymap.set("n", "<leader>fa", "magg=G`a", { desc = "Format All", silent = true })
-- Clipboard All
vim.keymap.set("n", "<leader>ca", "magg_vGg_\"+y`a", { desc = "Copy All", silent = true })
-- Format Block
vim.keymap.set("n", "<leader>fb", "ma?{<CR>v%=`a", { desc = "Format Block", silent = true })

--------------------------------------------------------------------------------
-- Git Keymaps
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>gs", vim.cmd.Gstatus, { desc = "Git Status", silent = true })
vim.keymap.set("n", "<leader>gp", vim.cmd.Gpush, { desc = "Git Push", silent = true })
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>", { desc = "Git Blame", silent = true })
vim.keymap.set("n", "<leader>gw", vim.cmd.Gweb, { desc = "Git Web", silent = true })
vim.keymap.set("n", "<leader>gr", vim.cmd.Prc, { desc = "Git Pull Request", silent = true })



-- Terminal Keymaps
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>jv", ":VimuxOpenRunner<CR>", { desc = "Open Vimux Pane", silent = true })
vim.keymap.set("n", "<leader>jr", ":VimuxPromptCommand<CR>", { desc = "Run Command", silent = true })
vim.keymap.set("n", "<leader>jb", ":VimuxRunCommand \"bun dev\" <CR>", { desc = "Bun Dev", silent = true })
vim.keymap.set("n", "<leader>jj", ":VimuxTogglePane<CR>", { desc = "Toggle Vimux Pane", silent = true })
vim.keymap.set("n", "<leader>jh", function()
    vim.cmd(":VimuxRunCommand \"python3 -m http.server 5500\"")
    vim.cmd(":!open http://localhost:5500")
end, { desc = "HTTP Server", silent = true })
vim.keymap.set("n", "<leader>jd", ":VimuxRunCommand \"docker compose up --build\" <CR>",
    { desc = "Docker Compose Up", silent = true })
vim.keymap.set("n", "<leader>jc", function()
    vim.cmd(":VimuxRunCommand \"vimc\"")
    vim.cmd(":VimuxZoomRunner")
end, { desc = "Edit nvim config", silent = true })

vim.keymap.set("n", "<leader>jx", ":VimuxCloseRunner<CR>", { desc = "Close Vimux Pane", silent = true })


-- ESC Fix
vim.keymap.set("n", "<ESC>", "<NOP>", { noremap = true })


-- Diagnostics
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostics Float", silent = true })


vim.keymap.set("n", "<leader>q", ":wqa<CR>", { desc = "Save and Quit", silent = true });



vim.keymap.set("v", "r", '"vy:lua require("dbee").execute(vim.fn.getreg("v"))<CR>', { desc = "Run SQL", silent = true })


vim.keymap.set("n", "L", "15zl", { desc = "Scroll right", silent = true })
vim.keymap.set("n", "H", "15zh", { desc = "Scroll left", silent = true })





local dimmed = false
vim.api.nvim_create_user_command("Twilight", function()
    if dimmed then
        require('snacks').dim.disable()
    else
        require('snacks').dim.enable()
    end
    dimmed = not dimmed
end, {
    nargs = 0,
    desc = "Add all files to git",
})


local last_bufnr = nil

-- Update the last buffer whenever switching away from the current buffer
vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
        local bufnr = vim.fn.bufnr("%")
        local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
        if buftype ~= "nofile" then
            last_bufnr = bufnr
        end
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
