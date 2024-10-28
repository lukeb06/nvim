vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "Project View"})

-- Tree Toggle
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeFindFileToggle, {desc = "Tree Toggle"})
-- Tree Focus
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFindFile, {desc = "Tree Focus"})

-- Select All
vim.keymap.set("n", "<leader>sa", "gg_vGg_", {desc = "Select All"})
-- Yank All
vim.keymap.set("n", "<leader>ya", "magg_vGg_y`a", {desc = "Yank All"})
-- Format All
vim.keymap.set("n", "<leader>fa", "magg=G`a", {desc = "Format All"})
-- Clipboard All
vim.keymap.set("n", "<leader>ca", "magg_vGg_\"+y`a", {desc = "Copy All"})
-- Format Block
vim.keymap.set("n", "<leader>fb", "ma?{<CR>v%=`a", {desc = "Format Block"})

--------------------------------------------------------------------------------
-- Git Keymaps
--------------------------------------------------------------------------------

-- Git Status
vim.keymap.set("n", "<leader>gs", ":!git status<CR>", {desc = "Git Status"})
-- Git Add
vim.keymap.set("n", "<leader>ga", vim.cmd.Gadd, {desc = "Git Add"})
-- Git Commit
vim.keymap.set("n", "<leader>gc", vim.cmd.Gcommit, {desc = "Git Commit"})
-- Git Push
vim.keymap.set("n", "<leader>gp", vim.cmd.Gpush, {desc = "Git Push"})


-- Docker Compose
vim.keymap.set("n", "<leader>dc", ":VimuxRunCommand \"docker compose up --build\" <CR>", {desc = "Docker Compose Up"})
