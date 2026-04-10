-- lua/lsp.lua
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- ===== 跳转到定义 =====
    vim.keymap.set("n", "gd", "<Cmd>LspDefinition<CR>", opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gc", vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)


    -- ===== 上步 / 下一步（跳跃历史）=====
    vim.keymap.set("n", "<A-j>", "<C-o>", opts)
    vim.keymap.set("n", "<A-k>", "<C-i>", opts)

    -- ===== 其他功能 =====
    vim.keymap.set("n", "<Leader>f", "<Cmd>lua vim.lsp.buf.format()<CR>", opts)
    -- 开启 0.12 的参数提示
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})