require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Custom ##########################################################
map("n", "<leader>o", "o<ESC>k", { desc = "Add blank line below" })
map("n", "<leader>O", "O<ESC>j", { desc = "Add blank line above" })
map("n", "<S-Tab>", "<<_", { desc = "Un-indent line" })
map("n", "<Tab>", ">>_", { desc = "Indent line" })
map("n", "<leader>tt", ":Neotree toggle<CR>", { desc = "Neotree Toggle" })

map("v", "<S-Tab>", "<gv", { desc = "Un-indent line" })
map("v", "<Tab>", ">gv", { desc = "Indent line" })
map("v", "p", '"_dP', { desc = "Paste without yank" })
map("v", "<C-j>", ":move '>+1<CR>gv=gv", { desc = "Move selected lines down" })
map("v", "<C-k>", ":move '<-2<CR>gv=gv", { desc = "Move selected lines up" })
map("v", "<leader>46", "c<c-r>=system('base64 --decode', @\")<cr><esc>", { desc = "Base64 decode selected string" })
map("v", "<leader>64", "c<c-r>=system('base64 -w 0', @\")<cr><esc>", { desc = "Base64 encode selected string" })

-- GitSigns ########################################################
local gitsigns = require('gitsigns')

map('n', '<leader>gs', gitsigns.show_commit, { desc = "Gitsigns - Show commit" })
map('n', '<leader>gr', gitsigns.reset_hunk, { desc = "Gitsigns - Reset hunk" })
map('n', '<leader>gp', gitsigns.preview_hunk, { desc = "Gitsigns - Preview hunk" })
map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = "Gitsigns - Preview hunk inline" })
map('n', '<leader>gc', gitsigns.toggle_current_line_blame, { desc = "Gitsigns - Toggle current line blame" })
map('n', '<leader>gb', gitsigns.blame, { desc = "Gitsigns - Blame" })
map('n', '<leader>gl', function()
  gitsigns.blame_line({ full = true })
end, { desc = "Gitsigns - Blame line" })

-- Tabufline Plugin ################################################
local nvchad_tabufline = require "nvchad.tabufline"

map("n", "<S-q>", function() nvchad_tabufline.close_buffer() end, { desc = "Close buffer" })
-- map("n", "<S-l>", function() nvchad_tabufline.next() end, { desc = "Goto next buffer" })
-- map("n", "<S-h>", function() nvchad_tabufline.prev() end, { desc = "Goto prev buffer" })

map("n", "<leader>tr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP Refernces - Telescope" })

-- Diagnostics #####################################################
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "LSP Diagnostic Popup" })
map("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "LSP Prev Diagnostic" })
map("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "LSP Next Diagnostic" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Signature Hover" })

