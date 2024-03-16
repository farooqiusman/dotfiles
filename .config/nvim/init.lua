--=======================================
--=    _______   _     _   _    _____
--=   (_______) (_)   (_) | | (_______)
--=    _     _   _     _  | |  _  _  _
--=   | |   | | | |   | | | | | ||_|| |
--=   | |   | |  \ \ / /  | | | |   | |
--=   |_|   |_|   \___/   |_| |_|   |_|
--=
--=======================================

require('opts')
require('plugins')
require('keymaps')
require("autocmd")

-- vim.g.gruvbox_transparent_bg = "soft"
-- vim.g.gruvbox_italic = 0
-- vim.g.gruvbox_transparent_bg = 1
vim.cmd('colorscheme dracula')

vim.cmd([[ command! W execute("w") ]])
vim.cmd([[ command! Q execute("q") ]])
vim.cmd([[ com! Date execute("read !date '+\\%b \\%d, \\%G'") ]])

vim.cmd([[
function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
]])

-- vim.cmd([[
-- hi User1 guifg=black guibg=gray    ctermfg=black ctermbg=gray
-- hi User2 guifg=black guibg=blue    ctermfg=black ctermbg=blue
-- hi User3 guifg=black guibg=magenta ctermfg=black ctermbg=magenta
-- hi User4 guifg=black guibg=yellow  ctermfg=black ctermbg=yellow
-- hi User5 guifg=black guibg=cyan    ctermfg=black ctermbg=cyan
-- hi User6 guifg=white guibg=black   ctermfg=white  ctermbg=black
-- ]])
vim.cmd([[
hi! NormalColor		guifg=black guibg=white		ctermfg=black	ctermbg=gray
hi! InsertColor		guifg=black guibg=#fabd2f	ctermfg=black	ctermbg=214
hi! ReplaceColor	guifg=black guibg=#b8bb26	ctermfg=black	ctermbg=142
hi! VisualColor		guifg=black guibg=#d3869b	ctermfg=black	ctermbg=175
hi! User6	guifg=white	guibg=black	ctermfg=white	ctermbg=black
]])

-- Highlight things you yank
vim.api.nvim_create_autocmd("TextYankPost",
	{ pattern = "*", callback = function() vim.highlight.on_yank({ timeout = 70 }) end })

vim.cmd([[
let g:currentmode={
	\ 'n'  : 'NORMAL',
	\ 'v'  : 'VISUAL',
	\ 'V'  : 'V·Line',
	\ '' : 'V·Block',
	\ 'i'  : 'INSERT',
	\ 'R'  : 'R',
	\ 'Rv' : 'V·Replace',
	\ 'c'  : 'COMMAND',
	\ 's'  : 'SELECT',
	\ 't'  : 'FINDER',
	\}
]])

vim.opt.laststatus = 3
