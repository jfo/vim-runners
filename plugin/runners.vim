" nnoremap <F12> :runner
autocmd FileType ruby nmap <F12> <ESC>:w<CR>:!ruby %<CR>
autocmd FileType scheme nmap <F12> <ESC>:w<CR>:!petite --script %<CR>
