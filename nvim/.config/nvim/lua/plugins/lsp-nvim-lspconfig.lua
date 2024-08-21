-- Configs for the Nvim LSP client
-- https://github.com/neovim/nvim-lspconfig

-- Below border and handler variables enables borders on LSP diagnostics.
local border = {
  { "╭" },
  { "─" },
  { "╮" },
  { "│" },
  { "╯" },
  { "─" },
  { "╰" },
  { "│" },
}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local config = function()
  -- load defaults i.e lua_lsp
  require("nvchad.configs.lspconfig").defaults()

  local lspconfig = require "lspconfig"

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
  }

  local nvlsp = require "nvchad.configs.lspconfig"

  -- lsps with default config
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      handlers = handlers,
    }
  end

  -- LSP Setup for helm_ls
  lspconfig.helm_ls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    handlers = handlers,
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
  }

  -- LSP Setup for Yaml
  lspconfig.yamlls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    handlers = handlers,
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
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = config,
  },
}
