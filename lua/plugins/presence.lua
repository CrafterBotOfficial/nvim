return {
    "andweeb/presence.nvim",
    config = function ()
        local home = os.getenv('HOME')
        local blacklistedFolders = {
            -- "dotfiles/"
            ".local/",
            "Projects/Secret/",
            -- home .. "/.config/",
            ".cache/",
        }
        require("presence").setup {
            blacklist = blacklistedFolders,
            neovim_image_text = "bruh dont look at me",
        }
    end

    -- dir = "~/Projects/discord.nvim",
    -- "https://git.crafterbot.com/Archive/discord.nvim",
    -- build = "make",
    -- config = function ()
    --     local blacklistedFolders = {
    --         ".cache/",
    --         "/Projects/Secret/",
    --     }
    --     require "discord" .setup { secret_paths = blacklistedFolders }
    -- end
}
