" 定义配置目录路径
let g:vim_config_path = expand('~/.vim/config/')

" 加载基础设置
execute 'source ' . g:vim_config_path . 'settings.vim'

" 加载插件管理
execute 'source ' . g:vim_config_path . 'plugins.vim'

" 加载快捷键映射
execute 'source ' . g:vim_config_path . 'mapping.vim'

" 加载 CoC 专用设置
execute 'source ' . g:vim_config_path . 'coc-config.vim'