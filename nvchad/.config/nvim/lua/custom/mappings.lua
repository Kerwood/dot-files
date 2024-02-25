---@type MappingsTable
local M = {}

M.disabled = { }

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.crates = {
  n = {
    ["<leader>cf"] = {
      function()
        require("crates").show_features_popup()
      end,
      "Crates - Show Features",
    },
    ["<leader>cv"] = {
      function()
        require("crates").show_versions_popup()
      end,
      "Crates - Show Versions",
    },
    ["<leader>cua"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "Crates - Upgrade All Crates",
    },
    ["<leader>cu"] = {
      function()
        require("crates").upgrade_crate()
      end,
      "Crates - Upgrade Crate",
    },
    ["<leader>cs"] = {
      function()
        require("crates").show_crate_popup()
      end,
      "Crates - Show Crate",
    },
  },
  v = {
    ["<leader>cu"] = {
      function()
        require("crates").upgrade_crates()
      end,
      "Crates - Upgrade Selected Crates",
    },
  },

}

M.harpoon = {
  n = {
    ["<leader>hh"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Open Harpoon UI",
    },
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Harpoon file",
    },
    ["<S-h>"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Harpoon Previous File",
    },
    ["<S-l>"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "Harpoon Next File",
    },
  },
}

-- more keybinds!
M.custom = {
  n = {
    ["<leader>o"] = { "o<ESC>k", "Add blank line below" },
    ["<leader>O"] = { "O<ESC>j", "Add blank line above" },
    ["<S-Tab>"] = { "<<_", "Un-indent line" },
    ["<Tab>"] = { ">>_", "Indent line" },
  },

  v = {
    ["<S-Tab>"] = { "<gv", "Un-indent line" },
    ["<Tab>"] = { ">gv", "Indent line" },
    ["p"] = { '"_dP', "Paste without yank" },
    ["<C-j>"] = { ":move '>+1<CR>gv=gv", "Move selected lines down" },
    ["<C-k>"] = { ":move '<-2<CR>gv=gv", "Move selected lines up" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    -- ["<S-l>"] = {
    --   function()
    --     require("nvchad_ui.tabufline").tabuflineNext()
    --   end,
    --   "Goto next buffer",
    -- },
    --
    -- ["<S-h>"] = {
    --   function()
    --     require("nvchad_ui.tabufline").tabuflinePrev()
    --   end,
    --   "Goto prev buffer",
    -- },

    -- close buffer + hide terminal buffer
    ["<S-q>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<leader>gg"] = {
      function()
        require("nvterm.terminal").send("lazygit", "float")
      end,
      "Toggle floating term",
    },
  },
}

return M
