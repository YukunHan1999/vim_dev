#!/bin/bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
mkdir -p $HOME/.software
rm -rf $HOME/.software/nvim-linux-x86_64
tar -C $HOME/.software -xzf nvim-linux-x86_64.tar.gz
echo 'export PATH="$PATH:$HOME/.software/nvim-linux-x86_64/bin"' >> ~/.bashrc
source ~/.bashrc
rm -rf ./nvim-linux-x86_64.tar.gz

# 1. 定义物理路径
# Neovim 0.12 会自动加载 pack/*/start/ 下的所有插件
PACK_DIR="$HOME/.local/share/nvim/site/pack/bundle/start"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
DOT_DIR=$(cd "$(dirname "$0")"; pwd)

echo "🚀 开始原生模式部署 (Neovim 0.12.1)..."

# 2. 创建目录
mkdir -p "$PACK_DIR"
mkdir -p "$NVIM_CONFIG_DIR"

# 3. 插件下载函数 (适配 Golang 开发)
install_plugin() {
    local repo=$1
    local name=$(basename "$repo")
    if [ ! -d "$PACK_DIR/$name" ]; then
        echo "正在安装: $name ..."
        git clone --depth 1 "https://github.com/$repo.git" "$PACK_DIR/$name"
    else
        echo "已存在: $name"
    fi
}

echo "--------------------------------"
# 这里是你需要的核心插件
install_plugin "tanvirtin/monokai.nvim"         # 主题
install_plugin "neovim/nvim-lspconfig"          # LSP 基础
install_plugin "williamboman/mason.nvim"        # 工具管理
install_plugin "williamboman/mason-lspconfig.nvim"
install_plugin "hrsh7th/nvim-cmp"               # 补全引擎
install_plugin "hrsh7th/cmp-nvim-lsp"           # LSP 源
install_plugin "hrsh7th/vim-vsnip"              # Snippet 引擎
install_plugin "hrsh7th/cmp-vsnip"              # Snippet 源
echo "--------------------------------"

mkdir -p ~/snap/code/current/.local/share/nvim/site/pack/bundle/start/
sudo cp -r "$PACK_DIR" ~/snap/code/current/.local/share/nvim/site/pack/bundle/

# 4. 建立配置文件软链接
echo "正在映射目录结构..."
# 清理旧链接
rm -rf "$NVIM_CONFIG_DIR/lua"
rm -rf "$NVIM_CONFIG_DIR/lsp"
rm -rf "$NVIM_CONFIG_DIR/plugin"
rm -f "$NVIM_CONFIG_DIR/init.lua"

# 建立新链接
ln -sf "$DOT_DIR/init.lua" "$NVIM_CONFIG_DIR/init.lua"
ln -sfn "$DOT_DIR/lua" "$NVIM_CONFIG_DIR/lua"
ln -sfn "$DOT_DIR/plugin" "$NVIM_CONFIG_DIR/plugin"
ln -sfn "$DOT_DIR/lsp" "$NVIM_CONFIG_DIR/lsp"

echo "✅ 部署完成！"
echo "提示：由于使用了原生加载，打开 nvim 即可直接使用。"