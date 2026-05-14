require "utils"

-- ----------
-- Mode 
-- ----------

map_mode("i", "jj", "<Esc>")

-- ----------
-- Navigation
-- ----------

-- Fuzzy Finding
local snacks = require 'snacks'
map("<C-n>", ":NvimTreeToggle<CR>")
map("<leader>ff", function ()
    if in_git_folder() then
        require"fff-snacks".find_files()
    else
        snacks.picker.files()
    end
end)
map("<leader>fg", function ()
    if in_git_folder() then
        require("fff-snacks").live_grep({
            grep_mode = { "fuzzy", },
        })
    else
        snacks.picker.grep()
    end
end)

-- Harpoon
local harpoon = require "harpoon"

local function map_harpoon(key, index)
    map("<C-" .. key .. ">", function() harpoon:list():select(index) end)
    map("<C-S-" .. key .. ">", function() harpoon:list():replace_at(index) end)
end
map("<C-a>", function() harpoon:list():add() end)
map("<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map_harpoon("h", 1)
map_harpoon("t", 2)
map_harpoon("c", 3)
map_harpoon("s", 4)

-- Hop
map("<leader>h", ":HopWord<CR>")

-- ----------
-- Terminal 
-- ----------

map("<leader>t", ":FloatermToggle<CR>")
map_mode("t", "<Esc>", "<C-\\><C-n>:FloatermToggle<CR>")
map_mode("t", "jj", "<C-\\><C-n>:FloatermToggle<CR>")

----------
-- LSP
----------


-- Map 'gd' to Snacks LSP definitions picker
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })

-- Other useful LSP pickers in Snacks
map("gd", vim.lsp.buf.definition) -- go to definition
map("K", vim.lsp.buf.hover) -- shows help
map("gl", vim.diagnostic.open_float)  -- shows error under indicator
map("ga", vim.lsp.buf.code_action)
