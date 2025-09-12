require "lazy-bootstrap"

require("lazy").setup {
    { import = "plugins" },
    { import = "plugins/lsp" },
}

require "keymaps"
require "nvim-settings"

require "overrides"
