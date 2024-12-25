return {
    'preservim/vimux',
    config = function()
        vim.g.VimuxUseNearest = 0
        vim.g.VimuxCloseOnExit = 1
    end
}
