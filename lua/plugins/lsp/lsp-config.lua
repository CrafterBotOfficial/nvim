return {
    "neovim/nvim-lspconfig",
    config = function ()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
        capabilities.textDocument.completion.completionItem = {
            snippetSupport = true,
            commitCharactersSupport = true,
            documentationFormat = { "markdown", "plaintext" },
        }

        -- vim.lsp.config("zls", {
        --     cmd = { "/usr/bin/zls-master" }, -- yay -Sy zls-master-bin --noconfirm
        -- })
        -- vim.lsp.enable("zls")

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

        vim.lsp.config("tailwindcss", {
            capabilities = capabilities,
            filetypes = { "html", "templ", "tmpl", },
        })

        vim.lsp.config("html", {
            capabilities = capabilities,
            settings = {
                html = {
                    format = {
                        templating = true
                    }
                }
            },
            filetypes = { "html", "templ", "tmpl", },
        })

        vim.lsp.config("htmx", {
            cmd = { "/home/crafterbot/.cargo/bin/htmx-lsp" }, -- https://github.com/ThePrimeagen/htmx-lsp/issues/61
            capabilities = capabilities,
        })

        vim.lsp.config("emmet_language_server", {
            capabilities = capabilities,
        })

        vim.lsp.config("templ", {
            cmd = { "templ", "lsp" },
            capabilities = capabilities,
        })


        vim.filetype.add({
            extension = {
                tmpl = "html",
            },
        })

        vim.lsp.config("csharp_ls", {
            capabilities = capabilities,
            cmd = function(dispatchers, config)
                return vim.lsp.rpc.start({ 'csharp-ls', '--features', 'metadata-uris' }, dispatchers, {
                    cwd = config.cmd_cwd or config.root_dir,
                    env = config.cmd_env,
                    detached = config.detached,
                })
            end,
        });
        vim.lsp.enable("csharp_ls")

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
}
