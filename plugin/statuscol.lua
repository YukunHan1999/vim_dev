-- 使用 lazy.nvim 或 packer 安装插件：
-- "luukvbaal/statuscol.nvim"

-- 配置脚本
require("statuscol").setup({
    -- 核心过滤：忽略终端和非文件缓冲区，这是解决闪烁的关键
    bt_ignore = { "terminal", "nofile" },

    -- 可选过滤：在文件树、启动页等界面不显示状态列
    ft_ignore = { "neo-tree", "lazy", "mason", "alpha" },

    -- 建议开启，让光标行的相对行号显示在绝对行号右侧，视觉上更统一
    relculright = true,

    segments = {
        -- 1. 折叠指示符（可选）
        {
            text = { "%C" },
            click = "v:lua.ScFa"
        },

        -- 2. 诊断符号，仅显示错误，并固定为1列宽
        {
            sign = { namespace = { "diagnostic/signs" }, maxwidth = 1, colwidth = 1 },
            click = "v:lua.ScSa"
        },

        -- 3. 其他符号（如 Git 标记），同样固定为1列宽
        {
            sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true, wrap = true },
            click = "v:lua.ScSa"
        },

        -- 4. 行号，直接使用性能更优的内置函数
        { text = { require("statuscol.builtin").lnumfunc, " " }, click = "v:lua.ScLa" },
    },

})

-- 启用行号
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
