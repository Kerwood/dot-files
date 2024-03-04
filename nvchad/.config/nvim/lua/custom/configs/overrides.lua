local M = {}

M.treesitter = {
  ensure_installed = "all",
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "rust-analyzer",
    "gopls",
  },
}

M.cutlass = {
  cut_key = "x",
  override_del = true,
}

M.crates = {
  null_ls = {
    enabled = true,
    name = "Crates",
  }
}

M.neotree = {
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  use_popups_for_input = false,
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      default = "",
    },
    modified = {
      symbol = "+",
      highlight = "NeoTreeGitUntracked",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖",-- this can only be used in the git_status source
        renamed   = "",-- this can only be used in the git_status source
        -- Status type
        untracked = "U",
        ignored   = "",
        unstaged  = "M",
        staged    = "",
        conflict  = "",
      }
    },
  },
  window = {
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
      ["a"] = { "add", config = { show_path = "relative" }}, -- "none", "relative", "absolute"
      ["A"] = { "add_directory", config = { show_path = "relative" }}, -- "none", "relative", "absolute"
      ["c"] = { "copy", config = { show_path = "relative" }}, -- "none", "relative", "absolute"
      ["m"] = { "move", config = { show_path = "relative" }}, -- "none", "relative", "absolute"
    }
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
      },
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        "node_modules",
        ".git"
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
  },
}

-- git support in nvimtree
M.nvimtree = {
  -- open_on_setup = true,
  -- open_on_tab = true,
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
      },
    },
  },
}

return M
