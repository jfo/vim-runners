" TODO:
" add error message when filetype is unknown
" add support for bang lines at beginning of file to override mappings
" add support for other languages
" make it output to separate split or tab and let it stay on the screen
" set up c make compile to tmp file and then delete it after running the
" output.


command! Run echo 'Interpreter unavailable'
autocmd FileType ruby command! Run w % | !ruby %
autocmd FileType scheme command! Run w % | !petite --script %
autocmd FileType python command! Run w % | !python %
