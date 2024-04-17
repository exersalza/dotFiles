---@type ChadrcConfig
local M = {}

M.ui = { theme = 'bearded-arc' }
M.plugins = 'custom.plugins'
M.mappings = require('custom.mappings')

vim.cmd("set scrolloff=5")
return M
