local M = {}

M.general = {
  n = {
    ["<leader>fj"] = {"<cmd>CellularAutomaton make_it_rain<CR>"},
    ["<leader>ut"] = {"<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>"},
    ["<A-j>"] = {"<cmd>m +1<CR>"},
    ["<A-k>"] = {"<cmd>m -2<CR>"},
  },
  v = {
    ["<A-j>"] = {"<cmd>m +1<CR>"},
    ["<A-k>"] = {"<cmd>m -2<CR>"},
  }
}


return M
