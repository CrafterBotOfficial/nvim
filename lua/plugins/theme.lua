return {
    -- Visual Studios theme (not vscode)
    {
        -- "tomasiser/vim-code-dark",
        -- config = function ()
        --     vim.cmd.colorscheme "codedark"
        --
        --     local tokyo_colors = require "tokyonight.colors" .setup ()
        --     vim.cmd("hi Floaterm guibg=" .. tokyo_colors.bg)
        --     vim.g.terminal_color_7 = "#FFFFFF"
        --     vim.g.terminal_color_15 = "#FFFFFF"
        -- end,
    },

    {
        -- "catppuccin/nvim",
        -- name = "catppuccin",
        -- config = function ()
        --     local colors = require "tokyonight.colors" .setup ()
        --     local color_utils = require "tokyonight.util"
        --
        --     require "catppuccin" .setup {
        --         flavour = "mocha",
        --         color_overrides = {
        --             all = {
        --                 base = color_utils.lighten(colors.bg, 1),
        --             },
        --         }
        --     }
        --     vim.cmd.colorscheme "catppuccin"
        -- end
    },

    {
        -- "rebelot/kanagawa.nvim",
        -- config = function ()
        --     local tokyo_colors = require "tokyonight.colors" .setup ()
        --     local color_utils = require "tokyonight.util"
        --     tokyo_colors.bg = color_utils.brighten(tokyo_colors.bg, 0.1)
        --     require "kanagawa" .setup {
        --         overrides = function(colors)
        --             return {
        --                 Floaterm = { bg = tokyo_colors.bg },
        --                 FloatermNC = { bg = tokyo_colors.bg },
        --                 FloatermBorder = { bg = tokyo_colors.bg, fg = colors.palette.fujiGray },
        --             }
        --         end,
        --     }
        --     vim.cmd("colorscheme kanagawa-dragon")
        --
        --     vim.cmd("hi Floaterm guibg=" .. tokyo_colors.bg .. " guifg=#FFFFFF")
        --     vim.cmd("hi FloatermBorder guibg=" .. tokyo_colors.bg .. " guifg=#FFFFFF")
        --     vim.g.terminal_color_7 = "#FFFFFF"
        --     vim.g.terminal_color_15 = "#FFFFFF"
        -- end,
    },

    {
        "folke/tokyonight.nvim",
        config = function ()
            require("tokyonight").setup {
                style = "night",
            }

            vim.cmd.colorscheme "tokyonight"
        end,
    }
}
