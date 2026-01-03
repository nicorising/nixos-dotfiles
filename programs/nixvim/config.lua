-- Helper for focusing on the editor

function FocusEditor()
    local ft = vim.bo.filetype
    if ft == 'toggleterm' then
        vim.cmd('wincmd h')
    elseif ft == 'neo-tree' then
        vim.cmd('wincmd l')
    end
end

-- Configure quitting to just close the current buffer
vim.api.nvim_create_user_command('Q', function(opts)
    FocusEditor()
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    if #buffers > 1 then
        if opts.bang then
            vim.cmd('bprevious | bdelete! #')
        elseif vim.bo.modified then
            vim.notify('E37: No write since last change (add ! to override)', vim.log.levels.ERROR)
        else
            vim.cmd('bprevious | bdelete #')
        end
    else
        if opts.bang then
            vim.cmd('bdelete!')
            vim.cmd('enew')
        elseif vim.bo.modified then
            vim.notify('E37: No write since last change (add ! to override)', vim.log.levels.ERROR)
        else
            vim.cmd('bdelete')
            vim.cmd('enew')
        end
    end
end, { bang = true })

vim.api.nvim_create_user_command('WQ', function()
    FocusEditor()
    vim.cmd('write')
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    if #buffers > 1 then
        vim.cmd('bprevious | bdelete #')
    else
        vim.cmd('bdelete')
        vim.cmd('enew')
    end
end, {})

vim.cmd('cnoreabbrev q Q')
vim.cmd('cnoreabbrev q! Q!')
vim.cmd('cnoreabbrev wq WQ')

-- Show diagnostic text when hovering

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})

-- Add border to LSP hover box

vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover({ border = 'rounded' })
end)

-- Auto-refresh Neo-tree/Gitsigns

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufWritePost', 'TermLeave' }, {
    callback = function()
        require('neo-tree.sources.manager').refresh('filesystem')
        vim.cmd('Gitsigns refresh')
    end,
})

-- Configure venv-selector

require("venv-selector").setup({})
