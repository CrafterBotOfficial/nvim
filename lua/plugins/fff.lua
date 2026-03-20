return {
    {
        "dmtrKovalenko/fff.nvim",
        lazy = false,
        build = function()
            require("fff.download").download_or_build_binary()
        end,

        config = function ()
            require("fff").setup {
                lazy_sync = false,
                preview = {
                    chunk_size = 4096,
                },
                prompt = " >  ",
                keys = {
                    move_up = { "<Up>", "<C-k>" },
                    move_down = { "<Down>", "<C-j>" },
                }
            }
        end,
    },

    {
        "madmaxieee/fff-snacks.nvim",
        dependencies = {
            "dmtrKovalenko/fff.nvim",
            "folke/snacks.nvim",
        },
        lazy = false,
    },
}
