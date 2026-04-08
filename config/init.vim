" 定义配置根目录，方便后续模块调用
let g:vim_cfg = expand('~/.vim/config/')

" 设置 Leader 键为空格（大佬标配）
" 必须在加载任何映射之前设置，否则部分插件的默认映射会乱掉
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" 强制使用 UTF-8 编码
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936

" 确保在不同 Shell 下路径识别正确
if has('win32') || has('win64')
    let g:is_windows = 1
else
    let g:is_windows = 0
endif

" 自动创建持久化撤销目录
if !isdirectory(expand('~/.vim/undodir'))
    call mkdir(expand('~/.vim/undodir'), "p")
endif

" 如果使用某些插件需要临时目录
if !isdirectory(expand('~/.vim/tmp'))
    call mkdir(expand('~/.vim/tmp'), "p")
endif

" 预设 NERDTree 的一些显示图标
let g:NERDTreeWinSize = 30