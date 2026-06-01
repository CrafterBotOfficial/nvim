local model = "Qwen/Qwen2.5-Coder-7B-Instruct-GGUF"

local function is_running()
    local p = io.popen("pidof llama-server")
    if p ~= nil then
        local result = p:read("*a")
        p:close()
        return result and string.len(result) > 0
    end
    return false
end

local function check_gpu()
    local p = io.popen("glxinfo | grep 'OpenGL vendor string'")
    if p ~= nil then
        local r = p:read("*a")
        p:close()
        return string.find(r, "NVIDIA")
    end
    return true
end

if not check_gpu() then
    print("Laptop friendly mode")
    return {}
end

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter", }, {
    callback = function ()
        if not is_running() then
            io.popen("llama-server -hf " .. model .. " --port 11434 &> /dev/null &")
            vim.api.nvim_create_autocmd("VimLeavePre", {
                callback = vim.schedule_wrap(function()
                    io.popen("pkill llama-server") -- todo: check if any other nvim processes are using before killing
                end)
            })
        end
    end,
})

return {
    -- for auto completions
    {
        'milanglacier/minuet-ai.nvim',
        config = function()
            require('minuet').setup {
                n_completions = 1,

                virtualtext = {
                    auto_trigger_ft = { "*" },
                    disabled_auto_trigger_ft = { "NvimTree", "TelescopePrompt" },

                    keymap = {
                        accept_line = '<C-j>',
                    },
                },

                provider = 'openai_fim_compatible',
                -- context_window = 1024, 
                context_window = 512,
                provider_options = {
                    openai_fim_compatible = {
                        api_key = 'TERM',
                        name = 'Llama.cpp',
                        end_point = 'http://localhost:11434/v1/completions',
                        model = model,
                        optional = {
                            max_tokens = 56,
                            top_p = 0.9,
                        },
                    },
                    template = {
                        prompt = function(context_before_cursor, context_after_cursor, filename)
                            local file_header = (filename and filename ~= '')
                            and ('<|file_sep|>' .. filename .. '\n')
                            or ''

                            local suffix = context_after_cursor:gsub('^%s+', '')

                            return file_header
                            .. '<|fim_prefix|>'
                            .. context_before_cursor
                            .. '<|fim_suffix|>'
                            .. suffix
                            .. '<|fim_middle|>'
                        end,
                        suffix = false,
                    },
                }
            }
        end,
    },

    -- {
    --     "BlinkResearchLabs/blink-edit.nvim",
    --     config = function()
    --         require("blink-edit").setup({
    --             llm = {
    --                 provider = "sweep",
    --                 backend = "openai",
    --                 url = "http://localhost:11434",
    --                 model = "sweep",
    --             },
    --         })
    --     end,
    -- }
}
