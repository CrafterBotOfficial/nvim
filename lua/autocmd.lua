local my_group = vim.api.nvim_create_augroup("CustomSettings", { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { "*.zig", "*.zon" },
    callback = function(ev)
        -- vim.lsp.buf.format({ async = false })
        vim.lsp.buf.code_action({
            context = { only = { "source.fixAll" } },
            apply = true,
        })

        -- vim.lsp.buf.code_action({
        --     context = { only = { "source.organizeImports" } },
        --     apply = true,
        -- })
    end
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'templ',
    group = my_group,
    callback = function()
        vim.treesitter.start()
    end,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    desc = 'Run templ generate on save',
    pattern = { '*.templ', '*.go' },
    group = my_group,
    callback = function()
        vim.cmd(':silent !templ generate')
        vim.cmd("lsp restart")
    end
})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
