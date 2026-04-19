-- 确保你已经安装了 nvim-treesitter 插件
-- 如果用 packer.nvim：
-- use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

-- Treesitter 配置
require("nvim-treesitter").setup({
  -- 启用语法高亮
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",        -- 初始化选择
      node_incremental = "grn",      -- 扩展到下一个节点
      scope_incremental = "grc",     -- 扩展到作用域
      node_decremental = "grm",      -- 缩小选择
    },
  },

  -- 启用缩进
  indent = {
    enable = true,
  },

  -- 启用代码折叠（基于语法树）
  -- 需要设置 foldmethod=expr 和 foldexpr
  -- 在 init.lua 里加：
  -- vim.opt.foldmethod = "expr"
  -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  -- 然后这里启用：
  fold = {
    enable = true,
  },
})

