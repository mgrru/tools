vim.g.mapleader = " "

local keymap = vim.keymap

---------- 插入模式 -----------


---------- 视觉模式 -----------

-- 块移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


---------- 正常模式 -----------

-- 窗口创建
-- 水平窗口
keymap.set("n", "<leader>sv", "<C-w>v")
-- 垂直窗口
keymap.set("n", "<leader>sh", "<C-w>s")
