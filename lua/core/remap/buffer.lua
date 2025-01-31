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


-- Switch to last buffer

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

vim.keymap.set("n", "<Tab>", switch_to_last_buffer, { desc = "Switch to Last Buffer", noremap = true, silent = true })
