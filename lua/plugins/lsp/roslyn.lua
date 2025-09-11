return {
    {
        "seblyng/roslyn.nvim",
        opts = {},
        config = function ()
            vim.lsp.config("roslyn", {
                settings = {
                    ["csharp|background_analysis"] = {
                        dotnet_analyzer_diagnostics_scope = "none",
                        -- Keep compiler diagnostics if desired (e.g., errors like syntax issues)
                        dotnet_compiler_diagnostics_scope = "fullSolution",  -- or "openFiles" / "none"
                    },
                },
            })
        end
    },

    -- https://github.com/khoido2003/roslyn-filewatch.nvim
    {
	    "khoido2003/roslyn-filewatch.nvim",
		config = function()
			require("roslyn_filewatch").setup {}
		end,
	},
}
