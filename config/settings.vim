syntax on
set number              " 显示行号
set nobackup            " 不产生备份文件
set nowritebackup
set updatetime=300      " 提高响应速度（默认 4000ms 太慢）
set shortmess+=c        " 不显示各种冗余提示
set signcolumn=yes      " 总是显示侧边栏（防止代码左右抖动）
set termguicolors       " 开启真彩色支持
set clipboard=unnamedplus   " 与系统剪贴板同步
set hidden              " 允许在未保存时切换 buffer
set tabstop=4           " Tab 宽度
set shiftwidth=4
set expandtab           " Tab 转空格
set autoindent          " 自动缩进
set hlsearch            " 高亮搜索
set ignorecase          " 搜索忽略大小写
set smartcase           " 智能大小写
set undofile            " 开启持久化撤销
set undodir=~/.vim/undodir

set timeout             " 开启针对“映射序列”的超时检测
set timeout=500         " 等待映射序列完成的时间