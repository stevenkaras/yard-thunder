[Yard-Thunder](http://stevenkaras.github.com/yard-thunder)
=======
[YARD](http://yardoc.org) plugin for [Thunder](http://stevenkaras.github.com/thunder) integration.

Code is based upon yard-thor by Loren Segal (who also maintains YARD itself). Way to go Loren!

Usage
-----

    gem install yard-thunder

    yard --plugin thunder COMMANDS

When you are writing your documentation, it's important to place any comments with YARDoc in them above the def of the method itself. This requires more knowledge of how YARD passes and handles comments than what I currently have.

Goals
-----
Provide integration for Thunder CLI programs with YARD

Development Phases

1. integrate options into the generated docs for a command
2. provide a section called "CLI usage" for each command (method)
3. handle subcommands (along with all the other stuff)
4. add a CLI usage section/file in the YARD output (manpage style)
5. activate only if Thunder is included (or has been included in a parent class)

Development
-----------
If you'd like to contribute, fork, commit, and request a pull. I'll get around to it. No special dependencies, or anything fancy

License
-------
MIT License