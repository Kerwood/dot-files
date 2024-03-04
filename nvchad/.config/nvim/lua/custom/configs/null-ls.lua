local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- ShellCheck
  b.diagnostics.shellcheck,
  -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- GoLang Packages
  b.formatting.gofmt,
  -- go install -v github.com/incu6us/goimports-reviser/v3@latest
  b.formatting.goimports_reviser,
  -- go install github.com/segmentio/golines@latest
  b.formatting.golines,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
}

-- Below on_attach is for golang autocomplete.
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
