return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-mini/mini.icons" },
    config = function()
        require "oil" .setup {}
    end,
}
