require "lazy-bootstrap"

require "lazy" .setup {
    { import = "plugins" },
    { import = "plugins/lsp" },
}

require "nvim-settings"
require "keymaps"
