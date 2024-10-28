-- Register new vim command: gadd
vim.api.nvim_create_user_command("Gadd", function(opts)
    -- Run 'git add .' in the current directory bash
    vim.cmd(":!git add . && git status")
end, {
    nargs = 0,
    desc = "Add all files to git",
})
-- Register new vim command: gcommit
vim.api.nvim_create_user_command("Gcommit", function(opts)
    -- Run 'git commit -m "commit message"' in the current directory bash
    vim.cmd(":!git commit -m 'Update'")
end, {
    nargs = 0,
    desc = "Commit all files to git",
})
-- Register new vim command: gpush
vim.api.nvim_create_user_command("Gpush", function(opts)
    -- Run 'git push' in the current directory bash
    vim.cmd(":!git add . && git status && git commit -m 'Update' && git push")
end, {
    nargs = 0,
    desc = "Push all files to git",
})
