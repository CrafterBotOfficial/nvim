return {
    {
        "williamboman/mason.nvim",
        config = function() 
            require("mason").setup {}
        end,
    },
    
    {
        "williamboman/mason-lspconfig.nvim",
        config = function() 
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "qmlls", "omnisharp" }
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function() 
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup {}
            lspconfig.qmlls.setup {
                cmd = { 'qmlls', '-I', '/lib/qt6/qml' },
            }
            lspconfig.omnisharp.setup {
                cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
                cmd_env = { GORILLATAG_PATH = "/home/crafterbot/.local/share/Steam/steamapps/common/Gorilla Tag/" },
            }

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- shows help
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) 
            vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {})  -- shows error under indicator
        end
    },
}
