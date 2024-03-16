local HOME = os.getenv("HOME")

vim.opt.errorbells = false
-- " Highlights current line
vim.opt.cursorline = true
vim.opt.wrap = false
-- " For searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.undodir = HOME .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.path = vim.opt.path + "**"
-- " Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.so = 15
vim.opt.wildmenu = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = 'a'
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.showmode = false

vim.opt.termguicolors = true
vim.opt.spell = false
vim.opt.spelllang = 'en_ca'

vim.opt.list = true
vim.opt.listchars = 'tab:| '
