vim.opt.clipboard = "unnamedplus"

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4

-- Fold methods
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
