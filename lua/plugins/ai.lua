local model = "Qwen/Qwen2.5-Coder-7B-Instruct-GGUF"

local function is_running()
    local f = io.popen("pidof llama-server")
    if f then
        local result = f:read("*a")
        f:close()
        return result and string.len(result) > 0
    end
    return false
end

if not is_running() then
    io.popen("llama-server -hf " .. model .. " --port 11434 &> /dev/null &")
    vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
            io.popen("pkill llama-server")
        end
    })
end

return {
    -- for auto completions
    {
        'milanglacier/minuet-ai.nvim',
        config = function()
            require('minuet').setup {
                n_completions = 1, -- test, only generate 1 completion

                virtualtext = {
                    auto_trigger_ft = { "*" },
                    disabled_auto_trigger_ft = { "NvimTree", "TelescopePrompt" },

                    keymap = {
                        -- accept = '<C-y>',
                        accept_line = '<C-j>',
                        -- accept_n_lines = '<A-z>',
                        -- prev = '<C-[>', -- breaks esc
                        -- next = '<C-]>',
                        -- dismiss = '<A-e>',
                    },
                },

                provider = 'openai_fim_compatible',
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
                        template = {
                            prompt = function(context_before_cursor, context_after_cursor, _)
                                return '<|fim_prefix|>'
                                    .. context_before_cursor
                                    .. '<|fim_suffix|>'
                                    .. context_after_cursor
                                    .. '<|fim_middle|>'
                            end,
                            suffix = false,
                        },
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
