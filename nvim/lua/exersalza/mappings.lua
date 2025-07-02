local map = vim.keymap.set

--vim.keymap.del("n", "<S-Tab>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })
map("n", "<S-j>", "5gj", { silent = true })
-- map("n", "<S-k>", "5gk", { silent = true })

map("n", "<leader>fj", ":CellularAutomaton make_it_rain<CR>", { desc = "make it rain" })
-- map("n", "<leader>ut", ":UndotreeToggle<CR>:UndotreeFocus<CR>", { desc = "toggle undo tree" })
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
map("n", "ca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "show code actions" })
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { desc = "go to definition" })
map("n", "<leader>ra", ":lua vim.lsp.buf.rename()<CR>", { desc = "rename" })
map("n", "<leader>lr", ":Telescope lsp_references<CR>", { desc = "show references below cursor"})
map("n", "<Tab>", "")
map("n", "gb", "''")
map("n", "<leader>n", "")
map("n", "<leader>fc", ":Telescope resume<CR>", { desc = "resumes last telescope window" })

map("n", "<leader>gc", ":GitMessenger<CR>", {desc = "opens the commit responsible for the line under the cursor"})


-- Move lines with alt <direction>
map("n", "<A-j>", ":m +1<CR>")
map("n", "<A-k>", ":m -2<CR>")
-- move lines in visual mode, works with multiline select
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- map("n", "<A-d>", ":m +5<CR>")
-- map("n", "<A-u>", ":m -6<CR>")
-- move lines in visual mode, works with multiline select
map("v", "<A-d>", ":m '>+5<CR>gv=gv")
map("v", "<A-u>", ":m '<-6<CR>gv=gv")

-- splits
map("n", "<leader>sn", ":split<CR>", { desc = "Creates a horizontal split" })
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Creates a vertical split" })
-- map("n", "<C-M-j>", ":resize -5<CR>")
-- map("n", "<C-M-k>", ":resize +5<CR>")
-- map("n", "<C-M-l>", ":vertical resize -5<CR>")
-- map("n", "<C-M-h>", ":vertical resize +5<CR>")

local ss = require("smart-splits")

map('n', '<C-M-h>', ss.resize_left)
map('n', '<C-M-j>', ss.resize_down)
map('n', '<C-M-k>', ss.resize_up)
map('n', '<C-M-l>', ss.resize_right)
-- moving between splits
-- map('n', '<C-h>', ss.move_cursor_left)
-- map('n', '<C-j>', ss.move_cursor_down)
-- map('n', '<C-k>', ss.move_cursor_up)
-- map('n', '<C-l>', ss.move_cursor_right)
-- map('n', '<C-\\>', ss.move_cursor_previous)
-- swapping buffers between windows
map('n', '<leader><leader>h', ss.swap_buf_left)
map('n', '<leader><leader>j', ss.swap_buf_down)
map('n', '<leader><leader>k', ss.swap_buf_up)
map('n', '<leader><leader>l', ss.swap_buf_right)

-- map("n", "<C-h>", function()
--   if vim.fn.winnr() == vim.fn.winnr('h') then
--     vim.cmd("vertical resize -2")
--   end
-- end, { silent = true })
--
-- map("n", "<C-j>", function()
--   if vim.fn.winnr() == vim.fn.winnr('j') then
--     vim.cmd("resize +2")
--   end
-- end, { silent = true })
--
-- map("n", "<C-k>", function()
--   if vim.fn.winnr() == vim.fn.winnr('k') then
--     vim.cmd("resize -2")
--   end
-- end, { silent = true })
--
-- map("n", "<C-l>", function()
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


-- codedocs
map( "n", "<leader>k", require('codedocs').insert_docs, { desc = "Inserts a docstring into the buffer" } )

-- map("n", "<leader>fF" , function() require("telescope.builtin").find_files({hidden = true}) end, {desc = "open file picker with hidden files"})
-- map("n", "<leader>ff" , function() require("telescope.builtin").find_files({hidden = false, }) end, {desc = "open file picker without hidden files"})

map("n", "<leader>tp", require("telescope.builtin").oldfiles, {desc = "open files opened before"})
map("n", "<leader>tt", require("telescope.builtin").treesitter, {desc = "find all symbols in current file"})


-- twitch mappings
map("n", "<leader>tf", ":twitch event trigger follower --transport=websocket<CR>", {desc = "[twitch cli] trigger follower event"})
map("n", "<leader>ts", ":twitch event trigger subscribe --transport=websocket<CR>", {desc = "[twitch cli] trigger sub event"})
map("n", "<leader>tb", ":twitch event trigger cheer --transport=websocket<CR>", {desc = "[twitch cli] trigger bits event"})

map("n", "<leader>tr", ":twitch event websocket reconnect --transport=websocket<CR>", {desc = "[twitch cli] trigger sub event"})

-- rust mappings
map("n", "<leader>cc", ":!cargo run<CR>", {desc = "build and run current rust project"})
map("n", "<leader>cb", ":!cargo build<CR>", {desc = "build current rust project"})
map("n", "<leader>cr", ":!cargo build -r<CR>", {desc = "build current rust project for release"})
map("n", "<leader>ct", ":!cargo test<CR>", {desc = "build and test current rust project"})


-- Smadge
-- map("n", "q", function() end)
map("n", "Q", "@q");



-- Scrolling WICKED
map("n", "<A-u>", "5k")
map("n", "<A-d>", "5j")
map("v", "<A-u>", "5k")
map("v", "<A-d>", "5j")
