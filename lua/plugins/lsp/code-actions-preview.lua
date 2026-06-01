return {
    "https://github.com/aznhe21/actions-preview.nvim",
    config = function ()
        require("actions-preview").setup {
            diff = {
                algorithm = "patience",
                ignore_whitespace = true,
            },
            backend = { "snacks", },
        }
    end
}
