vim-runners
===========

This is a very simple plugin that dynamically knows how to run a bunch of
common filetypes through their associated interpreter.

The `Run` command will save the buffer to disk, then execute what is usually
the equivalent of

```viml
:!<languagename> <filename>
```

like

```viml
:!ruby ./a_script_that_does_something_that_is_in_this_buffer_rn.rb
```

Currently supports:
- Ruby
- Python
- PHP
- JavaScript (via node)
- Bash
- a few more!

C
=
If a makefile named "makefile" exists in the working directory, `Run` will
attempt to execute a rule called 'run', essentially delegating its behavior to
the makefile. The run rule would likely rely on the main executable rule, and
might or might not clean up after itself, but you could do whatever you want in
there. If no makefile is found, `Run` will try to compile the current
file on its own into `./vrun.out`, execute it, and clean up after
itself by deleting it. Useful for quickly trying out something in a lone `main()`.

On entry into a buffer, Run is redefined to refer to the appropriate command
for that filetype. If no mapping is found, `Run` will echo 'Interpreter unavailable'

I mapped `Run` to `<LEADER>g` and I lost 5 pounds.

License
-------

Copyright (c) Jeff Fowler.  Distributed under the same terms as Vim itself a la Tim Pope.
See `:help license`.
