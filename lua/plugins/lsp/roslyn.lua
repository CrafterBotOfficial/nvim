-- Mostly copied from https://github.com/tris203/rzls.nvim?tab=readme-ov-file#example-configuration
return {
    {
        "seblyng/roslyn.nvim",
        ft = { "cs", "razor" },
        dependencies = {
            {
                "tris203/rzls.nvim",
                config = true,
            },
        },
        config = function ()
            local rzls_path = vim.fn.expand("$MASON/packages/rzls/libexec")
            local cmd = {
                "roslyn",
                "--stdio",
                "--logLevel=Information",
                "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
                "--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
                "--razorDesignTimePath=" .. vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
                "--extension",
                vim.fs.joinpath(rzls_path, "RazorExtension", "Microsoft.VisualStudioCode.RazorExtension.dll"),
            }

            vim.lsp.config("roslyn", {
                cmd = cmd,
                handlers = require("rzls.roslyn_handlers"),
                settings = {
                    -- ["csharp|background_analysis"] = {
                    --     dotnet_analyzer_diagnostics_scope = "none",
                    --     dotnet_compiler_diagnostics_scope = "fullSolution",
                    -- },
                },
            })

            -- vim.cmd("autocmd BufNewFile,BufRead *.cshtml set filetype=html.cshtml.razor")
            -- vim.cmd("autocmd BufNewFile,BufRead *.razor set filetype=html.cshtml.razor")

            -- Avalonia
            -- yay -S avalonia-ls-git
            vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
                pattern = { "*.axaml" },
                callback = function(event)
                    vim.lsp.start {
                        name = "avalonia",
                        cmd = { "avalonia-ls" },
                        root_dir = vim.fn.getcwd(),
                    }
                end
            })
            vim.filetype.add({
                extension = {
                    axaml = "xml",
                },
            })
        end,

        init = function()
            vim.filetype.add({
                extension = {
                    razor = "razor",
                    cshtml = "razor",
                },
            })
        end,
    },

    -- https://github.com/khoido2003/roslyn-filewatch.nvim
    -- {
    --     "khoido2003/roslyn-filewatch.nvim",
    --     config = function()
    --         require("roslyn_filewatch").setup {}
    --     end,
    -- },
}
