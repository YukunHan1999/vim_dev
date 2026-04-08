require("clangd_extensions").setup({
    server = {
        -- 这里填入你之前在 lspconfig 里的配置
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
    },
    extensions = {
        -- 自动开启内联提示（参数名、推导类型）
        autoSetHints = true,
        -- 提示的视觉效果
        inlay_hints = {
            inline = vim.fn.has("nvim-0.10") == 1,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
        },
        -- 内存布局查看器配置
        memory_usage = {
            border = "none",
        },
        symbol_info = {
            border = "none",
        },
    },
})

-- 特殊功能绑定：查看结构体内存布局 (对于分析 Union 非常有用)
vim.keymap.set('n', '<leader>cl', '<cmd>ClangdSymbolInfo<cr>', { desc = '查看符号信息' })
vim.keymap.set('n', '<leader>cm', '<cmd>ClangdMemoryUsage<cr>', { desc = '查看内存占用' })
vim.keymap.set('n', '<leader>ct', '<cmd>ClangdTypeHierarchy<cr>', { desc = '查看类型层级' })