-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyodark",
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    enabled = false
  },
  statusline = {
    separator_style = "block",
  },
  telescope ={
  }
}

vim.cmd("set scrolloff=5 rnu")
vim.opt.langmenu = "en_US"
vim.cmd("language en_US")

return M
