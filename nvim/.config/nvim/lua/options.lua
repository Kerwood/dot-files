require "nvchad.options"

-- add yours here!

local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

opt.ignorecase = true -- ignore case in search patterns
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.whichwrap = "b,s" -- Default value
opt.iskeyword:append "-"

-- Enable LSP inlay hints
vim.lsp.inlay_hint.enable(true)

-- Add default borders to LSP popups
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
