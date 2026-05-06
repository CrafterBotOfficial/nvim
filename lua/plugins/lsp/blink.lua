return {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
        'saghen/blink.lib',
        'rafamadriz/friendly-snippets',
    },
    -- build = function()
    --     require('blink.cmp').build():wait(60000)
    -- end,
    opts = {
        keymap = {
            preset = 'default',
            [ '<Enter>' ] = { 'select_and_accept', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
        },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono'
        },
        completion = { documentation = { auto_show = true } },
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
        fuzzy = { implementation = 'rust' },
    },
    opts_extend = { 'sources.default' }
}
