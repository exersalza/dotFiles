---@type ChadrcConfig
local M = {}

vim.cmd("set rnu")

M.ui = { theme = 'bearded-arc' }
M.plugins = 'plugins'
M.mappings = require('mappings')

vim.cmd("set scrolloff=5")
return M
