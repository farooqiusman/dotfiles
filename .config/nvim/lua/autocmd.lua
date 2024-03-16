vim.cmd([[
augroup syntax_things
	autocmd!
	autocmd BufRead *.asm exe "set ft=masm commentstring=;%s"
	autocmd BufRead *.c,*.h,*.cpp,*.hpp exe "set commentstring=//%s"
	autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END
]])

vim.cmd([[
augroup auto_save_things
	autocmd!
	autocmd BufWritePost *.tex exe "Dispatch! ~/scripts/compiler.sh '%'"
	autocmd BufWritePost ~/colors/* silent! execute "!xrdb ~/.Xresources" | redraw!
	autocmd BufWritePost *.Xresources silent! execute "!xrdb ~/.Xresources" | redraw!
augroup END
]])

vim.cmd([[
augroup troll_zain_lmao
	autocmd!
	autocmd BufReadPost COMMIT_EDITMSG setlocal colorcolumn=0 textwidth=0 | nmap <silent> <leader>z mzA @zainaraza43`z
augroup END
]])
