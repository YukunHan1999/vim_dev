-- lua/lsp.lua

-- 1. 注册配置
vim.lsp.config('ty', require('lsp.ty'))
vim.lsp.config('gopls', require('lsp.go'))

-- 2. 批量使能
vim.lsp.enable({ 'ty', 'gopls' })

-- 3. Go 特有的自动行为：保存时自动格式化 + 自动导入
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
        else
          vim.lsp.buf.execute_command(r)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

-- 4. 通用 LSP 绑定
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
    
    -- 开启 0.12 的参数提示
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})