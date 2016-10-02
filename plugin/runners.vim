" __   _(_)_ __ ___        _ __ _   _ _ __  _ __   ___ _ __ ___
" \ \ / / | '_ ` _ \ _____| '__| | | | '_ \| '_ \ / _ \ '__/ __|
"  \ V /| | | | | | |_____| |  | |_| | | | | | | |  __/ |  \__ \
"   \_/ |_|_| |_| |_|     |_|   \__,_|_| |_|_| |_|\___|_|  |___/
"   Run a thing from inside vim real easy like.
"   Make everything feel like a script.

function! Runners()

    if exists("g:custom_run")
        :command! Run w % | :echo g:custom_run | :execute "!" . g:custom_run

    " scripty scripty langs! js depends on node.
    elseif (&ft=='ruby')
        :command! Run w % | !ruby %
    elseif (&ft=='python')
        command! Run w % | !python %
    elseif (&ft=='php')
        :command! Run w % | !php %
    elseif (&ft=='javascript')
        :command! Run w % | !node %

    elseif (&ft=='sh')
        :command! Run w % | !bash %

    " C magick: if a makefile exists, `Run` will attempt to execute a rule
    " called 'run', essentially delegating its behavior to the makefile. The
    " run rule would likely rely on the main executable rule, and might or
    " might not clean up after itself, but you could do whatever you want in
    " there.
    elseif (&ft=='c')
        if filereadable("./makefile")
            command! Run w % | :make! -s run
        else
            " if no makefile is found, `Run` will try to compile the current
            " file on its own into `vrun.out`, execute it, and clean up after
            " itself. Useful for quickly trying out something in a lone main()
            command! Run w % | :!cc -Wall -Werror % -o vrun.out && ./vrun.out && rm vrun.out
        endif

    elseif (&ft=='rust')
        if (filereadable("./Cargo.toml") && filereadable("./src/main.rs") && !filereadable("./src/lib.rs"))
            command! Run w % | :!cargo run
        elseif (filereadable("./Cargo.toml") && !filereadable("./src/main.rs") && filereadable("./src/lib.rs"))
            command! Run w % | :!cargo build
        else
            " if no makefile is found, `Run` will try to compile the current
            " file on its own into `vrun.out`, execute it, and clean up after
            " itself. Useful for quickly trying out something in a lone main()
            :command! Run w % | :!rustc % -o vrun.out && ./vrun.out && rm vrun.out
        endif

    " Some less common but useful langs to have around:
    elseif (&ft=='scala')
        :command! Run w % | !scala %
    elseif (&ft=='swift')
        :command! Run w % | !swift %
    elseif (&ft=='go')
        :command! Run w % | !go run %


    " Stuff you probably don't need:
    elseif (&ft=='chuck')
        " Chuck is an awesome music language!
        :command! Run w % | !chuck %
    elseif (&ft=='markdown')
        " Who actually used the original markdown perl script anymore anyway?
        :command! Run w % | !markdown %

    " lol lisp
    elseif (&ft=='lisp')
        :command! Run w % | !clisp %
    elseif (&ft=='scheme')
        " relies on Petite Chez Scheme, an interpreted version of Chez Scheme.
        :command! Run w % | !petite --script %
    elseif (&ft=='sild')
        :command! Run w % | !./sild %

    elseif (&ft=='haskell')
        " I've never even written haskell why is this even here.
        :command! Run w % | !runhaskell %

    elseif (&ft=='vim')
        " how could I have forgotten?
        :command! Run w % | source %
    else
        :command! Run echo 'Interpreter unavailable'
    endif
endfunction

" On entry into a buffer, Runners() is called to redefine `Run` to refer to
" the appropriate command.
:autocmd BufEnter * :call Runners()
