#!/bin/bash

# 创建配置目录
mkdir -p ~/.vim/config
mkdir -p ~/.vim/undodir

# 假设你的源文件在 ~/vim_dev/ 下
# 建立链接
ln -sf ~/vim_dev/vimrc ~/.vimrc
ln -sf ~/vim_dev/config/settings.vim ~/.vim/config/settings.vim
ln -sf ~/vim_dev/config/plugins.vim ~/.vim/config/plugins.vim
ln -sf ~/vim_dev/config/mapping.vim ~/.vim/config/mapping.vim
ln -sf ~/vim_dev/config/coc-config.vim ~/.vim/config/coc-config.vim

# 安装 vim-plug 并自动下载插件
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +PlugInstall +qall

echo "模块化 Vim 环境部署完成！"