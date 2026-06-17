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
        ["<Space>"] = { "accept", "fallback" },
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
        keyword = { range = "full" },
        menu = {
            auto_show = true,
            draw = {
                treesitter = { "lua", "markdown" },
                columns = {
                    { "label",     "label_description", gap = 1 },
                    { "kind_icon", "kind" }
                },
            },
        },
        trigger = { show_on_trigger_character = true },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        },
        list = {
            selection = {
                preselect = false,
                auto_insert = false,
            },
        },
        ghost_text = { enabled = true },
    },
    signature = { enabled = true },
})
