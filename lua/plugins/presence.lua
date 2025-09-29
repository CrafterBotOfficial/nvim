-- https://github.com/andweeb/presence.nvim
return {
    "andweeb/presence.nvim",
    config = function ()
        -- local home = os.getenv('HOME')
        local blacklistedFolders = {
            ".local/",
            ".cache/",
            "/Projects/Secret/",
        }

        require("presence").setup {
            blacklist = blacklistedFolders,
            neovim_image_text = "bruh dont look at me",
            show_time = false,
        }
    end
}
