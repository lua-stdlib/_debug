local _MODREV, _SPECREV = 'git', '-1'

package = 'std._debug'
version = _MODREV .. _SPECREV

description = {
   summary = 'Debug Settings Library',
   detailed = [[
      Manage an overall debug state, and associated substates.
   ]],
   homepage = 'http://lua-stdlib.github.io/_debug',
   license = 'MIT/X11',
}

source = {
   url = 'git://github.com/lua-stdlib/_debug.git',
   --url = 'http://github.com/lua-stdlib/_debug/archive/v' .. _MODREV .. '.zip',
   --dir = '_debug-' .. _MODREV,
}

dependencies = {
   'lua >= 5.1, < 5.4',
   'ldoc',
}

build = {
   type = 'builtin',
   modules = {
      ['std._debug']		= 'lib/std/_debug/init.lua',
      ['std._debug.version']	= 'lib/std/_debug/version.lua',
   },
}
