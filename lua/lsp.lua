-- lua/lsp.lua
local lspconfig = require('lspconfig')
local cmp = require('cmp')

-- 1. 初始化 Mason (管理 gopls 二进制)
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "gopls" } -- 确保自动安装 gopls
})

-- 2. 配置补全菜单 (nvim-cmp)
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- 来自 gopls 的补全
        { name = 'path' },     -- 路径补全
    }, {
        { name = 'buffer' },   -- 当前文件内容补全
    })
})

-- 3. 让 LSP 支持补全能力
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 4. 启动 gopls (Golang 专属配置)
lspconfig.gopls.setup({
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = true, -- 使用更严格的格式化
        },
    },
    on_attach = function(client, bufnr)
        -- 快捷键：保存时自动格式化并整理 import
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
                vim.lsp.buf.format({ async = false })
                -- 这里可以添加整理 import 的逻辑
            end,
        })
        
        -- 定义 LSP 快捷键
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)     -- 跳转定义
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)     -- 查找引用
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)           -- 查看文档
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- 重命名
    end
})

-- 在 lsp.lua 结尾添加，实现保存时自动整理 Import
function OrgImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        OrgImports(1000)
    end,
})