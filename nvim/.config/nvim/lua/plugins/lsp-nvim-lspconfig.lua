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
    "lua_ls",
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

  -- Below lua_ls setup is a copy/paste of the orginal setup function from NvChad with the added handlers for enabling boarder.
  -- https://github.com/NvChad/NvChad/blob/8df1aa9a4de26765f70e63ccbb1ba8a43b3b2e89/lua/nvchad/configs/lspconfig.lua#L67
  lspconfig.lua_ls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    handlers = handlers,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
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
