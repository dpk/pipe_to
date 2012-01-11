pipe_to
=======

`pipe_to` adds methods `pipe_to` and `|` to the String class,
allowing you to do things like this:

	"hello world \n this is a test".pipe_to 'grep test'  # => " this is a test\n"
	"hello world \n this is a test" | :rev               # => " dlrow olleh\ntset a si siht \n"

If you use a Mac and you want to copy a string to the clipboard, just use:

	"a string" | :pbcopy

or to your text editor:

	"a string" | :bbedit
	"a string" | :mate

