#!/bin/bash
# 自动获取当前脚本所在目录的绝对路径
DOT_DIR=$(cd "$(dirname "$0")"; pwd)

# 创建 ~/.vim 目录结构
mkdir -p ~/.vim/undodir
# mkdir -p ~/.vim/config

# 强制链接主 vimrc
ln -sf "$DOT_DIR/vimrc" ~/.vimrc

# 链接整个 config 目录（包含 lang 子目录）
# 这样你在仓库里新增 lang/rust.vim，Vim 也能直接读取
ln -sfn "$DOT_DIR/config" ~/.vim/config

echo "模块化开发环境已就绪！"
# 安装 vim-plug 并自动下载插件
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

vim +PlugInstall +qall

echo "模块化 Vim 环境部署完成！"