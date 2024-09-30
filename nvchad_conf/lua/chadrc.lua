-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyodark",
  tabufline = {
    enabled= false
  },
}


vim.cmd("set scrolloff=5 rnu")
vim.opt.langmenu = "en_US"
vim.cmd("language en_US")

return M
