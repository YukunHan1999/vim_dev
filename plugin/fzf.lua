vim.api.nvim_create_user_command('CustomFzf', function()

end, {})

-- 窗口布局：浮动窗口而不是 terminal buffer
vim.g.fzf_layout = {
    window = {
        width = 0.8,
        height = 0.8,
        border = 'rounded', -- 可选: single, double, rounded
    }
}

-- 历史记录目录：保存搜索历史
vim.g.fzf_history_dir = vim.fn.stdpath("data") .. "/fzf-history"

-- 预览配置：使用 bat 显示文件内容
vim.g.fzf_preview_command = "bat --style=numbers --color=always --line-range :500 {}"

-- 颜色配置：启用彩色图标
vim.g.fzf_colors = {
    fg      = { "fg" },
    bg      = { "bg" },
    hl      = { "fg", "Comment" },
    ["fg+"] = { "fg", "CursorLine" },
    ["bg+"] = { "bg", "CursorLine" },
    ["hl+"] = { "fg", "Statement" },
    info    = { "fg", "PreProc" },
    border  = { "fg", "Ignore" },
    prompt  = { "fg", "Conditional" },
    pointer = { "fg", "Exception" },
    marker  = { "fg", "Keyword" },
    spinner = { "fg", "Label" },
    header  = { "fg", "Comment" },
}

-- 默认选项 (传给 fzf 二进制)
vim.g.fzf_options = {
    ["--ansi"] = true,        -- 支持彩色输出
    ["--multi"] = true,       -- 支持多选
    --["--reverse"] = true,     -- 结果列表在上方
    ["--inline-info"] = true, -- 显示匹配信息
}
-- vim.g.fzf_files_options = { "--reverse" }
-- vim.g.fzf_buffers_options = { "--reverse" }
-- vim.g.fzf_commands_options = { "--reverse" }
-- vim.g.fzf_history_options = { "--reverse" }
--vim.g.fzf_changes_options = { "--reverse" }
--vim.g.fzf_colors_options = { "--reverse" }


vim.g.fzf_buffers_jump = 1 -- 打开已存在的buffer时自动跳转
