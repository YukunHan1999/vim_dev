#!/bin/bash
DOT_DIR=$(cd "$(dirname "$0")"; pwd)
NV_CONF="$HOME/.config/nvim"

echo "正在部署兼容版 Neovim 配置..."
rm -rf "$NV_CONF/lua" "$NV_CONF/init.lua"
mkdir -p "$NV_CONF"

ln -sf "$DOT_DIR/init.lua" "$NV_CONF/init.lua"
ln -sfn "$DOT_DIR/lua" "$NV_CONF/lua"

echo "✅ 部署完成！打开 nvim 后它会自动下载管理器和插件。"