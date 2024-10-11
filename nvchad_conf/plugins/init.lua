return {
  "glepnir/lspsaga.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  {"rhysd/git-messenger.vim", lazy = false},
  {"nvim-telescope/telescope-ui-select.nvim", lazy = false},
  {
    "MunifTanjim/prettier.nvim",
    setup = {
      bin = 'prettier', -- or `prettierd`
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
      },
    }
  },
  {
    'glepnir/template.nvim',
    cmd = { 'Template', 'TemProject' },
    config = function()
      require('template').setup({
        -- config in there
        author = "Julian J.",
        temp_dir = "~/development/code_templates/"
      })
    end
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta",            lazy = true }, -- optional `vim.uv` typings
  {                                                   -- optional completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "declancm/cinnamon.nvim",
    version = "*", -- use latest release
    opts = {
      -- change default options here
    },
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "mrjones2014/smart-splits.nvim"
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.typescriptreact = { "prettierd", "prettier" }
      opts.formatters_by_ft.javascriptreact = { "prettierd", "prettier" }
    end,
  },
  {
    "stevearc/vim-arduino",
    keys = {
      { "<leader>ac", "<cmd>ArduinoCompile<cr>",       desc = "Compile Sketch" },
      { "<leader>ad", "<cmd>ArduinoCompileDeploy<cr>", desc = "Compile and Deploy Sketch" },
      { "<leader>as", "<cmd>ArduinoSerial<cr>",        desc = "Open Serial Monitor" },
    },
  },

  -- Arduino language server
  -- {
  --   "glebzlat/arduino-nvim",
  --   config = function()
  --     require("arduino-nvim").setup()
  --   end,
  --   ft = "arduino",
  -- },
  {
    "arduino/arduino-language-server",
    ft = "arduino",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.arduino_language_server.setup({
        cmd = {
          "arduino-language-server",
          "-cli-config", [[ C:\Users\uie56181\AppData\Local\Arduino15/arduino-cli.yaml ]],
          -- "-cli", [[ C:\Users\uie56181\Desktop\arduino\resources\app\lib\backend\resources\arduino-cli.exe ]],
          -- "-clangd", "clangd",
          -- "-fqbn", "esp8266:8266:nodemcuv2",
        },
      })
    end,
  },
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
          require('rustaceanvim.neotest');
          require("neotest-python")({
            -- Adapter configuration options
            runner = "pytest",
            args = { "--log-level", "DEBUG" },
          }),
          require("neotest-rust") {
            args = { "--no-capture" }
          },
        },
      })
    end,
  },
  { "mbbill/undotree",                 lazy = true },
  { "tpope/vim-surround",              lazy = false },
  { "wakatime/vim-wakatime",           lazy = false },
  { "christoomey/vim-tmux-navigator",  lazy = false },
  { "mattn/emmet-vim",                 lazy = false },
  { "windwp/nvim-ts-autotag",          lazy = false },
  { "folke/zen-mode.nvim",             lazy = false },
  { "maxmellon/vim-jsx-pretty",        lazy = false },
  { "Eandrju/cellular-automaton.nvim", lazy = false },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    lazy = false,
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function() vim.g.mkdp_theme = "dark" end
  },
  {
    "williamboman/mason.nvim",
    opts = {
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
      require 'lspconfig'.pyright.setup {}
      require 'lspconfig'.lua_ls.setup {}
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("configs.telescope-ui-select")
      require("configs.telescope")
      global = "fjdsk"
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "rust", "arduino"
      },
    },
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
-- }
