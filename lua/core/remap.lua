vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project View" })

-- Tree Toggle
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeFindFileToggle, { desc = "Tree Toggle" })
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
vim.keymap.set("n", "<leader>gs", ":!git status<CR>", { desc = "Git Status" })
-- Git Add
vim.keymap.set("n", "<leader>ga", vim.cmd.Gadd, { desc = "Git Add" })
-- Git Commit
vim.keymap.set("n", "<leader>gc", vim.cmd.Gcommit, { desc = "Git Commit" })
-- Git Push
vim.keymap.set("n", "<leader>gp", vim.cmd.Gpush, { desc = "Git Push" })



-- Terminal Keymaps
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>jv", ":VimuxOpenRunner<CR>", { desc = "Open Vimux Pane" })
vim.keymap.set("n", "<leader>jr", ":VimuxPromptCommand<CR>", { desc = "Run Command" })
vim.keymap.set("n", "<leader>jb", ":VimuxRunCommand \"bun dev\" <CR>", { desc = "Bun Dev" })
vim.keymap.set("n", "<leader>jh", ":VimuxRunCommand \"python3 -m http.server 5500\" <CR>", { desc = "HTTP Server" })
vim.keymap.set("n", "<leader>jd", ":VimuxRunCommand \"docker compose up --build\" <CR>", { desc = "Docker Compose Up" })



-- Bufferline Keymaps
--------------------------------------------------------------------------------

-- ESC Fix
vim.keymap.set("n", "<ESC>", "<NOP>", { noremap = true })

vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Buffer Pick" })
vim.keymap.set("n", "<leader>bd", ":BufferLineCloseOthers<CR>", { desc = "Buffer Close Others" })
vim.keymap.set("n", "<leader>bx", ":BufferLinePickClose<CR>", { desc = "Buffer Close and Pick" })
vim.keymap.set("n", "<C-]>", ":BufferLineCycleNext<CR>", { desc = "Buffer Cycle Next" })
vim.keymap.set("n", "<C-[>", ":BufferLineCyclePrev<CR>", { desc = "Buffer Cycle Prev" })
--vim.keymap.set("n", "<C-]>", ":bnext<CR>", {desc="Buffer Next"})
--vim.keymap.set("n", "<C-[>", ":bprev<CR>", {desc="Buffer Prev"})



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

-- Map CTRL+Tab to call the function
vim.keymap.set("n", "<leader>r", switch_to_last_buffer, { desc = "Switch to Last Buffer", noremap = true, silent = true })


local function show_signature_help()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.lsp.buf.signature_help()
    vim.api.nvim_win_set_cursor(0, cursor_pos) -- Restore cursor position
end

-- Autocommand to show signature help only after specific characters
vim.api.nvim_create_autocmd("TextChangedI", {
    pattern = "*",
    callback = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        local char = line:sub(col, col)

        -- Trigger signature help only if the last character is '(' or ','
        if char == "(" or char == "," then
            show_signature_help()
        end
    end,
    desc = "Show signature help only on specific characters",
})
