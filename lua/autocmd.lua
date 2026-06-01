vim.api.nvim_create_autocmd('FileType', {
    pattern = 'templ',
    callback = function()
        vim.treesitter.start()
    end,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    desc = 'Run templ generate on save',
    pattern = { '*.templ', '*.go' },
    callback = function()
        vim.cmd(':silent !templ generate')
        vim.cmd("lsp restart")
    end
})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
