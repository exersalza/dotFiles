local root_files = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
}


local py_root_files = {
    '.git',
    'pyproject.toml',
    'req',
    'venv'
}

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
            }
        })
        local cmp = require('cmp')
        local util = require("lspconfig.util")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "basedpyright", -- Python
                "ts_ls",        -- TypeScript/JavaScript
                "clangd",       -- C/C++
                "html",         -- HTML
                "cssls",        -- CSS
                "jsonls",       -- JSON
                "bashls",       -- Bash
                "svelte",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                zls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
                ["basedpyright"] = function()
                    local lspconfig = require("lspconfig")

                    lspconfig.basedpyright.setup({
                        capabilities = capabilities,
                        root_dir = function(fname)
                            local root = util.root_pattern(
                                'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt',
                                'Pipfile', 'pyrightconfig.json', '.git', 'venv', '_root'
                            )(fname)
                            if root then
                                print("Detected LSP root:", root)
                                return root
                            else
                                local cwd = vim.fn.getcwd()
                                print("Using current working dir as root:", cwd)
                                return cwd
                            end
                        end
                    })
                end,
                ["ts_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ts_ls.setup {
                        capabilities = capabilities,
                        filetypes = { "js", "ts", "jsx", "tsx" }, -- Add svelte here
                    }
                end,
                ["html"] = function ()
                    require("lspconfig").html.setup({
                        capabilities = capabilities,
                        filetypes = { "html", "htm" }
                    })
                end,
                ["svelte"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.svelte.setup({
                        capabilities = capabilities,
                        on_attach = function(client)
                            client.server_capabilities.documentFormattingProvider = false
                        end,
                        root_dir = lspconfig.util.root_pattern(
                            "svelte.config.js",
                            "svelte.config.cjs",
                            "vite.config.ts",
                            "vite.config.js",
                            "tsconfig.json",
                            "jsconfig.json",
                            ".git"
                        ),
                        settings = {
                            svelte = {
                                enableTsPlugin = true,
                            },
                        },
                    })
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        root_dir = root_files,
                        --lspconfig.util.root_pattern(".git", "_root"),
                        settings = {
                            Lua = {
                                format = {
                                    enable = true,
                                    -- Put format options here
                                    -- NOTE: the value should be STRING!!
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                    }
                                },
                            }
                        }
                    }
                end,
                ["rust_analyzer"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.rust_analyzer.setup {
                        capabilities = capabilities,
                        root_dir = lspconfig.util.root_pattern("Cargo.toml", "Cargo.lock"),
                        settings = {
                            ["rust-analyzer"] = {
                                -- reduce indexing load
                                files = {
                                    excludeDirs = {
                                        "target",
                                        "node_modules",
                                        ".git",
                                        "dist",
                                        "build",
                                    },
                                },
                                -- avoid heavy features if you don’t need them
                                procMacro = { enable = false },
                                cargo = {
                                    loadOutDirsFromCheck = true,
                                    allFeatures = false,
                                },
                                checkOnSave = {
                                    command = "cargo check",
                                },
                            },
                        },
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Enter>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
