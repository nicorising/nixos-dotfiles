-- Helper for focusing on the editor

function FocusEditor()
    local ft = vim.bo.filetype
    if ft == 'toggleterm' then
        vim.cmd('wincmd h')
    elseif ft == 'neo-tree' then
        vim.cmd('wincmd l')
    end
end

-- Configure quiting to just close the current buffer

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
            vim.cmd('quitall!')
        elseif vim.bo.modified then
            vim.notify('E37: No write since last change (add ! to override)', vim.log.levels.ERROR)
        else
            vim.cmd('quitall')
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
        vim.cmd('quitall')
    end
end, {})

vim.cmd('cnoreabbrev q Q')
vim.cmd('cnoreabbrev q! Q!')
vim.cmd('cnoreabbrev wq WQ')

-- Add border to LSP hover box

vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover({ border = 'rounded' })
end)
