return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    config = function ()
        require("nvim-treesitter.configs").setup {
            auto_install = true,
            ensure_installed = { "javascript", "qmljs" },
            highlight = {
                enable = true,
                disable = { "xml" },
            },
            indent = {
                enable = true,
                disable = { "xml" },
            },
        }
    end,
    -- "nvim-treesitter/nvim-treesitter",
    -- branch = "main",
    -- build = ":TSUpdate",
    -- config = function ()
    --     local treesitter = require "nvim-treesitter"
    --     -- treesitter.install({"javascript", "qmljs"})
    -- end,
}
