-- https://github.com/mrcjkb/rustaceanvim

local config = function()
  local on_attach = require("nvchad.configs.lspconfig").on_attach
  local capabilities = require("nvchad.configs.lspconfig").capabilities

  vim.g.rustaceanvim = {
    tools = {
      float_win_config = {
        border = "rounded",
      },
    },
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
    },
  }
end

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    config = config,
  },
}
