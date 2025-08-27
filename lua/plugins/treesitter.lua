return {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master', 
    config = function () 
        require("nvim-treesitter.configs").setup {
            highlight = {
                enable = true,
            },
        }
    end,
}
