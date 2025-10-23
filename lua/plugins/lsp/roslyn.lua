return {
    {
        "tris203/rzls.nvim",
    },
    {
        "seblyng/roslyn.nvim",
        config = function ()
            vim.lsp.config("roslyn", {
                settings = {
                    ["csharp|background_analysis"] = {
                        dotnet_analyzer_diagnostics_scope = "none",
                        dotnet_compiler_diagnostics_scope = "fullSolution",
                    },
                },
            })

            vim.cmd("autocmd BufNewFile,BufRead *.cshtml set filetype=html.cshtml.razor")
            vim.cmd("autocmd BufNewFile,BufRead *.razor set filetype=html.cshtml.razor")
        end
    },

    -- https://github.com/khoido2003/roslyn-filewatch.nvim
    -- {
    --     "khoido2003/roslyn-filewatch.nvim",
    --     config = function()
    --         require("roslyn_filewatch").setup {}
    --     end,
    -- },
}
