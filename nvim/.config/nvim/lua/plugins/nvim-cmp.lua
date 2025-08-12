local cmp = require "cmp"

local options = {

  -- Below two lines disables cmp from auto selecting the first suggestion in the list.
  -- preselect = cmp.PreselectMode.None,
  -- completion = { completeopt = "noselect" },

  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false, -- Set to false to disable auto select.
      -- select = false, -- Set to false to disable auto select.
    },

    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<Esc>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.abort()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-j>"] = cmp.mapping(function()
      if not cmp.visible() then
        cmp.complete()
      end
    end, { "i", "c" }),
  },
}

return {
  {
    "hrsh7th/nvim-cmp",
    opts = options,
  },
}
