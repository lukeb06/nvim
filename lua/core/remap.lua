vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View", silent = true })

vim.keymap.set("i", "jk", "<Esc>")

-- Tree Toggle
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle", silent = true })
vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle", silent = true })

-- Select All
vim.keymap.set("n", "<leader>bs", "gg_vGg_", { desc = "Buffer Select", silent = true })
-- Yank All
vim.keymap.set("n", "<leader>by", "magg_vGg_y`a", { desc = "Buffer Yank", silent = true })
-- Clipboard All
vim.keymap.set("n", "<leader>bc", "magg_vGg_\"+y`a", { desc = "Buffer Copy", silent = true })
-- Delete All
vim.keymap.set("n", "<leader>bd", "gg_vGg_d", { desc = "Buffer Delete", silent = true })


-- Format All
vim.keymap.set("n", "<leader>bfa", "magg=G`a", { desc = "Buffer Format", silent = true })

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

local function run_vimux_command(cmd)
    vim.cmd(":VimuxRunCommand \"" .. cmd .. "\"")
end

term_maps = {
    { "v",  ":VimuxOpenRunner<CR>",                                        "Open Vimux Pane" },
    { "r",  ":VimuxPromptCommand<CR>",                                     "Run Command" },
    { "bd", function() run_vimux_command("bun dev") end,                   "Bun Dev" },
    { "j",  ":VimuxTogglePane<CR>",                                        "Toggle Vimux Pane" },
    { "dc", function() run_vimux_command("docker compose up --build") end, "Docker Compose Up" },
    { "x",  ":VimuxCloseRunner<CR>",                                       "Close Vimux Pane" },
    { "h", function()
        run_vimux_command("python3 -m http.server 5500")
        vim.cmd(":!open http://localhost:5500")
    end, "HTTP Server" },
}

for _, map in ipairs(term_maps) do
    local mode = 'n'
    local key = '<leader>j' .. map[1]
    local runner = map[2]
    local desc = map[3]

    vim.keymap.set(mode, key, runner, { desc = desc, silent = true })
end

--------------------------------------------------------------------------------

-- ESC Fix
vim.keymap.set("n", "<ESC>", "<NOP>", { noremap = true })


-- Diagnostics
vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostics Float", silent = true })


-- Save and Quit all buffers
vim.keymap.set("n", "<leader>q", ":wqa<CR>", { desc = "Save and Quit", silent = true });


-- Run Selected SQL Statement
vim.keymap.set("v", "r", '"vy:lua require("dbee").execute(vim.fn.getreg("v"))<CR>', { desc = "Run SQL", silent = true })


-- Horizontal Scrolling ( kitty / ghostty does not have scroll direction locking. ( i have locked horizontal scrolling in nvim... ) )
vim.keymap.set("n", "L", "15zl", { desc = "Scroll right", silent = true })
vim.keymap.set("n", "H", "15zh", { desc = "Scroll left", silent = true })



-- Toggle Wrap
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", { desc = "Toggle Wrap", silent = true })




local last_bufnr = nil
-- local buffer_stack = {}
-- local buffer_pos = 0

-- Update the last buffer whenever switching away from the current buffer
vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
        local bufnr = vim.fn.bufnr("%")
        local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
        if buftype ~= "nofile" then
            last_bufnr = bufnr
            -- local prev_buf_len = #buffer_stack
            -- for i, v in ipairs(buffer_stack) do
            --     if v == bufnr then
            --         table.remove(buffer_stack, i)
            --     end
            -- end
            -- table.insert(buffer_stack, bufnr)
            -- if prev_buf_len < #buffer_stack then
            --     buffer_pos = #buffer_stack
            -- end
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

-- local function cycle_buffers()
--     if buffer_pos > 1 then
--         buffer_pos = buffer_pos - 1
--         vim.cmd("buffer " .. buffer_stack[buffer_pos])
--     else
--         buffer_pos = #buffer_stack
--         vim.cmd("buffer " .. buffer_stack[buffer_pos])
--     end
-- end

vim.keymap.set("n", "<Tab>", switch_to_last_buffer, { desc = "Switch to Last Buffer", noremap = true, silent = true })
