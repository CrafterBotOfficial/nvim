return {
    "dmtrKovalenko/fff.nvim",
    build = 'cargo build --release',
    config = function ()
       require("fff").setup {
            max_threads = 8,
       }
    end
}
