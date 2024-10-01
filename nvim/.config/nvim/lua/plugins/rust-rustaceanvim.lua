-- https://github.com/mrcjkb/rustaceanvim

local config = function()
  local on_attach = require("nvchad.configs.lspconfig").on_attach
  local capabilities = require("nvchad.configs.lspconfig").capabilities

  -- Used for nvim-dap debug plugin.
  local mason_registry = require('mason-registry')
  local codelldb = mason_registry.get_package("codelldb")
  local extension_path = codelldb:get_install_path() .. "/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  local cfg = require('rustaceanvim.config')
  -- nvim-dap

  vim.g.rustaceanvim = {
    -- Used for nvim-dap debug plugin.
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    -- nvim-dap

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
    lazy = false,   -- This plugin is already lazy
    config = config,
  },
}
