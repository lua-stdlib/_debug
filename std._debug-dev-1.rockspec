local _MODREV, _SPECREV = 'dev', '-1'

package = 'std._debug'
version = _MODREV .. _SPECREV

rockspec_format = '3.0'

description = {
   summary = 'Debug Hints Library',
   detailed = [[
      Manage an overall debug state, and associated hint substates.
   ]],
   homepage = 'https://lua-stdlib.github.io/_debug',
   license = 'MIT/X11',
}

source = {
   url = 'https://github.com/lua-stdlib/_debug/archive/v' .. _MODREV .. '.zip',
   dir = '_debug-' .. _MODREV,
}

dependencies = {
   'lua >= 5.1, < 5.6',
}


build_dependencies = {
   'luarocks-build-luke >= 0.3.1',
}

build = {
   type = 'luke',

   modules = {
      {['std._debug']         = 'lib/std/_debug/init.lua'},
      {['std._debug.version'] = 'lib/std/_debug/version.lua.in'},
   },

   -- A release commits its LDocs to install.
   copy_directories = {'doc'},
}

test_dependencies = {
   'luacov',
   'specl >= 17.2.2',
}

test = {
   type = 'command',
   command = 'specl -vfreport --coverage spec/*_spec.yaml',
}

if _MODREV == 'dev' then
   -- luarocks.org's ldoc fails on Lua 5.5; gvvaughan's works.
   build_dependencies[#build_dependencies + 1] = 'gvvaughan/ldoc'

   -- Stamp a development build with who made it, and from which commit.
   build.version = '$USER/$gitref'

   build.copy_directories = nil

   source = {
      url = 'git+https://github.com/lua-stdlib/_debug.git',
   }
end
