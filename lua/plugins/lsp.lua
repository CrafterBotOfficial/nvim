return {
    {
        "williamboman/mason.nvim",
        config = function () 
            require("mason").setup {}
        end,
    },
    
    {
        "williamboman/mason-lspconfig.nvim",
        config = function () 
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls", "qmlls", "omnisharp" }
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
            }
            lspconfig.omnisharp.setup {
                cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
            }
            vim.env.GORILLATAG_PATH = "/home/crafterbot/.local/share/Steam/steamapps/common/Gorilla Tag/"

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- shows help
            -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) -- must be removed for c# development
            vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {})  -- shows error under indicator
        end
    },

    -- For c# view definition
    -- https://github.com/Hoffs/omnisharp-extended-lsp.nvim?tab=readme-ov-file#omnisharp-settings
    {
        "Hoffs/omnisharp-extended-lsp.nvim",
        config = function ()
            function isOmnisharpLsp()
                local buffer = vim.api.nvim_get_current_buf()
                local clients = vim.lsp.get_clients({ bufnr = buffer })
                for _, client in ipairs(clients) do
                    local name = client.name
                    if name == "omnisharp" then
                        return true
                    end
                end
                return false
            end
        end
    },
}
