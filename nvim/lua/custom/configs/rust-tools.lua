local on_attach = require("plugins.configs.lspconfig").on_attach
local capas = require("plugins.configs.lspconfig").capabilities

local options = {
  server = {
    capabilities = capas,
    on_attach = on_attach
  }
}

return options
