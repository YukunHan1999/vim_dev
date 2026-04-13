-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- 单手友好符号映射（全部以 o 开头）
vim.keymap.set('i', 'oo', '!', opts)   -- oa → !
vim.keymap.set('i', 'o2', '@', opts)   -- oa → @
vim.keymap.set('i', 'o3', '#', opts)   -- oh → #
vim.keymap.set('i', 'o4', '$', opts)   -- od → $
vim.keymap.set('i', 'o5', '%', opts)   -- op → %
vim.keymap.set('i', 'o6', '^', opts)   -- oc → ^
vim.keymap.set('i', 'o7', '&', opts)   -- of → &
vim.keymap.set('i', 'o8', '*', opts)   -- os → *
vim.keymap.set('i', 'o9', '(', opts)   -- ol → (
vim.keymap.set('i', 'o0', ')', opts)   -- or → )
vim.keymap.set('i', 'oq', '_', opts)   -- oq → _
vim.keymap.set('i', 'ow', '+', opts)   -- ow → +
vim.keymap.set('i', 'oe', '{', opts)   -- oe → {
vim.keymap.set('i', 'or', '}', opts)   -- or → }
vim.keymap.set('i', 'oy', '|', opts)   -- oy → |
vim.keymap.set('i', 'oj', ':', opts)   -- oj → :
vim.keymap.set('i', 'ou', '?', opts)   -- ou → ?
vim.keymap.set('i', 'oi', '<', opts)   -- oi → <
vim.keymap.set('i', 'op', '>', opts)   -- op → >
vim.keymap.set('i', 'ot', '~', opts)   -- ot → ~
vim.keymap.set('i', 'oz', '-', opts)   -- oz → -
vim.keymap.set('i', 'ox', '=', opts)   -- ox → =
vim.keymap.set('i', 'od', '[', opts)   -- od → [
vim.keymap.set('i', 'of', ']', opts)   -- of → ]
vim.keymap.set('i', 'ok', "'", opts)   -- ok → '
vim.keymap.set('i', 'og', '\\', opts)  -- og → \
vim.keymap.set('i', 'ov', '/', opts)   -- ov → /

vim.keymap.set('i', 'kk', '<CR>', opts) -- kk → Enter
vim.keymap.set('i', 'ss', '<Tab>', opts) -- ss → Tab
vim.keymap.set('i', '<A-k>', '<BS>', opts) -- Alt+k → Backspace

-- 编辑模式下的快捷键
vim.keymap.set({ 'i', 'v', 'c' }, '<A-s>', '<Esc>', opts) -- 退回到普通模式
vim.keymap.set('n', '<A-r>', ':', opts) -- 进入命令行模式
vim.keymap.set('n', "<A-y>", function()
  vim.cmd("Files")
end, opts) -- 打开文件搜索
vim.keymap.set("n", "bn", ":bnext<CR>", opts)   -- bn → 下一个缓冲区
vim.keymap.set("n", "bp", ":bprevious<CR>", opts)   -- bp → 上一个缓冲区
vim.keymap.set("n", "bl", ":ls<CR>", opts)      -- bl → 列出所有缓冲区
vim.keymap.set("n", "bm", ":bd<CR>", opts)      -- ba → 删除当前缓冲区

-----------------
-- Normal mode --
-----------------
-- Hint: see `:h vim.map.set()`
vim.keymap.set('n', 'ok', ':', opts) -- oo → :
-- Better window navigation
vim.keymap.set("n", "<A-a>", "<C-w>h", { desc = "Alt+h 左窗口" })
vim.keymap.set("n", "<A-x>", "<C-w>j", { desc = "Alt+j 下窗口" })
vim.keymap.set("n", "<A-w>", "<C-w>k", { desc = "Alt+k 上窗口" })
vim.keymap.set("n", "<A-d>", "<C-w>l", { desc = "Alt+l 右窗口" })
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