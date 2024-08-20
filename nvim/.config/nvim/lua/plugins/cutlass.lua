-- Cutlass overrides the delete operations to actually just delete and not affect the current yank.
-- https://github.com/gbprod/cutlass.nvim

local options = {
  cut_key = "x",
  override_del = true,
}

return {
  { "gbprod/cutlass.nvim", lazy = false, opts = options },
}
