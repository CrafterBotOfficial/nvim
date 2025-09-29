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

            lspconfig.lua_ls.setup {
                diagnostics = {
                    globals = { "vim" },
                },
            }
            require("neodev").setup {
                lspconfig = true,
            }
            lspconfig.qmlls.setup {
                cmd = { 'qmlls', '-I', '/lib/qt6/qml' },
                filetypes = { "qml" },
                root_dir = lspconfig.util.root_pattern(".git", ".qmlls.json"),
            }
            vim.env.GORILLATAG_PATH = "/home/crafterbot/.local/share/Steam/steamapps/common/Gorilla Tag/"

            -- go to definition
            vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, { noremap = true })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- shows help
            vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {})  -- shows error under indicator
        end
    },
}
