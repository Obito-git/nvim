vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.clipboard:append("unnamedplus")
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true })
vim.g.mapleader = " "
