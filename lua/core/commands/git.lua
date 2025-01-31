require("utils.vimux")

vim.api.nvim_create_user_command("Gstatus", function()
    vimux_run_command("git status")
end, {
    nargs = 0,
    desc = "Add all files to git",
})
vim.api.nvim_create_user_command("Gpush", function()
    vimux_run_command("gpush")
end, {
    nargs = 0,
    desc = "Push all files to git",
})
vim.api.nvim_create_user_command("Prc", function()
    vimux_run_command("prc")
end, {
    nargs = 0,
    desc = "Create pull request"
})
vim.api.nvim_create_user_command("Gweb", function()
    vim.cmd(":!gh repo view --web")
end, {
    nargs = 0,
    desc = "Open git web"
})
