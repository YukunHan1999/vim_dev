-- 确保历史记录目录存在
local history_dir = vim.fn.stdpath("data")
if vim.fn.isdirectory(history_dir) == 0 then
    vim.fn.mkdir(history_dir, "p")
end

require('fzf-lua').setup({
    fzf_opts = {
        -- 窗口
        ['--border'] = 'none', -- single, double, none
        ['--info'] = 'inline', -- inline, inline-right
        ['--prompt'] = ' /',
        ['--no-multi'] = true,
        ['--layout'] = 'default', -- default, reverse, reverse-list
        ['--history'] = history_dir .. '/fzf-lua-history',
    },

    -- 颜色：自动从 Neovim 配色方案生成 (推荐)
    fzf_colors = true,
})
