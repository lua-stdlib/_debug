Debug Hints Library
===================

Copyright (C) 2002-2017 [std._debug authors][authors]

[![License](http://img.shields.io/:license-mit-blue.svg)](http://mit-license.org)
[![travis-ci status](https://secure.travis-ci.org/lua-stdlib/_debug.png?branch=release-v1.0)](http://travis-ci.org/lua-stdlib/_debug/builds)
[![codecov.io](https://codecov.io/gh/lua-stdlib/_debug/branch/master/graph/badge.svg)](https://codecov.io/gh/lua-stdlib/_debug)
[![Stories in Ready](https://badge.waffle.io/lua-stdlib/_debug.png?label=ready&title=Ready)](https://waffle.io/lua-stdlib/_debug)


This is a debug hints management library for Lua 5.1 (including LuaJIT),
5.2 and 5.3. The library is copyright by its authors 2002-2017 (see the
[AUTHORS][] file for details), and released under the [MIT license][mit]
(the same license as Lua itself). There is no warranty.

`std._debug` has no run-time prerequisites beyond a standard Lua system.

[authors]: http://github.com/lua-stdlib/_debug/blob/master/AUTHORS.md
[github]: http://github.com/lua-stdlib/_debug/ "Github repository"
[lua]: http://www.lua.org "The Lua Project"
[mit]: http://mit-license.org "MIT License"


Installation
------------

The simplest and best way to install this library is with [LuaRocks][].
To install the latest release (recommended):

```bash
    luarocks install std._debug
```

To install current git master (for testing, before submitting a bug
report for example):

```bash
    luarocks install http://raw.githubusercontent.com/lua-stdlib/_debug/master/stdlib-git-1.rockspec
```

The best way to install without [LuaRocks][] is to copy the `std`
folder and its contents into a directory on your package search path.

[luarocks]: http://www.luarocks.org "Lua package manager"


Documentation
-------------

The latest release of these libraries is [documented in LDoc][github.io].
Pre-built HTML files are included in the release.

[github.io]: http://lua-stdlib.github.io/_debug


Bug reports and code contributions
----------------------------------

These libraries are written and maintained by their users.

Please make bug reports and suggestions as [GitHub Issues][issues].
Pull requests are especially appreciated.

But first, please check that your issue has not already been reported by
someone else, and that it is not already fixed by [master][github] in
preparation for the next release (see Installation section above for how
to temporarily install master with [LuaRocks][]).

There is no strict coding style, but please bear in mind the following
points when proposing changes:

0. Follow existing code. There are a lot of useful patterns and avoided
   traps there.

1. 3-character indentation using SPACES in Lua sources: It makes rogue
   TABS easier to see, and lines up nicely with 'if' and 'end' keywords.

2. Simple strings are easiest to type using single-quote delimiters,
   saving double-quotes for where a string contains apostrophes.

3. Save horizontal space by only using SPACES where the parser requires
   them.

4. Use vertical space to separate out compound statements to help the
   coverage reports discover untested lines.

[issues]: http://github.com/lua-stdlib/_debug/issues
