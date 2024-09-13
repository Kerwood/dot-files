--- mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
--- https://github.com/williamboman/mason-lspconfig.nvim

local options = {
  ensure_installed = {
    "azure_pipelines_ls",
    "bashls",
    "denols",
    "docker_compose_language_service",
    "dockerls",
    "helm_ls",
    "jsonls",
    "intelephense", -- PHP
    "marksman",     -- Mardown
    "vacuum",       -- OpenAPI Spec
    "pyright",      -- Python
    "yamlls",
    "lua_ls",
    "taplo", -- TOML
    "rust_analyzer",
    "terraformls",

    -- Below LSPs requires go to be installed.
    -- "regols",
    -- "gopls",
    -- "jsonnet_ls",
  },
}

return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = false,
    opts = options,
  },
}
