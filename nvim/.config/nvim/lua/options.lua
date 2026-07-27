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

-- Add default borders to for floating windows
vim.o.winborder = "rounded"

-- Cap the width of all floating preview windows (LSP hover, signature help,
-- diagnostics, gitsigns previews). Callers that pass their own max_width win.
local orig_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  opts = opts or {}
  opts.max_width = opts.max_width or 100
  opts.max_height = opts.max_height or 25
  return orig_open_floating_preview(contents, syntax, opts, ...)
end
