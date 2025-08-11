-- https://github.com/mrcjkb/rustaceanvim

local config = function()
  local default_on_attach = require("nvchad.configs.lspconfig").on_attach
  local capabilities = require("nvchad.configs.lspconfig").capabilities

  -- Setting up keybindings for attached buffers
  local function custom_on_attach(client, bufnr)
    default_on_attach(client, bufnr)

    vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<CR>",
      { noremap = true, silent = true, buffer = bufnr, desc = "LSP Hover actions" })

    vim.keymap.set("n", "<leader>ca", "<cmd>RustLsp codeAction<CR>",
      { noremap = true, silent = true, buffer = bufnr, desc = "LSP Code actions" })
  end

  -- Setting debug configuration
  local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  local cfg = require('rustaceanvim.config')

  vim.g.rustaceanvim = {
    -- Used for nvim-dap debug plugin.
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    tools = {
      code_actions = {
        ui_select_fallback = true
      },
      float_win_config = {
        border = "rounded",
      },
    },
    server = {
      on_attach = custom_on_attach,
      capabilities = capabilities,
    },
  }
end

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false,   -- This plugin is already lazy
    config = config,
  },
}
