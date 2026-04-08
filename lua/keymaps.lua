-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- change mode
vim.keymap.set('i', 'jj', '<Esc>', opts)
vim.keymap.set('v', 'jj', '<Esc>', opts)

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set("n", "<A-a>", "<C-w>h", { desc = "Alt+h 左窗口" })
vim.keymap.set("n", "<A-s>", "<C-w>j", { desc = "Alt+j 右窗口" })
vim.keymap.set("n", "<A-w>", "<C-w>k", { desc = "Alt+k 上窗口" })
vim.keymap.set("n", "<A-d>", "<C-w>l", { desc = "Alt+l 下窗口" })
-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<A-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<A-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)