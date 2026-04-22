-- 进入时回调
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("silent! clearjumps")
    vim.cmd("silent! clearchanges")
    vim.cmd("silent! %bdelete")
  end,
})

-- 定义函数：支持通配符展开
vim.api.nvim_create_user_command("BufferOpen", function(opts)
  for _, pat in ipairs(opts.fargs) do
    local files = vim.fn.glob(pat, false, true)  -- 展开通配符
    for _, f in ipairs(files) do
      vim.cmd("edit " .. f)
    end
  end
end, {
    nargs = "+",
    complete = "file", -- 可选项 file, buffer, command, help, custom
})
-- ==========================================================================
