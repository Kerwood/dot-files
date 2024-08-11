-- A neovim plugin that helps managing crates.io dependencies.
-- https://github.com/Saecki/crates.nvim

local options = {
    popup = {
      autofocus = true,
      border = "rounded",
    },
}

local config = function ()
  local crates = require("crates")
  crates.setup(options)

  vim.keymap.set("n", "<leader>cf", function() crates.show_features_popup() end, { desc = "Crates - Show Features"})
  vim.keymap.set("n", "<leader>cv", function() crates.show_versions_popup() end, { desc = "Crates - Show Versions"})
  vim.keymap.set("n", "<leader>cua", function() crates.upgrade_all_crates() end, { desc = "Crates - Upgrade All Crates"})
  vim.keymap.set("n", "<leader>cu", function() crates.upgrade_crate() end, { desc = "Crates - Upgrade Crate"})
  vim.keymap.set("n", "<leader>cs", function() crates.show_crate_popup() end, { desc = "Crates - Show Crate" })
  vim.keymap.set("v", "<leader>cu", function() crates.upgrade_crates() end, { desc = "Crates - Upgrade Selected Crates"})
end

return {
  {
    "saecki/crates.nvim",
    tag = "v0.5.2",
    event = "BufReadPre Cargo.toml",
    config = config,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
