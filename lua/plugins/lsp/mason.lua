return {
    {
        "williamboman/mason.nvim",
        config = function ()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function ()
            require("mason").setup {
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            }

            require("mason-lspconfig").setup {
                auto_install = true,
                ensure_installed = {
                    "html", "emmet_language_server",
                    -- "htmx", -- must be installed manually with cargo
                    "lua_ls",
                    "qmlls",
                    "gopls",
                    "templ",
                    -- "rzls", -- c# .razor support
                },
                automatic_enable = {
                    exclude = { "luau_lsp" },
                },
            }
        end,
    },
}
