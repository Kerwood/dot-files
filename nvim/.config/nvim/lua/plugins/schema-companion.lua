-- https://github.com/cenk1cenk2/schema-companion.nvim

local config = function()
  require("schema-companion").setup({
    enable_telescope = true,
    -- Set below matcher to a specific Kubernetes version if needed. Default is master.
    -- https://github.com/yannh/kubernetes-json-schema
    matchers = {
      require("schema-companion.matchers.kubernetes").setup({ version = "master" }),
    },
  })
end

return {
  "cenk1cenk2/schema-companion.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  config = config,
  -- enabled = false,
}
