return { 
    {
        "nvim-telescope/telescope.nvim", 
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() 
            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                    },
                    file_ignore_patterns = { 
                        "%.git/.*", 
                        -- for dotnet development
                        "%bin/.*",
                        "%obj/.*", 
                    }
                },
            })
        end,
    },

    -- For lsp
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown()
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end,
    }
}
