-- Gruvbox Material 配置
vim.g.gruvbox_material_background = "medium" -- 可选: 'soft', 'medium', 'hard'
vim.g.gruvbox_material_foreground = "mix"    -- 可选: 'material', 'mix', 'original'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_transparent_background = 0
vim.g.gruvbox_material_ui_contrast = "high"
vim.g.gruvbox_material_statusline_style = "mix" -- 可选: 'default', 'mix', 'original'

vim.cmd("colorscheme gruvbox-material")

-- 动画效果
require("mini.animate").setup({
    cursor = {
        enable = true,
    },
    scroll = {
        enable = true,
    },                          -- 平滑滚动
    resize = { enable = true }, -- 窗口缩放动画
    open = { enable = true },
    close = { enable = true },
})

require("lualine").setup({
    options = {
        theme = "gruvbox-material",
        icons_enabled = false,
        section_separators = { "", "" },
        component_separators = { "|", "|" },
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
})

require("bufferline").setup({
    options = {
        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = true,
        buffer_close_icon = "x",
        modified_icon = "●",
        close_icon = "x",
        new_tab_icon = "+",
    }
})

-- LSP 诊断颜色适配
vim.cmd("hi! DiagnosticError guifg=#fb4934")
vim.cmd("hi! DiagnosticWarn guifg=#fabd2f")
vim.cmd("hi! DiagnosticHint guifg=#83a598")
vim.cmd("hi! DiagnosticInfo guifg=#83a598")
