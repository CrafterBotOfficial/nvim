return {
    'folke/snacks.nvim',
    opts = function(_, _)
        local layouts = require 'snacks.picker.config.layouts'
        return {
            grep = {
                sources = {
                    files = {
                        hidden = true,
                        ignored = false,
                    }
                },
            },
            picker = {
                sources = {
                    files = {
                        hidden = true,
                        ignored = false,
                    }
                },
                layout = layouts.telescope,
                layouts = {
                    select = layouts.default,
                    smart = layouts.ivy,
                },
            },
        }
    end
}
