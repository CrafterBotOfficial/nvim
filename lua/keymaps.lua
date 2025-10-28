local function map_mode(mode, key, command)
    vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = true })
end

local function map(key, command)
    if type(command) == "string" then
        vim.api.nvim_set_keymap("n", key, command, { noremap = true, silent = true })
    else
        vim.keymap.set('n', key, command)
    end
end


-- ----------
-- Mode 
-- ----------

map_mode("i", "jj", "<Esc>")

-- ----------
-- Navigation
-- ----------

-- Fuzzy Finding
map("<C-n>", ":NvimTreeToggle<CR>")
map("<leader>ff", function() require('fff').find_files() end)
map("<leader>fs", function() require('fff').scan_files() end)
map("<leader>fg", ":Telescope live_grep<CR>")
map("<leader>fp", ":Telescope projects<CR>")

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
map("<leader>ll", ":Lazy<CR>")

-- ----------
-- Terminal 
-- ----------

map("<leader>t", ":FloatermToggle<CR>")
map_mode("t", "<Esc>", "<C-\\><C-n>:FloatermToggle<CR>")
map_mode("t", "jj", "<C-\\><C-n>:FloatermToggle<CR>")
