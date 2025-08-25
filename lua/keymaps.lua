vim.keymap.set("x", "p", '"_dP', { noremap = true }) -- prevents coping on paste

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set('n', 'ff', function() require('fff').find_files() end, { desc = 'FFFind files' }) -- vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":HopWord<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ll", ":Lazy<CR>", { noremap = true, silent = true })

-- Fold methods
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
