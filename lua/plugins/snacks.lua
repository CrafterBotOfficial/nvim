return {
    "folke/snacks.nvim",
    opts = function(_, _)
        local layouts = require("snacks.picker.config.layouts")
        return {
            picker = {
                layout = layouts.telescope,
                layouts = {
                    select = layouts.default,
                    smart = layouts.ivy,
                },
            },
        }
    end
}
