-- File: after/plugin/spell.lua

-- Enable spell checking
vim.opt.spell = true
vim.opt_local.spelllang = { 'en_us' }

-- Configure the spell suggestion window
vim.opt.spellsuggest = "best,10"  -- Show only the best 10 suggestions

-- Override the default z= behavior
vim.keymap.set('n', 'z=', function()
    -- Save current window settings
    local win_config = vim.api.nvim_win_get_config(0)
    
    -- Create a temporary buffer for suggestions
    local buf = vim.api.nvim_create_buf(false, true)
    
    -- Get the current word under cursor
    local word = vim.fn.expand('<cword>')
    
    -- Get suggestions
    local suggestions = vim.fn.spellsuggest(word, 10)
    
    -- Format suggestions with numbers
    local lines = {}
    for i, suggestion in ipairs(suggestions) do
        table.insert(lines, string.format("%d. %s", i, suggestion))
    end
    
    -- Set buffer content
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    
    -- Calculate position (right side of main window)
    local width = 30
    local height = #lines
    local row = vim.fn.winline() - 1
    local col = vim.api.nvim_win_get_width(0) - width
    
    -- Create floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'win',
        row = row,
        col = col,
        width = width,
        height = height,
        style = 'minimal',
        border = 'rounded'
    })
    
    -- Set window options
    vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Normal')
    
    -- Add keymaps for this buffer
    for i = 1, 9 do
        vim.keymap.set('n', tostring(i), function()
            -- Replace word with suggestion
            vim.cmd('normal! ciw' .. suggestions[i])
            -- Close the suggestion window
            vim.api.nvim_win_close(win, true)
        end, { buffer = buf, silent = true })
    end
    
    -- Press q or <Esc> to close the window
    vim.keymap.set('n', 'q', function()
        vim.api.nvim_win_close(win, true)
    end, { buffer = buf, silent = true })
    
    vim.keymap.set('n', '<Esc>', function()
        vim.api.nvim_win_close(win, true)
    end, { buffer = buf, silent = true })
    
    -- Make the buffer close itself when leaving
    vim.api.nvim_create_autocmd('BufLeave', {
        buffer = buf,
        once = true,
        callback = function()
            vim.api.nvim_win_close(win, true)
        end
    })
end, { silent = true })
