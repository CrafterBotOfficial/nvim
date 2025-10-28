return {
    "dmtrKovalenko/fff.nvim",
    build = function()
        require("fff.download").download_or_build_binary()
    end,
    config = function ()
        require("fff").setup {
            max_threads = 16,
            debug = {
                enabled = false,
                show_scores = false,
            },
            prompt = " >  ",
        }

        -- nvim --headless --cmd "let g:fff_autoscan=1"
        -- auto scan files on computer startup
        if vim.g.fff_autoscan == 1 then
            print "Auto scanning files with fff.nvim"
            require "fff" .scan_files()

            vim.defer_fn(function()
                vim.cmd("qa")
            end, 10000)
        end
    end
}
