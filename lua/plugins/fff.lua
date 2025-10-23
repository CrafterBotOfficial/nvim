return {
    "dmtrKovalenko/fff.nvim",
    build = 'cargo build --release',
    commit = "550a90", -- "a9b2f5b",
    config = function ()
        require("fff").setup {
            max_threads = 12,
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
            require("fff").scan_files()

            vim.defer_fn(function()
                vim.cmd("qa")
            end, 10000)
       end
    end
}
