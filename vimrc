" 定义配置目录路径
let g:vim_config = expand('~/.vim/config/')

" 1. 顺序加载通用模块
for f in ['init.vim', 'plugins.vim', 'settings.vim', 'mapping.vim', 'theme.vim']
    execute 'source ' . g:vim_config . f
endfor