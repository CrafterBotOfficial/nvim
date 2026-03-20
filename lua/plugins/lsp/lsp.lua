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
                    -- "htmx",
                    "lua_ls",
                    "qmlls",
                    -- "rzls", -- c# .razor support
                },
                automatic_enable = {
                    exclude = { "luau_lsp" },
                },

            }
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function ()
            local lspconfig = require "lspconfig"

            -- This took forever to find -_-
            -- https://github.com/arduino/arduino-language-server/issues/206#issuecomment-2953245760
            vim.lsp.config("arduino_language_server", {
                capabilities = {
                    textDocument = {
                        semanticTokens = vim.NIL,
                    },
                    workspace = {
                        semanticTokens = vim.NIL,
                    },
                },

                cmd = {
                    "arduino-language-server",
                    "-cli-config",
                    "/home/crafterbot/.arduino15/arduino-cli.yaml",
                    "-fqbn",
                    "esp32:esp32:esp32",
                    "-cli",
                    "arduino-cli",
                    "-clangd",
                    "clangd",
                },

                filetypes = { "arduino" },

                root_dir = function(bufnr, on_dir)
                    on_dir(vim.fn.expand "%:p:h")
                end,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('blink.cmp').get_lsp_capabilities({
                textDocument = { completion = { completionItem = { snippetSupport = true } } },
            })
            lspconfig.html.setup { capabilities = capabilities }
            -- lspconfig.htmx.setup { capabilities = capabilities, autostart = false, }
            lspconfig.emmet_language_server.setup { capabilities = capabilities, }

            lspconfig.lua_ls.setup {
                diagnostics = {
                    globals = { "vim" },
                },
                filetypes = { "lua" },
            }
            lspconfig.qmlls.setup {
                cmd = { "qmlls", "-I", "/lib/qt6/qml" },
                filetypes = { "qml" },
                root_dir = lspconfig.util.root_pattern(".git", ".qmlls.json"),
            }
            vim.env.GORILLATAG_PATH = "/home/crafterbot/.local/share/Steam/steamapps/common/Gorilla Tag/"
            vim.env.MUCK_PATH = "/home/crafterbot/.local/share/Steam/steamapps/common/Muck/"

            vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, { noremap = true }) -- go to definition
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- shows help
            vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})  -- shows error under indicator
            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {
                buffer = bufnr,
                desc = "LSP: Code action",
                noremap = true,
                silent = true,
            })
        end,
    },
}
