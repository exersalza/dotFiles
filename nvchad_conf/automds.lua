local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  pattern: "term://*",
  command: "startinsert"
})
