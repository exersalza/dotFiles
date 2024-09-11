require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>fj", ":CellularAutomaton make_it_rain<CR>", { desc = "make it rain" })
map("n", "<leader>ut", ":UndotreeToggle<CR>:UndotreeFocus<CR>", { desc = "toggle undo tree" })
map("n", "<C-h>", ":TmuxNavigateLeft<CR>")
map("n", "<C-j>", ":TmuxNavigateDown<CR>")
map("n", "<C-k>", ":TmuxNavigateUp<CR>")
map("n", "<C-l>", ":TmuxNavigateRight<CR>")
map("n", "ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "show code actions" })
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { desc = "go to definition" })
map("n", "<leader>ra", ":lua vim.lsp.buf.rename()<CR>", { desc = "rename" })
map("n", "<Tab>", "")
map("n", "<leader>n", "")


-- Move lines with alt <direction>
map("n", "<A-j>", ":m +1<CR>")
map("n", "<A-k>", ":m -2<CR>")
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- splits
map("n", "<leader>sn", ":split<CR>", { desc = "Creates a horizontal split" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Creates a vertical split" })
map("n", "<C-M-j>", ":resize -5<CR>")
map("n", "<C-M-k>", ":resize +5<CR>")
map("n", "<C-M-l>", ":vertical resize -5<CR>")
map("n", "<C-M-h>", ":vertical resize +5<CR>")

-- vim.keymap.set("n", "<C-h>", function()
--   if vim.fn.winnr() == vim.fn.winnr('h') then
--     vim.cmd("vertical resize -2")
--   end
-- end, { silent = true })
--
-- vim.keymap.set("n", "<C-j>", function() 
--   if vim.fn.winnr() == vim.fn.winnr('j') then
--     vim.cmd("resize +2")
--   end
-- end, { silent = true })
--
-- vim.keymap.set("n", "<C-k>", function()
--   if vim.fn.winnr() == vim.fn.winnr('k') then
--     vim.cmd("resize -2")
--   end
-- end, { silent = true })
--
-- vim.keymap.set("n", "<C-l>", function()
--   if vim.fn.winnr() == vim.fn.winnr('l') then
--     vim.cmd("vertical resize +2") 
--   end
-- end, { silent = true })

-- tests
--
local nt = require("neotest")

map("n", "<leader>no", function()
  nt.summary.open()
end, { desc = "Opens the Summary panel from Neotest" })

map("n", "<leader>nc", function()
  nt.summary.close()
end, { desc = "Closes the Summary panel from Neotest" })

map("n", "<leader>nr", function()
  nt.run.run()
end, { desc = "Runs test from current Project" })

map("n", "<leader>nf", function()
  nt.run.run(vim.fn.expand("%"))
end, { desc = "Runs test from current File" })

map("n", "<leader>na", function()
  nt.run.attach()
end, { desc = "Attaches to nearest test" })

map("n", "<leader>nt", function()
  nt.output_panel.toggle()
end, { desc = "Enter output" })
