return {
  "glepnir/lspsaga.nvim",
  "nvim-lua/plenary.nvim",
  { 
    "nvchad/nvterm", 
    config = function()
      require("nvterm").setup()
    end 
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-python"
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            -- Adapter configuration options
            runner = "pytest",
            args = { "--log-level", "DEBUG" },
          }),
          require("neotest-rust"){
            args = {"--no-capture" }
          },
        },
      })
    end,
  },
  {"mbbill/undotree", lazy = true},
  {"tpope/vim-surround", lazy = false},
  {"wakatime/vim-wakatime", lazy = false},
  {"christoomey/vim-tmux-navigator", lazy = false},
  {"mattn/emmet-vim", lazy = false},
  {"windwp/nvim-ts-autotag", lazy = false},
  {"folke/zen-mode.nvim", lazy = false},
  {"maxmellon/vim-jsx-pretty", lazy = false},
  {"Eandrju/cellular-automaton.nvim", lazy = false},
  {
    "iamcco/markdown-preview.nvim",
    cmd = {"MarkdownPreview", "MarkdownPreviewStop"},
    lazy = false,
    build = function () vim.fn["mkdp#util#install"]() end,
    init = function () vim.g.mkdp_theme = "dark" end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("configs.lspconfig")
      require 'lspconfig'.pyright.setup {}
      require 'lspconfig'.lua_ls.setup {}

    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "configs.rust-tools"
    end,
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function ()
      require("configs.telescope-ui-select")
      global = "fjdsk"
    end
  }
}


-- return {
--   { "tpope/vim-surround", lazy = false },
--   { "wakatime/vim-wakatime", lazy = false },
--   {
--     "rust-lang/rust.vim",
--     ft = "rust",
--     init = function()
--       vim.g.rustfmt_autosave = 1
--     end
--   },
--   {
--     "simrat39/rust-tools.nvim",
--     ft = "rust",
--     dependencies = "neovim/nvim-lspconfig",
--     opts = function ()
--       return require "configs.rust-tools"
--     end,
--     config = function (_, opts)
--       require("rust-tools").setup(opts)
--     end
--   },
--   {
--     "stevearc/conform.nvim",
--     -- event = 'BufWritePre', -- uncomment for format on save
--     config = function()
--       require "configs.conform"
--     end,
--   },
--
--   -- These are some examples, uncomment them if you want to see them work!
--   {
--     "neovim/nvim-lspconfig",
--     config = function()
--       require("nvchad.configs.lspconfig").defaults()
--       require "configs.lspconfig"
--     end,
--   },
--   --
--   {
--     "williamboman/mason.nvim",
--     opts = {
--       ensure_installed = {
--         "lua-language-server", "stylua",
--         "html-lsp", "css-lsp", "prettier", "rust-analyzer"
--       },
--     },
--   },
--
--   {
--     "nvim-treesitter/nvim-treesitter",
--     opts = {
--       ensure_installed = {
--         "vim", "lua", "vimdoc",
--         "html", "css"
--       },
--     },
--   },
-- }
