-- Register new vim command: gadd
vim.api.nvim_create_user_command("Gstatus", function(opts)
    -- Run 'git add .' in the current directory bash
    vim.cmd(":VimuxRunCommand \"git status\"")
end, {
    nargs = 0,
    desc = "Add all files to git",
})
-- Register new vim command: gpush
vim.api.nvim_create_user_command("Gpush", function(opts)
    -- Run 'git push' in the current directory bash
    vim.cmd(":VimuxRunCommand \"git add . && git status && git commit -m 'Update' && git push\"")
end, {
    nargs = 0,
    desc = "Push all files to git",
})

vim.api.nvim_create_user_command("Prc", function(opts)
    vim.cmd(":VimuxRunCommand \"prc\"")
end, {
    nargs = 0,
    desc = "Create pull request"
})
