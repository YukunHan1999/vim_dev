-- 使用 lazy.nvim 或 packer 安装插件：
-- "luukvbaal/statuscol.nvim"

-- 配置脚本
require("statuscol").setup({
  relculright = true, -- 相对行号右对齐
  segments = {
    -- signcolumn：显示错误提示、断点、折叠标记等
    { text = { "%s" }, click = "v:lua.ScSa" },

    -- 绝对行号
    { text = { function(args) return string.format("%3d", args.lnum) end }, click = "v:lua.ScLa" },

    -- 分隔符
    { text = { " " } },

    -- 相对行号
    { text = { function(args) return string.format("%3d", args.relnum) end }, click = "v:lua.ScLa" },
  }
})

-- 启用行号
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
