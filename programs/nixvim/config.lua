-- Configure quiting to just close the current buffer

vim.api.nvim_create_user_command('Q', function(opts)
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
            vim.cmd('Neotree close')
            vim.cmd('quitall!')
        elseif vim.bo.modified then
            vim.notify(
                'E37: No write since last change (add ! to override)',
                vim.log.levels.ERROR
            )
        else
            vim.cmd('Neotree close')
            vim.cmd('quitall')
        end
    end
end, { bang = true })

vim.api.nvim_create_user_command('WQ', function()
    vim.cmd('write')
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    if #buffers > 1 then
        vim.cmd('bprevious | bdelete #')
    else
        vim.cmd('Neotree close')
        vim.cmd('quitall')
    end
end, {})

vim.cmd('cnoreabbrev q Q')
vim.cmd('cnoreabbrev q! Q!')
vim.cmd('cnoreabbrev wq WQ')
