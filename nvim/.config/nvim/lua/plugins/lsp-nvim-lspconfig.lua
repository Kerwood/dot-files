-- Configs for the Nvim LSP client
-- https://github.com/neovim/nvim-lspconfig

local config = function()
  -- load defaults i.e lua_lsp
  require("nvchad.configs.lspconfig").defaults()

  -- local lspconfig = require "lspconfig"

  local servers = {
    "bashls",
    "denols",
    "docker_compose_language_service",
    "dockerls",
    "jsonls",
    "intelephense", -- PHP
    "marksman",     -- Mardown
    "vacuum",       -- OpenAPI Spec
    "pyright",      -- Python
    "taplo",        -- TOML
    "terraformls",
    "gopls",
  }

  local nvlsp = require "nvchad.configs.lspconfig"

  -- lsps with default config
  for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    })
  end

  -- LSP Setup for helm_ls
  vim.lsp.config("helm_ls", {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
      ['helm-ls'] = {
        valuesFiles = {
          additionalValuesFilesGlobPattern = "values*.yaml",
        },
        yamlls = {
          enabled = false,
        },
      },
    },
  })

  -- LSP Setup for Yaml with schema companion.
  -- lspconfig.yamlls.setup(require("schema-companion").setup_client({
  --   on_attach = nvlsp.on_attach,
  --   on_init = nvlsp.on_init,
  --   capabilities = nvlsp.capabilities,
  -- }))

  -- LSP for Golang
  vim.lsp.config("gopls", {
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
      gopls = {
        ["ui.inlayhint.hints"] = {
          enable = true,
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  })
end


return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = config,
  },
}
