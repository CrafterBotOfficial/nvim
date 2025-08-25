return {
    'goolord/alpha-nvim', -- https://github.com/goolord/alpha-nvim
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()

        local alpha = require'alpha'
        local dashboard = require'alpha.themes.dashboard'
        dashboard.section.header.val = {
            [[ ]],
            [[ _______  _______  _______  _______ _________ _______  _______  ______   _______ _________]],
            [[(  ____ \(  ____ )(  ___  )(  ____ \\__   __/(  ____ \(  ____ )(  ___ \ (  ___  )\__   __/]],
            [[| (    \/| (    )|| (   ) || (    \/   ) (   | (    \/| (    )|| (   ) )| (   ) |   ) (   ]],
            [[| |      | (____)|| (___) || (__       | |   | (__    | (____)|| (__/ / | |   | |   | |   ]],
            [[| |      |     __)|  ___  ||  __)      | |   |  __)   |     __)|  __ (  | |   | |   | |   ]],
            [[| |      | (\ (   | (   ) || (         | |   | (      | (\ (   | (  \ \ | |   | |   | |   ]],
            [[| (____/\| ) \ \__| )   ( || )         | |   | (____/\| ) \ \__| )___) )| (___) |   | |   ]],
            [[(_______/|/   \__/|/     \||/          )_(   (_______/|/   \__/|/ \___/ (_______)   )_(   ]],
            [[                                                                                          ]],
        }
        dashboard.section.header.opts.position = "center"

        dashboard.section.footer.val = "Welcome back!"
        -- dashboard.section.footer.opt.Position = "button"

        dashboard.section.buttons.val = { -- original https://github.com/goolord/alpha-nvim/blob/main/lua/alpha/themes/dashboard.lua#L77
            dashboard.button("e", "  New file", "<cmd>ene <CR>"),
            dashboard.button("SPC f f", "󰈞  Find file"),
            dashboard.button("SPC f g", "󰈬  Find word"),
            dashboard.button("SPC l l", "  Lazy"),

            -- todo: impliment
            dashboard.button("SPC s l", "  Open last session"),
            dashboard.button("SPC f m", "  Jump to bookmarks"),
            dashboard.button("SPC f r", "  Frecency/MRU"),
        }

        alpha.setup(dashboard.config)
    end
}
