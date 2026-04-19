-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a' -- allow the mouse to be used in nvim

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Tab
vim.opt.tabstop = 4      -- number of visual spaces per TAB
vim.opt.softtabstop = 4  -- number of spaces in tab when editing
vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of Python

-- UI config
vim.opt.cursorline = true    -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true    -- open new vertical split bottom
vim.opt.splitright = true    -- open new horizontal splits right
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false     -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = false  -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- input
vim.opt.timeout = true
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)

-- 设置 leader 键为空格
vim.g.mapleader = " "

-- 设置 clipboard 为
-- vim.opt.clipboard = 'unnnamedplus'
--vim.g.clipboard = {
--    name = 'tmux',
--    copy = {
--        ['+'] = { 'tmux', 'load-buffer', '-' },
--        ['*'] = { 'tmux', 'load-buffer', '-' },
--    },
--    paste = {
--        ['+'] = { 'tmux', 'save-buffer', '-' },
--        ['*'] = { 'tmux', 'save-buffer', '-' },
--    },
--    cache_enabled = 0,
--}

-- 设置shell为bash
vim.opt.shell = "/bin/bash"
