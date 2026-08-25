function map_mode(mode, key, command)
    vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = true })
end

function map(key, command)
    if type(command) == "string" then
        vim.api.nvim_set_keymap("n", key, command, { noremap = true, silent = true })
    else
        vim.keymap.set("n", key, command)
    end
end

function in_git_folder()
    local cmd = vim.system({ "git", "status" }, { text = false }):wait()
    return cmd.code == 0
end

