#!/bin/bash
curl -LO https://github.com/neovim/neovim/releases/download/v0.12.1/nvim-linux-x86_64.tar.gz
rm -rf $HOME/.software/nvim-linux-x86_64
mkdir -p $HOME/.software/
tar -C $HOME/.software/ -xzf nvim-linux-x86_64.tar.gz
rm -rf ./nvim-linux-x86_64.tar.gz

# 1. 定义物理路径
# Neovim 0.12 会自动加载 pack/*/start/ 下的所有插件
PACK_DIR="$HOME/.local/share/nvim/site/pack/bundle/start"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
DOT_DIR=$(cd "$(dirname "$0")"; pwd)

echo "🚀 1. 开始下载插件"

# 2. 创建目录
rm -rf "$PACK_DIR"
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
install_plugin "folke/tokyonight.nvim"
install_plugin "catppuccin/nvim"

install_plugin "nvim-treesitter/nvim-treesitter" # 语法高亮

install_plugin "neovim/nvim-lspconfig"          # LSP 基础
install_plugin "williamboman/mason.nvim"        # 工具管理
install_plugin "williamboman/mason-lspconfig.nvim"

install_plugin "saghen/blink.cmp"               # 补全引擎
install_plugin "rafamadriz/friendly-snippets"   # 代码片段

install_plugin "nvim-telescope/telescope.nvim"  # 文件搜索

install_plugin "nvim-lualine/lualine.nvim"      # 状态栏

install_plugin "lewis6991/gitsigns.nvim"        # git集成

install_plugin "stevearc/conform.nvim"          # 格式化工具

install_plugin "p00f/clangd_extensions.nvim"    # 提供内联提示（Inlay Hints）、宏展开预览、类型层次结构查看
install_plugin "mfussenegger/nvim-dap"          # 在 Nvim 里打断点的前提
install_plugin "Civitasv/cmake-tools.nvim"      # 如果你的项目超过 3 个文件，用它管理 CMakeLists.txt 会非常轻松
install_plugin "nvim-lua/plenary.nvim"
echo "--------------------------------"

echo "🚀 2. 开始加载配置"
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
ln -sfn "$DOT_DIR/snippets" "$NVIM_CONFIG_DIR/snippets"

echo 'export PATH=$PATH:$HOME/.software/nvim-linux-x86_64/bin' >> ~/.bashrc

echo 'TODO: source ~/.bashrc'

echo "✅ 3. 部署完成！"
echo "提示：由于使用了原生加载，打开 nvim 即可直接使用。"