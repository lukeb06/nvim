-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/lukebarrier/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?.lua;/Users/lukebarrier/.cache/nvim/packer_hererocks/2.1.1727870382/share/lua/5.1/?/init.lua;/Users/lukebarrier/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?.lua;/Users/lukebarrier/.cache/nvim/packer_hererocks/2.1.1727870382/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/lukebarrier/.cache/nvim/packer_hererocks/2.1.1727870382/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["abyss.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/abyss.nvim",
    url = "https://github.com/barrientosvctor/abyss.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\5\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\26\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3=\3\27\2B\0\2\1K\0\1\0\21formatters_by_ft\1\0\1\21formatters_by_ft\0\vpython\1\2\0\0\truff\vliquid\1\2\0\0\14prettierd\20javascriptreact\1\2\0\0\14prettierd\20typescriptreact\1\2\0\0\14prettierd\tyaml\1\2\0\0\14prettierd\tjson\1\2\0\0\14prettierd\15typescript\1\2\0\0\14prettierd\15javascript\1\2\0\0\14prettierd\bcss\1\2\0\0\14prettierd\thtml\1\2\0\0\14prettierd\rmarkdown\1\0\v\vliquid\0\vpython\0\tjson\0\rmarkdown\0\thtml\0\bcss\0\15javascript\0\15typescript\0\tyaml\0\20typescriptreact\0\20javascriptreact\0\1\2\0\0\14prettierd\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/theprimeagen/harpoon"
  },
  ["lsp-format.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["resession.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/resession.nvim",
    url = "https://github.com/stevearc/resession.nvim"
  },
  ["supermaven-nvim"] = {
    config = { "\27LJ\2\n\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0�\2\1\0\5\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0033\4\b\0=\4\t\3>\3\1\2B\0\2\1K\0\1\0\14condition\0\ncolor\1\0\2\ncterm\3�\1\21suggestion_color\f#ffffff\fkeymaps\1\0\6\30disable_inline_completion\1\fkeymaps\0\ncolor\0\14condition\0\20disable_keymaps\1\14log_level\tinfo\1\0\3\22accept_suggestion\n<Tab>\21clear_suggestion\n<C-]>\16accept_word\n<C-j>\nsetup\20supermaven-nvim\frequire\0" },
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/supermaven-nvim",
    url = "https://github.com/supermaven-inc/supermaven-nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  vimux = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/preservim/vimux"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/lukebarrier/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: supermaven-nvim
time([[Config for supermaven-nvim]], true)
try_loadstring("\27LJ\2\n\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0�\2\1\0\5\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0033\4\b\0=\4\t\3>\3\1\2B\0\2\1K\0\1\0\14condition\0\ncolor\1\0\2\ncterm\3�\1\21suggestion_color\f#ffffff\fkeymaps\1\0\6\30disable_inline_completion\1\fkeymaps\0\ncolor\0\14condition\0\20disable_keymaps\1\14log_level\tinfo\1\0\3\22accept_suggestion\n<Tab>\21clear_suggestion\n<C-]>\16accept_word\n<C-j>\nsetup\20supermaven-nvim\frequire\0", "config", "supermaven-nvim")
time([[Config for supermaven-nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\5\0\28\0\0316\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\26\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\3=\3\27\2B\0\2\1K\0\1\0\21formatters_by_ft\1\0\1\21formatters_by_ft\0\vpython\1\2\0\0\truff\vliquid\1\2\0\0\14prettierd\20javascriptreact\1\2\0\0\14prettierd\20typescriptreact\1\2\0\0\14prettierd\tyaml\1\2\0\0\14prettierd\tjson\1\2\0\0\14prettierd\15typescript\1\2\0\0\14prettierd\15javascript\1\2\0\0\14prettierd\bcss\1\2\0\0\14prettierd\thtml\1\2\0\0\14prettierd\rmarkdown\1\0\v\vliquid\0\vpython\0\tjson\0\rmarkdown\0\thtml\0\bcss\0\15javascript\0\15typescript\0\tyaml\0\20typescriptreact\0\20javascriptreact\0\1\2\0\0\14prettierd\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
