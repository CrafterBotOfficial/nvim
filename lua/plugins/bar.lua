return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup {
            options = {
                theme = "tokyonight-night",
            }
        }
        vim.o.cmdheight = 0
    end
}
