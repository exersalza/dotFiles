return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                rust = { "rustfmt", lsp_fallback = "fallback"},
                lua = { "stylua" },
                go = { "gofmt" },
                svelte = { "prettier" },
                typescript = { "prettierd", "prettier" },
                typescriptreact = { "prettierd", "prettier" },
            }
        })
    end
}

