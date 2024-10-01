-- Portable package manager for Neovim that runs everywhere Neovim runs.
-- Easily install and manage LSP servers, DAP servers, linters, and formatters.
-- https://github.com/williamboman/mason.nvim

local options = {
  ui = {
    border = "rounded",
  },
}
return {
  {
    "williamboman/mason.nvim",
    opts = options,
  },
}
