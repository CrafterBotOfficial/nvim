return {
    {
        "dmtrKovalenko/fff.nvim",
        version = "0.8.*",
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
        "https://github.com/madmaxieee/fff-snacks.nvim",
        commit = "ad0cb07e06fc097910ab965f0216f1e4ae0315da", -- rollback to show entries on open instead of after type
        dependencies = {
            "dmtrKovalenko/fff.nvim",
            "folke/snacks.nvim",
        },
        lazy = false,
    },
}
