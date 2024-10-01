-- Sets vim.ui.select to telescope. That means for example that neovim core stuff can fill the telescope picker.
-- https://github.com/nvim-telescope/telescope-ui-select.nvim

local config = function()
  require("telescope").setup {
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown { initial_mode = "normal" },
      },
    },
  }
  -- To get ui-select loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require("telescope").load_extension "ui-select"
end

return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = config,
  },
}
