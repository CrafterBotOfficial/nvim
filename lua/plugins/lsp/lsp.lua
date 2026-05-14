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
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
            capabilities.textDocument.completion.completionItem = {
                snippetSupport = true,
                commitCharactersSupport = true,
                documentationFormat = { "markdown", "plaintext" },
            }

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
                    "arduino:avr:leonardo",
                    "-cli",
                    "arduino-cli",
                    "-clangd",
                    "clangd",
                },

                filetypes = { "arduino" },

                root_dir = function(_, on_dir)
                    on_dir(vim.fn.expand "%:p:h")
                end,
            })

            --  dotnet tool run csharp-ls
            -- vim.lsp.config('csharp-ls', {
            --     cmd = { "csharp-ls", "--features", "metadata-uris" },
            --     capabilities = capabilities,
            --     filetypes = { 'csproj', 'sln', 'cs' },
            --         csharp = {
            --             useMetadataUris = true,
            --         },
            --     settings = {
            --         csharp = {
            --             useMetadataUris = true,
            --         },
            --         experimental = {
            --             csharp = {
            --                 metadataUris = true,
            --             },
            --         },
            --     },
            -- })

            vim.lsp.config("html", {
                capabilities = capabilities,
                settings = {
                    html = {
                        format = {
                            templating = true
                        }
                    }
                },
            })

            vim.lsp.config("htmx", {
                cmd = { "/home/crafterbot/.cargo/bin/htmx-lsp" }, -- https://github.com/ThePrimeagen/htmx-lsp/issues/61
                capabilities = capabilities,
            })

            vim.lsp.config("emmet_language_server", {
                capabilities = capabilities,
            })

            vim.filetype.add({
                extension = {
                    tmpl = "html",
                },
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "Lua 5.5",           -- or LuaJIT / 5.4 depending on your setup
                            path = {
                                "?.lua",
                                "?/init.lua",
                                vim.fn.expand("~/.luarocks/share/lua/5.5/?.lua"),
                                vim.fn.expand("~/.luarocks/share/lua/5.5/?/init.lua"),
                                "/usr/share/lua/5.5/?.lua",
                                "/usr/share/lua/5.5/?/init.lua",
                                -- add more if needed
                            },
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                    filetypes = { "lua" },
                }
            })

            vim.lsp.config("qmlls", {
                cmd = { "qmlls", "-I", "/lib/qt6/qml" },
                filetypes = { "qml" },
                root_dir = require"lspconfig".util.root_pattern(".git", ".qmlls.json"),
            })

            vim.env.GORILLATAG_PATH = "/home/crafterbot/.local/share/Steam/steamapps/common/Gorilla Tag/"
            vim.env.MUCK_PATH = "/home/crafterbot/.local/share/Steam/steamapps/common/Muck/"
        end,
    },
}
