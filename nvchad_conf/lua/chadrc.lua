-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "oxocarbon",
  tabufline = {
    enabled= false
  },
}



vim.cmd("set scrolloff=5 rnu")

return M
