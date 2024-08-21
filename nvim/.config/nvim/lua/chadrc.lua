-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula",

  hl_override = {
    CmpDoc = { bg = "black" },
    CmpDocBorder = { fg = "grey_fg", bg = "black" },
  },

  hl_add = {
    -- Change the color of inlay hints.
    LspInlayHint = { fg = "light_grey", bg = "black" },
  },
}

M.ui = {
  telescope = {
    style = "bordered",
  },
}

return M
