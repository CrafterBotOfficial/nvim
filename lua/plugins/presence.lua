return {
    "https://codeberg.org/Crafterbot/discord.nvim",
    build = 'make',
    config = function ()
        local blacklistedFolders = {
            ".local/",
            ".cache/",
            "/Projects/Secret/",
        }
        require "discord" .setup {
            secret_paths = blacklistedFolders
        }
    end
}
