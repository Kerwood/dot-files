-- A UI for nvim-dap which provides a good out of the box configuration.
-- https://github.com/rcarriga/nvim-dap-ui

local config = function()
  local dapui = require("dapui")
  dapui.setup { plugins = { "nvim-dap-ui" }, types = true }

  vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug - Toggle UI" })
end

return {
  "rcarriga/nvim-dap-ui",
  config = config,
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  }
}
