-- Configs for the Nvim LSP client
-- https://github.com/neovim/nvim-lspconfig

local config = function()
  -- load defaults i.e lua_lsp
  require("nvchad.configs.lspconfig").defaults()

  local lspconfig = require "lspconfig"

  local servers = {
    -- "azure_pipelines_ls",
    "bashls",
    "denols",
    "docker_compose_language_service",
    "dockerls",
    "jsonls",
    "intelephense", -- PHP
    "marksman", -- Mardown
    "vacuum", -- OpenAPI Spec
    "pyright", -- Python
    "taplo", -- TOML
    "terraformls",
  }

  local nvlsp = require "nvchad.configs.lspconfig"

  -- lsps with default config
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end

  -- LSP Setup for helm_ls
  lspconfig.helm_ls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
      valuesFiles = {
        additionalValuesFilesGlobPattern = "values*.yaml",
      },
      yamlls = {
        enabled = false,
      },
    },
  }

  -- LSP Setup for Yaml
  lspconfig.yamlls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    settings = {
      yaml = {
        schemas = {
          ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
            "azure-pipeline*.y*l",
            "Pipelines/*.y*l",
          },
        },
      },
    },
  }

  -- configuring single server, example: typescript
  -- lspconfig.tsserver.setup {
  --   on_attach = nvlsp.on_attach,
  --   on_init = nvlsp.on_init,
  --   capabilities = nvlsp.capabilities,
  -- }
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = config,
  },
}
