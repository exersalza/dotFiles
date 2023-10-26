local on_attach = require("plugins.configs.lspconfig").on_attach
local capas = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capas,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {

  }
})

--[[
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      }
    }
--]]
