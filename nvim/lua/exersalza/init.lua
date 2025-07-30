require("exersalza.lazy")
require("exersalza.mappings")
require("exersalza.set")
require("exersalza.autocmds")


require("lualine").setup({})
require("nvim-highlight-colors").setup({})
require('telescope').load_extension("fzf")

vim.cmd[[set rnu shiftwidth=4 tabstop=4 expandtab clipboard+=unnamedplus shortmess+=I hlsearch incsearch smartcase]]
vim.cmd[[colorscheme tokyodark]]
