-- https://github.com/ThePrimeagen/harpoon

-- Basic telescope configuration
-- Below function enables the use if a Telescope window instead of default.
-- local telescope_conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = telescope_conf.file_previewer({}),
--         sorter = telescope_conf.generic_sorter({}),
--     }):find()
-- end

local config = function()
  local harpoon = require("harpoon")

  local toggle_opts = {
    border = "rounded",
    title_pos = "center",
    ui_width_ratio = 0.40,
  }

  harpoon:setup({
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  })

  vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add buffer to harpoon list" })
  -- vim.keymap.set("n", "<leader>hl", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
  vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts) end,
    { desc = "Open harpoon window" })

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<S-h>", function() harpoon:list():prev() end, { desc = "Next buffer in harpoon list" })
  vim.keymap.set("n", "<S-l>", function() harpoon:list():next() end, { desc = "Previous buffer in harpoon list" })
end


return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- opts = {},
    config = config,
  },
}
