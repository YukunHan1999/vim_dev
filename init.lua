-- 设置 Leader
vim.g.mapleader = " "

-- 按顺序加载
require("options")
require("keymaps")
require("plugins") -- 插件加载
require("lsp")