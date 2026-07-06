return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.disabled_filetypes = opts.options.disabled_filetypes or {}
      opts.options.disabled_filetypes.statusline = opts.options.disabled_filetypes.statusline or {}
      vim.list_extend(opts.options.disabled_filetypes.statusline, {
        "TelescopePrompt",
        "TelescopeResults",
      })
    end,
  },
}
