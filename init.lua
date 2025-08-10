vim.g.mapleader = " "

require("lazy").setup({
  { "folke/tokyonight.nvim" }, -- theme
  { import = "plugins" }
})

require("bindings")
require("style")

vim.opt.clipboard = "unnamedplus"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
