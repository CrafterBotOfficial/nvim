return {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master', 
    config = function () 
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "javascript", "qmljs" },
            highlight = {
                enable = true,
            },
        }
    end,
}
