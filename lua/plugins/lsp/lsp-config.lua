return {
    "neovim/nvim-lspconfig",
    config = function ()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
        capabilities.textDocument.completion.completionItem = {
            snippetSupport = true,
            commitCharactersSupport = true,
            documentationFormat = { "markdown", "plaintext" },
        }

        vim.lsp.config("clangd", {
            cmd = { "clangd", "--query-driver=/usr/bin/g++,/usr/bin/clang++" }
        })

        vim.lsp.config("zls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("zls")

        vim.lsp.enable("roslyn_ls")
        vim.lsp.enable("roslyn")

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
        vim.lsp.enable("htmx")

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
                zmpl = "html",
            },
        })

        vim.lsp.config("qmlls", {
            -- cmd = { "qmlls", "-I", "/lib/qt6/qml" },
            filetypes = { "qml" },
            root_markers = { ".qmlls.ini" },
        })
        vim.lsp.enable("qmlls")

        vim.env.GORILLATAG_PATH = "/home/crafterbot/.local/share/Steam/steamapps/common/Gorilla Tag/"
    end,
}
