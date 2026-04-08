local builtin = require('telescope.builtin')

require('telescope').setup({
    defaults = {
        -- 忽略编译生成的二进制文件
        file_ignore_patterns = { "%.o", "%.out", "%.a", "node_modules", "build/" },
        path_display = { "truncate" },
    }
})

-- 搜索快捷键
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '查找文件' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '全局搜索文字' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '查找打开的缓冲区' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '查找帮助文档' })
-- 特别适合 C 语言：搜索当前文件中的函数定义或变量
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = '查看当前文件符号' })