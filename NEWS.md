# Stdlib NEWS - User visible changes

## Noteworthy changes in release ?.? (????-??-??) [?]

### New features

  - std._debug is built from the `build` table of its rockspec, by the
    `luarocks-build-luke` LuaRocks build backend, which LuaRocks
    installs for the build, so there is no `build-aux/luke` build to
    run, and no build without LuaRocks.  Building LDocs, which a release
    commits, no longer needs a build dependency of its own.


## Noteworthy changes in release 1.2 (2026-10-21) [stable]

### New features

  - std._debug builds with luke instead of make.  To install current
    git master, use the `std._debug-dev-1.rockspec`:

    ```bash
    luarocks install https://raw.githubusercontent.com/lua-stdlib/_debug/master/std._debug-dev-1.rockspec
    ```


## Noteworthy changes in release 1.1.0 (2026-07-25) [stable]

### New Features

  - Initial support for Lua 5.5.

### Bug fixes

  - Correct self arguments in metamethod declarations.


## Noteworthy changes in release 1.0.1 (2018-09-22) [stable]

### New Features

  - Initial support for Lua 5.4.


## Noteworthy changes in release 1.0 (2017-10-14) [stable]

### New features (since lua-stdlib-41.2)

  - Initial release, now separated out from lua-stdlib.

  - An entirely new API, which does not use global `_DEBUG` at all.
