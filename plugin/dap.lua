local dap = require('dap')

-- 1. 配置适配器：告诉 DAP 如何运行 gdb
dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "-i", "mi", "--interpreter=mi2", "--quiet" }
}

-- 2. 配置 C/C++ 启动项
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
            -- 自动建议当前目录下的可执行文件
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        -- 如果你需要向程序传递参数，可以在这里添加
        args = {},
    },
}

-- C 语言共享 C++ 的配置
dap.configurations.c = dap.configurations.cpp

-- 3. 快捷键映射 (习惯：F5 运行，F9 断点)
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)