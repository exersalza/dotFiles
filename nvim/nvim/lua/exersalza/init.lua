require("exersalza.lazy")
require("exersalza.mappings")
require("exersalza.set")


require("lualine").setup()
require('telescope').load_extension("fzf")

vim.cmd[[set rnu shiftwidth=4 tabstop=4 expandtab clipboard+=unnamedplus shortmess+=I]]
vim.cmd[[colorscheme tokyodark]]
