return {
    dir = "https://git.crafterbot.com/Crafterbot/discord.nvim",
    build = "make",
    config = function ()
        local blacklistedFolders = {
            ".cache/",
            "/Projects/Secret/",
        }
        require "discord" .setup { secret_paths = blacklistedFolders }
    end
}
