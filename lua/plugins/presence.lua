return {
    "andweeb/presence.nvim",
    config = function ()
        local blacklistedFolders = {
            -- "dotfiles/"
            ".local/",
            "Projects/Secret/",
            -- home .. "/.config/",
            ".cache/",
        }
        require("presence").setup {
            blacklist = blacklistedFolders,
        }
    end
}
