-- https://github.com/andweeb/presence.nvim
return {
    "andweeb/presence.nvim",
    config = function ()
        local home = os.getenv('HOME')
        local blacklistedFolders = {
            -- "dotfiles/"
            ".local/",
            home .. "/.config/",
            ".cache/",
        }

        require("presence").setup {
            blacklist = blacklistedFolders,
            neovim_image_text = "bruh dont look at me",
        }
    end
}
