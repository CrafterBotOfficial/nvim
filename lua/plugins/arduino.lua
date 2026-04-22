return { {
        "yuukiflow/Arduino-Nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            -- Load Arduino plugin for .ino files
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "arduino",
                callback = function()
                    require("Arduino-Nvim")
                end,
            })
        end,
    },

    {
        -- 'anurag3301/nvim-platformio.lua',
        --
        -- dependencies = {
        --     { 'akinsho/toggleterm.nvim' },
        --     { 'nvim-telescope/telescope.nvim' },
        --     { 'nvim-telescope/telescope-ui-select.nvim' },
        --     { 'nvim-lua/plenary.nvim' },
        --     { 'nvim-treesitter/nvim-treesitter' }
        -- },
    }
}
