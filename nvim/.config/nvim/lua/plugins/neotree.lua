-- Neo-tree is a Neovim plugin to browse the file system and other tree like structures in whatever style suits you,
-- including sidebars, floating windows, netrw split style, or all of them at once!
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local options = {
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
        added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "✖", -- this can only be used in the git_status source
        renamed = "", -- this can only be used in the git_status source
        -- Status type
        untracked = "U",
        ignored = "",
        unstaged = "M",
        staged = "",
        conflict = "",
      },
    },
  },
  window = {
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
      ["a"] = { "add", config = { show_path = "relative" } }, -- "none", "relative", "absolute"
      ["A"] = { "add_directory", config = { show_path = "relative" } }, -- "none", "relative", "absolute"
      ["c"] = { "copy", config = { show_path = "relative" } }, -- "none", "relative", "absolute"
      ["m"] = { "move", config = { show_path = "relative" } }, -- "none", "relative", "absolute"
    },
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {},
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        "node_modules",
        ".git",
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
  },
}

return {
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
    opts = options,
  },
}
