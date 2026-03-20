return {
    -- {
    --     "rebelot/kanagawa.nvim",
    --     config = function()
    --         require("kanagawa").setup {
    --
    --         }
    --
    --         vim.cmd("colorscheme kanagawa-dragon")
    --     end,
    -- }

    {
        "https://github.com/sainnhe/gruvbox-material",
        config = function()
            vim.g.gruvbox_material_background = 'hard'
            vim.cmd("colorscheme gruvbox-material")
        end,
    }
}
