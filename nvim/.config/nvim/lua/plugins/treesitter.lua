-- https://github.com/nvim-treesitter/nvim-treesitter

local options = {
    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
  auto_install = true,
  ensure_installed = {
        "angular",
        "bash", "bicep",
        "c", "c_sharp", "comment", "css", "csv", "cue",
        "diff", "dockerfile",
        "editorconfig",
        "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "gleam", "go", "goctl", "gomod", "gosum", "gotmpl", "gowork", "gpg",
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
    },
    indent = {
      enable = true,
    },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = options,
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim",
    },
  },
}
