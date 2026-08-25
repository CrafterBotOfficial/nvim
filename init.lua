require "lazy-bootstrap"

require "lazy" .setup {
    { import = "plugins" },
    { import = "plugins/lsp" },
    { import = "plugins/lsp/languages" },
}

require "nvim-settings"
require "keymaps"
require "autocmd"
require "packages"
