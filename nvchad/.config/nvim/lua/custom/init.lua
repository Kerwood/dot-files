local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Remove trailing whitespace in save
autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})


opt.ignorecase = true     -- ignore case in search patterns
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.whichwrap = 'b,s'     -- Default value
opt.iskeyword:append("-")
