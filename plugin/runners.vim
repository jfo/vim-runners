" TODO: 
" add error message when filetype is unknown
" add support for bang lines at beginning of file to override mappings
" add support for other languages
" make it output to separate split or tab and let it stay on the screen
" set up c make compile to tmp file and then delete it after running the
" output.
"
" nnoremap <F12> :runner
autocmd FileType ruby nmap <F12> <ESC>:w<CR>:!ruby %<CR>
autocmd FileType scheme nmap <F12> <ESC>:w<CR>:!petite --script %<CR>
