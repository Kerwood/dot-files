-- Plugin to improve viewing Markdown files in Neovim
-- https://github.com/MeanderingProgrammer/render-markdown.nvim

return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = "markdown",
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  }
}
