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

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}) -- shows help
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}) 
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
