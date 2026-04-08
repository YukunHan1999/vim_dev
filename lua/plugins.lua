-- 1. 自动安装 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 2. 插件列表
require("lazy").setup({
  -- 主题
  { "tanvirtin/monokai.nvim" },

  -- 1. LSP 基础
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate" }, -- 自动下载二进制
  { "williamboman/mason-lspconfig.nvim", config = true  },

  -- 2. 补全引擎 (核心)
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  
  -- 3. Go 语言增强 (可选，但推荐用于自动格式化和导入)
  { "ray-x/go.nvim", dependencies = { "ray-x/guihua.lua" }, ft = {"go", "gomod"} },
})