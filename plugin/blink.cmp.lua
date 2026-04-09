require("blink.cmp").setup({
    -- 按键映射
    keymap = {
        preset = "enter",
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-Space>"] = { "show", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
    },
    appearance = {
        nerd_font_variant = "mono",
    },
    -- 补全源配置
    sources = {
        default = { "lsp", "snippets", "path", "buffer" },
        providers = {
            lsp = {
                enabled = true,
                min_keyword_length = 0,
            },
            buffer = { enabled = true },
            path = { enabled = true },
            snippets = { enabled = true },
        },
    },
    -- Rust 模糊匹配器
    fuzzy = {
        implementation = "lua",
    },
    completion = {
        keyword = { range = "prefix" },
        menu = {
            draw = {
                treesitter = { "lsp" },
            },
        },
        trigger = { show_on_trigger_character = true },
        documentation = {
            auto_show = false,
            auto_show_delay_ms = 200,
        },
        list = {
            selection = {
                preselect = true,
            },
        },
    },
    signature = { enabled = true },
})