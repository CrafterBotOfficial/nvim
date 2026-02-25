require "utils"
-- ----------
-- Mode 
-- ----------

map_mode("i", "jj", "<Esc>")

-- ----------
-- Navigation
-- ----------

-- Scroll
-- map("<C-d>", "<C-d>zz")
-- map("<C-f>", "<C-d>zz")
-- map("<C-u>", "<C-u>zz")

-- Fuzzy Finding
map("<C-n>", ":NvimTreeToggle<CR>")
map("<leader>ff", function () require"fff-snacks".find_files()  end) -- now done in fff.lua
map("<leader>FF", function () require"fff".find_files_in_dir"/"  end) -- now done in fff.lua
map("<leader>fs", function() require"fff".scan_files() end)
map("<leader>fg", function () require("fff-snacks").live_grep({ grep_mode = { "fuzzy", }, }) end)
map("<leader>fz", function () require("fff-snacks").live_grep({ grep_mode = { "regex",  }, }) end)

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
