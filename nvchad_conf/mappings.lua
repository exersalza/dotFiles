require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fj", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "make it rain" })
map("n", "<leader>ut", "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", { desc = "toggle undo tree" })
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
map("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "show code actions" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "go to definition" })
map("n", "<leader>ra", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "rename" })

map({ "v", "n" }, "<A-j>", "<cmd>m +1<CR>")
map({ "v", "n" }, "<A-k>", "<cmd>m -2<CR>")
