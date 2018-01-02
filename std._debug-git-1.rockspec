local _MODREV, _SPECREV = 'git', '-1'

package = 'std._debug'
version = _MODREV .. _SPECREV

description = {
   summary = 'Debug Hints Library',
   detailed = [[
      Manage an overall debug state, and associated hint substates.
   ]],
   homepage = 'http://lua-stdlib.github.io/_debug',
   license = 'MIT/X11',
}

source = (function(gitp)
   if gitp then
      return {
         url = 'git://github.com/lua-stdlib/_debug.git',
      }
   else
      return {
         url = 'http://github.com/lua-stdlib/_debug/archive/v' .. _MODREV .. '.zip',
         dir = '_debug-' .. _MODREV,
      }
   end
end)(_MODREV == 'git')

dependencies = {
   'lua >= 5.1, < 5.4',
}

if _MODREV == 'git' then
   dependencies[#dependencies + 1] = 'ldoc'
end

build = {
   type = 'builtin',
   modules = {
      ['std._debug']		= 'lib/std/_debug/init.lua',
      ['std._debug.version']	= 'lib/std/_debug/version.lua',
   },
}
