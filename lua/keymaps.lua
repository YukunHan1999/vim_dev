-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

-----------------
-- Normal mode --
-----------------
-- 编辑模式下的快捷键
vim.keymap.set({ 'i', 'v', 'c' }, '<A-,>', '<Esc>', opts) -- 退回到普通模式
vim.keymap.set('t', '<A-,>', '<C-\\><C-n>', opts)         -- 退回到普通模式
vim.keymap.set('n', '<A-r>', ':', opts)                                        -- 缓冲列表
vim.keymap.set('n', '<A-v>', '<C-v>', { noremap = true }) -- 进入V-BLOCK模式
vim.keymap.set('n', "<A-y>", function()
    vim.cmd("Commands");
end, opts)                                        -- 查询命令
vim.keymap.set("n", "bn", ":bnext<CR>", opts)     -- bn → 下一个缓冲区
vim.keymap.set("n", "bp", ":bprevious<CR>", opts) -- bp → 上一个缓冲区
vim.keymap.set("n", "bl", ":ls<CR>", opts)        -- bl → 列出所有缓冲区
vim.keymap.set("n", "bm", ":bd<CR>", opts)        -- ba → 删除当前缓冲区
-- Better window navigation
vim.keymap.set("n", "<A-a>", "<C-w>h", { desc = "Alt+h 左窗口" })
vim.keymap.set("n", "<A-x>", "<C-w>j", { desc = "Alt+j 下窗口" })
vim.keymap.set("n", "<A-w>", "<C-w>k", { desc = "Alt+k 上窗口" })
vim.keymap.set("n", "<A-d>", "<C-w>l", { desc = "Alt+l 右窗口" })
-- Resize with arrows
vim.keymap.set('n', '<A-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<A-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<A-w>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-q>', ':q<CR>', { noremap = true, silent = true })

-- Copy to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')

-----------------
-- Visual mode --
-----------------
vim.keymap.set('v', '<A-i>', '<gv', opts)
vim.keymap.set('v', '<A-j>', '>gv', opts)
