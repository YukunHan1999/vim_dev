-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}

-- change mode
vim.keymap.set({ 'i', 'v', 'c' }, '<A-,>', '<Esc>', opts) -- 退回到普通模式
vim.keymap.set('t', '<A-,>', '<C-\\><C-n>', opts)         -- 退回到普通模式
vim.keymap.set({ 'n', 'v', 't' }, '<A-h>', ':', opts)
vim.keymap.set('n', '<A-q>', ':q<CR>', opts)
vim.keymap.set('n', '<A-w>', ':w<CR>', opts)
vim.keymap.set({ 'n', 'i', 'c', 't' }, '<A-r>', '<CR>', { noremap = true })
vim.keymap.set({ 'n', 'i', 'c', 't' }, '<A-k>', '<BS>', { noremap = true })

vim.keymap.set('v', '<A-i>', '<gv', opts)
vim.keymap.set('v', '<A-j>', '>gv', opts)
vim.keymap.set('v', '<A-v>', [[:s/^/\/\/ /<CR>]], opts)
vim.keymap.set('v', '<A-g>', [[:silent! s/^\s*\/\/\s\?//<CR>]], opts)
-- buffer change
vim.keymap.set('n', '<A-v>', '<C-v>', { noremap = true }) -- 进入V-BLOCK模式
vim.keymap.set('n', "<A-y>", function()
    vim.cmd("Commands");
end, opts)                                        -- 查询命令
vim.keymap.set("n", "bd", ":bnext<CR>", opts)     -- bd → 下一个缓冲区
vim.keymap.set("n", "ba", ":bprevious<CR>", opts) -- ba → 上一个缓冲区
vim.keymap.set("n", "bw", ":ls<CR>", opts)        -- bw → 列出所有缓冲区
vim.keymap.set("n", "bs", ":bd<CR>", opts)        -- bs → 删除当前缓冲区
-- Better window navigation
vim.keymap.set("n", "<leader>a", "<C-w>h", { desc = "<leader>a 左窗口" })
vim.keymap.set("n", "<leader>s", "<C-w>j", { desc = "<leader>s 下窗口" })
vim.keymap.set("n", "<leader>w", "<C-w>k", { desc = "<leader>w 上窗口" })
vim.keymap.set("n", "<leader>d", "<C-w>l", { desc = "<leader>d 右窗口" })
vim.keymap.set('n', '<leader>Up', ':resize +2<CR>', opts)
vim.keymap.set('n', '<leader>Down', ':resize -2<CR>', opts)
vim.keymap.set('n', '<leader>Left', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<leader>Right', ':vertical resize +2<CR>', opts)
-- Copy to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
-- Rust run 
vim.keymap.set({ 'n' }, '<leader>r', ':!cargo run<CR>', opts)

