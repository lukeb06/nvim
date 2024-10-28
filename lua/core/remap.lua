vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Tree Toggle
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeFindFileToggle)
-- Tree Focus
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFindFile)

-- Select All
vim.keymap.set("n", "<leader>sa", "gg_vGg_")
-- Yank All
vim.keymap.set("n", "<leader>ya", "magg_vGg_y`a")
-- Format All
vim.keymap.set("n", "<leader>fa", "magg=G`a")
-- Clipboard All
vim.keymap.set("n", "<leader>ca", "magg_vGg_\"+y`a")
-- Format Block
vim.keymap.set("n", "<leader>fb", "ma?{<CR>v%=`a")

--------------------------------------------------------------------------------
-- Git Keymaps
--------------------------------------------------------------------------------

-- Git Status
vim.keymap.set("n", "<leader>gs", ":!git status<CR>")
-- Git Add
vim.keymap.set("n", "<leader>ga", vim.cmd.Gadd)
-- Git Commit
vim.keymap.set("n", "<leader>gc", vim.cmd.Gcommit)
-- Git Push
vim.keymap.set("n", "<leader>gp", vim.cmd.Gpush)

-- Define a recursive menu structure
local keymap_menu = {
    ["p"] = { text = "Project", submenu = {
        ["pf"] = { text = "Find File", command = "<leader>pf" },
        ["ps"] = { text = "Search (grep)", command = "<leader>ps" },
        ["pv"] = { text = "View", command = "<leader>pv" },
    }},
    ["t"] = { text = "Tree", submenu = {
        ["tt"] = { text = "Toggle", command = "<leader>tt" },
        ["tf"] = { text = "Focus", command = "<leader>tf" },
    }},
    ["g"] = { text = "Git", submenu = {
        ["gs"] = { text = "Status", command = "<leader>gs" },
        ["ga"] = { text = "Add", command = "<leader>ga" },
        ["gc"] = { text = "Commit", command = "<leader>gc" },
        ["gp"] = { text = "Push", command = "<leader>gp" },
        ["gf"] = { text = "Fugitive", command = "<leader>gf" },
    }},
    ["e"] = { text = "Harpoon", command = "<leader>e" },
    ["a"] = { text = "Add to Harpoon", command = "<leader>a" },
    ["sa"] = { text = "Select All", command = "<leader>sa" },
    ["ya"] = { text = "Yank All", command = "<leader>ya" },
    ["ca"] = { text = "Copy All", command = "<leader>ca" },
    ["f"] = { text = "Format", submenu = {
        ["fa"] = { text = "All", command = "<leader>fa" },
        ["fb"] = { text = "Block", command = "<leader>fb" },
    }},
}





function GetTableLength(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

function ReplaceLeader(command)
    return vim.api.nvim_replace_termcodes(command, true, true, true)
end










-- Function to open a menu pane
function OpenMenu(menu)
    menu = menu or keymap_menu
    local width, height = 37, GetTableLength(menu) + 2
    local opts = {
        relative = 'editor',
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = 'minimal',
        border = 'rounded'
    }

    local buf = vim.api.nvim_create_buf(false, true)

    -- Make the buffer modifiable temporarily to insert text
    vim.api.nvim_buf_set_option(buf, 'modifiable', true)

    -- Populate the buffer with menu text
    local help_text = { "               Keybinds               ", "" }
    for key, item in pairs(menu) do
        table.insert(help_text, key .. ": " .. item.text)
    end
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, help_text)

    -- Set the buffer to non-modifiable to prevent accidental editing
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)

    -- Create the floating window
    local win = vim.api.nvim_open_win(buf, true, opts)

    -- Function to execute command or open submenu
    local function handle_selection(item)
        if item.submenu then
            vim.api.nvim_win_close(win, true)
            OpenMenu(item.submenu)
        elseif item.command then
            vim.api.nvim_win_close(win, true)
            local command = ReplaceLeader(item.command)
            vim.api.nvim_feedkeys(command, 'm', true)
        end
    end

    -- Map each key to its corresponding action in the menu
    for key, item in pairs(menu) do
        vim.api.nvim_buf_set_keymap(buf, 'n', key, '', {
            noremap = true,
            silent = true,
            callback = function() handle_selection(item) end
        })
    end

    -- Set 'q' to close the menu window
    vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':bd!<CR>', { noremap = true, silent = true })
end

-- Map a key to open the top-level menu
vim.api.nvim_set_keymap('n', '<leader>h', ':lua OpenMenu()<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>", function()
    print("<leader>h for help")
end)
