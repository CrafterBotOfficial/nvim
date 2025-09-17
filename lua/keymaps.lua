local function map(key, command)
    if type(command) == "string" then
        vim.api.nvim_set_keymap("n", key, command, { noremap = true, silent = true })
    else
        vim.keymap.set('n', key, command, { desc = 'FFFind files' })
    end
end

-- ----------
-- Navigation
-- ----------

-- fff
map("<C-n>", ":NvimTreeToggle<CR>")
map("<leader>ff", function() require('fff').find_files() end) -- vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true, silent = true })
map("<leader>fs", function() require('fff').scan_files() end)
map("<leader>fg", ":Telescope live_grep<CR>")

-- Harpoon
local harpoon = require "harpoon"
map("<C-a>", function() harpoon:list():add() end)
map("<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) -- note: remove entry with dd & :w
map("<C-h>", function() harpoon:list():select(1) end)
map("<C-t>", function() harpoon:list():select(2) end)
map("<C-c>", function() harpoon:list():select(3) end)
map("<C-s>", function() harpoon:list():select(4) end)
map("<C-S-h>", function() harpoon:list():replace_at(1) end)
map("<C-S-t>", function() harpoon:list():replace_at(2) end)
map("<C-S-c>", function() harpoon:list():replace_at(3) end)
map("<C-S-s>", function() harpoon:list():replace_at(4) end)

-- Hop
map("<leader>h", ":HopWord<CR>")
map("<leader>ll", ":Lazy<CR>")

-- ----------
-- Terminal 
-- ----------

map("<leader>t", ":ToggleTerm<CR>")

-- ----------
-- Git 
-- ----------

map("<leader>g", ":Neogit<CR>")
