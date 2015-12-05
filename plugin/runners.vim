" TODO:
" add error message when filetype is unknown
" add support for bang lines at beginning of file to override mappings
" add support for even more other languages
" make it output to separate split or tab and let it stay on the screen?!
" set up c make compile to tmp file and then delete it after running the
" output.

command! -nargs=1 SilentRunner
\ | execute ':!'.<q-args>
\ | execute ':redraw!'
\ | execute ':!./a.out'
\ | execute ':!rm a.out'

function! Runners()
  command! Run echo 'Interpreter unavailable'

  if (&ft=='ruby')
    :command! Run w % | !ruby %
  elseif (&ft=='swift')
    :command! Run w % | !swift %
  elseif (&ft=='chuck')
    :command! Run w % | !chuck %
  elseif (&ft=='markdown')
    :command! Run w % | !markdown %
  elseif (&ft=='scheme')
    :command! Run w % | !petite --script %
  elseif (&ft=='php')
    :command! Run w % | !php %
  elseif (&ft=='python')
    command! Run w % | !python %
  elseif (&ft=='javascript')
    command! Run w % | !node %
  elseif (&ft=='scala')
    command! Run w % | !scala %
  elseif (&ft=='c')
    command! Run w % | SilentRunner cc -std=c99 -Wall % -ledit
  elseif (&ft=='arduino')
    command! Run w % | !ino build && ino upload
  elseif (&ft=='haskell')
    command! Run w % | !runhaskell %
  elseif (&ft=='lisp')
    command! Run w % | !clisp %
  endif

endfunction

autocmd BufEnter call Runners()
