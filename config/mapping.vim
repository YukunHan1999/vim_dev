" 模式切换映射
inoremap jj <Esc>
vnoremap jj <Esc>

" 窗口切换优化：Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 搜索居中优化（配合你之前的逻辑）
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" 快速清理搜索高亮
nnoremap <leader><CR> :nohlsearch<CR>