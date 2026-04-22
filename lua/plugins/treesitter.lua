return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function ()
        -- require("nvim-treesitter").install { "javascript", "qmljs" }
    end,
}
