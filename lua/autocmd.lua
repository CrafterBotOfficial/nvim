local my_group = vim.api.nvim_create_augroup("settings", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
    group = my_group,
    callback = function()
        local mode = vim.v.event.new_mode
        local prev_mode = vim.v.event.last_mode
        if not vim.bo.filetype == "zig" or not mode == "n" or not prev_mode == "i" then
            return
        end

        vim.lsp.buf.format()

        -- vim.lsp.buf.code_action({
        --     context = { only = { "source.organizeImports" } },
        --     apply = true,
        -- })
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.zig", "*.zon" },
    group = my_group,
    callback = function(ev)
        vim.lsp.buf.code_action({
            context = { only = { "source.fixAll" } },
            apply = true,
        })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "templ",
    group = my_group,
    callback = function()
        vim.treesitter.start()
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    desc = "Run templ generate on save",
    pattern = { "*.templ", "*.go" },
    group = my_group,
    callback = function()
        vim.cmd(":silent !templ generate")
        vim.cmd("lsp restart")
    end
})

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
