return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup()
        vim.o.cmdheight = 0
    end
}
