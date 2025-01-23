vim.keymap.set('n', '<leader>?', function()
    require("which-key").show({ global = true })
end, { desc = "Buffer Local Keymaps (which-key)" })


local wk = require("which-key")
wk.add({
    { "<leader>f", group = "Format" },   -- group
    { "<leader>g", group = "Git" },      -- group
    { "<leader>p", group = "Project" },  -- group
    { "<leader>t", group = "Tree" },     -- group
    { "<leader>c", group = "Copy" },     -- group
    { "<leader>y", group = "Yank" },     -- group
    { "<leader>f", group = "Format" },   -- group
    { "<leader>s", group = "Select" },   -- group
    { "<leader>b", group = "Buffer" },   -- group
    { "<leader>j", group = "Terminal" }, -- group
    { "<leader>h", group = "Hex" },      -- group
})
