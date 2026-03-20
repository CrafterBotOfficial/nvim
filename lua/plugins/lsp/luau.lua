return {
    "https://github.com/lopi-py/luau-lsp.nvim",
    config = function ()
        local fallMonke = vim.fn.expand("$HOME/Projects/FallMonke-CustomMap/")
        require("luau-lsp").setup {
            -- platform = {
            --     type = "",
            -- },
            types = {
                definition_files = {
                    basic       = fallMonke .. "types/basic.d.luau",
                    player      = fallMonke .. "types/Player.d.luau",
                    object      = fallMonke .. "types/GameObject.d.luau",
                },
            },
            sourcemap = { enabled = false },
        }
    end
}
