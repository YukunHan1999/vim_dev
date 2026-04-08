" 定义配置目录路径
let g:vim_config_path = expand('~/.vim/config/')

" 1. 顺序加载通用模块
for f in ['init.vim', 'plugins.vim', 'settings.vim', 'mapping.vim', 'theme.vim', 'coc-setup.vim']
    execute 'source ' . g:vim_cfg . f
endfor

" 2. 自动根据文件类型加载专属配置
augroup LangSpecificConfig
    autocmd!
    autocmd FileType c,cpp  execute 'source ' . g:vim_config_path . 'lang/c.vim'
    autocmd FileType go     execute 'source ' . g:vim_config_path . 'lang/go.vim'
    autocmd FileType python execute 'source ' . g:vim_config_path . 'lang/python.vim'
augroup END