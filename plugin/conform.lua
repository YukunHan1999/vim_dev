require("conform").setup({
    formatters_by_ft = {
        -- 为 C 和 C++ 指定格式化工具
        c = { "clang-format" },
        cpp = { "clang-format" },
    },
    -- 保存时自动格式化
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
    -- 格式化工具的详细参数
    formatters = {
        ["clang-format"] = {
            -- 如果项目根目录有 .clang-format 文件则使用它，否则使用 LLVM 风格
            prepend_args = { "-style=file", "--fallback-style=LLVM" },
        },
    },
})