local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
    -- https://github.com/simrat39/rust-tools.nvim 
    {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },

  -- https://github.com/rust-lang/rust.vim
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  -- https://github.com/Saecki/crates.nvim
  {
    'saecki/crates.nvim',
    tag = "v0.3.0",
    event = "BufReadPre Cargo.toml",
    opts = overrides.crates,
    config = function()
      require("crates").setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },

  {
    "folke/twilight.nvim",
    cmd = {"Twilight", "TwilightEnable"},
  },

  -- Syntax highlight for Just files
  -- https://github.com/IndianBoy42/tree-sitter-just
  {
    "IndianBoy42/tree-sitter-just",
    ft = "just",
    config = function()
      require("tree-sitter-just").setup({})
    end,
  },

  -- https://github.com/ThePrimeagen/harpoon
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- https://github.com/RRethy/vim-illuminate
  {
    "RRethy/vim-illuminate",
    lazy = false,
  },

  -- https://github.com/towolf/vim-helm
  {
    "towolf/vim-helm",
    ft = { "yaml", "smarty", "helm" },
  },

  -- Cutlass overrides the delete operations to actually just delete and not affect the current yank.
  -- https://github.com/gbprod/cutlass.nvim
  { "gbprod/cutlass.nvim",
    lazy = false,
    opts = overrides.cutlass,
  },

  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    },
    opts = overrides.neotree,
  },


  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      'HiPhish/rainbow-delimiters.nvim'
    },
  },

  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    opts = overrides.nvimtree,
  },

  -- https://github.com/max397574/better-escape.nvim
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
