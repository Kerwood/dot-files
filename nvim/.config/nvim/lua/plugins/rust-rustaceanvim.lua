-- https://github.com/mrcjkb/rustaceanvim
local init = function()
  local default_on_attach = require("nvchad.configs.lspconfig").on_attach
  local capabilities = require("nvchad.configs.lspconfig").capabilities

  local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local this_os = vim.uv.os_uname().sysname
  local liblldb_path = extension_path .. "lldb/lib/liblldb" .. (this_os == "Linux" and ".so" or ".dylib")

  local cfg = require("rustaceanvim.config")

  vim.g.rustaceanvim = {
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    tools = {
      code_actions = {
        ui_select_fallback = true,
      },
      float_win_config = {
        border = "rounded",
      },
    },
    server = {
      on_attach = function(client, bufnr)
        default_on_attach(client, bufnr)

        vim.keymap.set("n", "K", function() vim.cmd.RustLsp { "hover", "actions" } end,
          { silent = true, buffer = bufnr, desc = "LSP Hover actions" })

        vim.keymap.set("n", "<leader>ca", function() vim.cmd.RustLsp("codeAction") end,
          { silent = true, buffer = bufnr, desc = "LSP Code actions" })
      end,
      capabilities = capabilities,
    },
  }
end

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^8",
    ft = "rust",
    init = init,
  },
}
