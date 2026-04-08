" C 语言特有设置
setlocal cindent            " 使用 C 语言标准的缩进风格
" 针对 C 的快捷键：在 .h 和 .c 之间切换 (需安装 vim-scripts/a.vim 插件)
nnoremap <leader>as :A<CR>
" 配合 clangd 的格式化
nnoremap <leader>f :call CocAction('format')<CR>