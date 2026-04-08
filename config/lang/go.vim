" Go 使用制表符而不是空格
setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

" 保存时自动调用 CoC 运行：代码格式化 + 自动整理 Import
autocmd BufWritePre *.go silent! call CocAction('runCommand', 'editor.action.organizeImport')