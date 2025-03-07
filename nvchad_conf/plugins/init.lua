return {
  {
    "prettier/vim-prettier", lazy = false
  },
{
    'LhKipp/nvim-nu',
    opts = {}
},
  {
    "MunifTanjim/prettier.nvim",
    lazy = false,
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "neovim/nvim-lspconfig",
    },
    setup = {
      bin = 'prettierd', -- or `prettierd`
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
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function() require "configs.conform" end,
  },

  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = { -- load the plugin only when using it's keybinding:
      { "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>" },
    },
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  "glepnir/lspsaga.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "jeangiraldoo/codedocs.nvim",
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
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
    "mrjones2014/smart-splits.nvim"
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
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
          require('rustaceanvim.neotest'),
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
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  }
}
