return {
    {
        "williamboman/mason.nvim",
        config = function () 
            require("mason").setup {
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            }
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function () 
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls", "qmlls" },
            }
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function () 
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup {}
            lspconfig.qmlls.setup {
                cmd = { 'qmlls', '-I', '/lib/qt6/qml' },
                filetypes = { "qml" },
                root_dir = lspconfig.util.root_pattern(".git", ".qmlls.json"),
            }
            vim.env.GORILLATAG_PATH = "/home/crafterbot/.local/share/Steam/steamapps/common/Gorilla Tag/"

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
}
