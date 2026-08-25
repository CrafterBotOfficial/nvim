local original_function = require("lazy.pkg").update

local function lazy_hook()
    original_function()

    vim.notify("Installing packages...", vim.log.levels.INFO)
    vim.system({ "cargo", "install", "tree-sitter", "htmx-lsp" }):wait()
    vim.notify("Finished!", vim.log.levels.INFO)
end

require("lazy.pkg").update = lazy_hook
