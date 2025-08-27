return {
    "dmtrKovalenko/fff.nvim",
    build = 'cargo build --release',
    config = function ()
        require("fff").setup {
            max_threads = 8,
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
