-- https://www.reddit.com/r/neovim/comments/1euc8mk/comment/lijgtcw/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- vim.api.nvim_create_autocmd("InsertEnter", { command = [[set norelativenumber]] })
-- vim.api.nvim_create_autocmd("InsertLeave", { command = [[set relativenumber]] }) 

vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true }) -- Undo tree
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", ":HopWord<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ll", ":Lazy<CR>", { noremap = true, silent = true })

-- Fold methods
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
