return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function ()

        -- https://github.com/akinsho/toggleterm.nvim?tab=readme-ov-file#terminal-window-mappings
        function _G.set_terminal_keymaps()
            local opts = { buffer = 0, noremap = true, silent = true }
            vim.keymap.set('t', '<esc>', [[<Cmd>ToggleTerm<CR>]], opts)
        end

        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*",
            callback = function()
                _G.set_terminal_keymaps()
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "ToggleTermOpen",
            callback = function()
                _G.set_terminal_keymaps()
            end,
        })
        require("toggleterm").setup {
            -- open_mapping = [[<leader>ft]],
            open_mapping = [[<leader>t]],
            direction = "float",
            float_opts = {
                border = "curved",
                width = function(_) return math.floor(vim.o.columns * 0.9) end,
                height = function(_) return math.floor(vim.o.lines * 0.9) end,
            },
        }
    end,
}
