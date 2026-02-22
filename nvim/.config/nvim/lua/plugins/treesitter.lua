-- https://github.com/nvim-treesitter/nvim-treesitter

local config = function()
  require("nvim-treesitter").install({
    "angular",
    "bash", "bicep",
    "c", "c_sharp", "comment", "css", "csv", "cue",
    "diff", "dockerfile",
    "editorconfig",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "gleam", "go", "goctl", "gomod", "gosum",
    "gotmpl", "gowork", "gpg",
    "hcl", "helm", "html", "http",
    "ini",
    "javascript", "jq", "jsdoc", "json", "jsonnet", "just",
    "kdl",
    "lua", "luadoc", "luap",
    "make", "markdown", "markdown_inline",
    "nginx",
    "pem", "php", "phpdoc", "powershell", "printf", "proto", "python",
    "regex", "rego", "readline", "rust", "requirements",
    "scss", "sql", "ssh_config",
    "terraform", "toml", "tsx", "typescript", "typespec",
    "vim", "vimdoc",
    "xml",
    "yaml",
  })
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = config,
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim",
    },
  },
}
