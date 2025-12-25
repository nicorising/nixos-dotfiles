vim.api.nvim_create_user_command('Q', function()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  if #buffers > 1 then
    vim.cmd('bdelete')
  else
    vim.cmd('quit')
  end
end, {})

vim.api.nvim_create_user_command('WQ', function()
  vim.cmd('write')
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  if #buffers > 1 then
    vim.cmd('bdelete')
  else
    vim.cmd('quit')
  end
end, {})

vim.cmd('cnoreabbrev q Q')
vim.cmd('cnoreabbrev wq WQ')
