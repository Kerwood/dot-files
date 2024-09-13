-- Debug Adapter Protocol client implementation for Neovim.
--https://github.com/mfussenegger/nvim-dap

local config = function()
  local dap, dapui = require("dap"), require("dapui")

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end

  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end

  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end

  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug - Toggle Breakpoint" })
  vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug - Continue" })
  vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "Debug - Step over" })
  vim.keymap.set("n", "<leader>dk", dap.step_out, { desc = "Debug - Step out" })
  vim.keymap.set("n", "<leader>dl", dap.step_into, { desc = "Debug - Step into" })
end

return {
  "mfussenegger/nvim-dap",
  config = config,
  dependencies = {
    "nvim-neotest/nvim-nio",
  }

}
