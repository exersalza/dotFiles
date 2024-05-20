local plugins = {
  "nvim-lua/plenary.nvim",
  { "mbbill/undotree", lazy=false },
  {"edluffy/hologram.nvim", lazy = false},
  {"tpope/vim-surround", lazy = false},
  {"wakatime/vim-wakatime", lazy = false},
  {"christoomey/vim-tmux-navigator", lazy = false},
  {"mattn/emmet-vim", lazy = false},
  {"windwp/nvim-ts-autotag", lazy = false},
  {"folke/zen-mode.nvim", lazy = false},
  {"maxmellon/vim-jsx-pretty", lazy = false},
  {
    "iamcco/markdown-preview.nvim",
    cmd = {"MarkdownPreview", "MarkdownPreviewStop"},
    lazy = false,
    build = function () vim.fn["mkdp#util#install"]() end,
    init = function () vim.g.mkdp_theme = "dark" end
  },
  "glepnir/lspsaga.nvim",
  {"LhKipp/nvim-nu", init = function ()
    
  end, 
  ft = {"nu"}},
  {"Eandrju/cellular-automaton.nvim", lazy = false},
  {
    "andweeb/presence.nvim",
    lazy = false,
    init = function ()
      -- The setup config table shows all available config options with their default values:
require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`) neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
    end
  },
  {
    "edKotinsky/Arduino.nvim",
    lazy = false,
    init = function ()
      default_fqbn = "esp8266:esp8266:nodemcuv2"
      clangd = "/bin/clangd"
      arduino_cli = "/bin/arduino-cli"
      arduino_config_dir = "/home/julian/.arduino15/"
    end,
    ft = {"c", "cpp", "ino"}
  };
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
return plugins
