--[[
 Debug Settings Library for Lua 5.1, 5.2 & 5.3
 Copyright (C) 2011-2017 Gary V. Vaughan
 Copyright (C) 2002-2014 Reuben Thomas <rrt@sc3d.org>
]]
--[[
 Manage an overall debug state, and associated substates.

 Set or change the deug state by calling the returned functor with
 no argument to reset to defaults, `true` to enable all substates,
 or `false` to disable all debugging:

    local _debug = require 'std._debug' (false)

 Query substates by indexing the returned table:

    local isstrict = _debug.strict

 Beware that even though you can change std._debug state at any time,
 stdlib libraries are configured at load time according to the state
 at the time they are loaded - e.g. changing _debug.strict after
 require 'std' does not affect the strict environment created for the
 'std' module when it was loaded.

 @module std._debug
]]



local _DEBUG = 'default'


-- Request specific debug substates.
--
-- Use `__call` metamethod to request all substates on or off at once.
-- Note that none of the features described here are implemented, this is
-- merely a central location to record requests; other modules you load
-- subsequently may or may not choose to comply.
-- @table _debug
-- @bool[opt=true] argcheck `true` if runtime argument checking is desired
-- @bool[opt] deprecate `nil` if deprecated api warnings are desired;
--   `false` if deprecated apis without warnings are desired; `true` if
--   removal of deprecated apis is preferred
-- @int[opt=1] level debugging level
-- @bool[opt=true] strict `true` if strict enforcement of variable declaration
--   before use is desired
-- @usage
--    require 'std._debug'.argcheck = false
local spec = {
   argcheck  = { default=true,  safe=true,    fast=false},
   deprecate = { default=nil,   safe=true,    fast=false},
   level     = { default=1,     safe=1,       fast=math.huge},
   strict    = { default=true,  safe=true,    fast=false},
}


local metatable = {
   --- Metamethods
   -- %section metamethods

   --- Set the overall debug state.
   -- @function __call
   -- @bool[opt] enable or disable all debugging substates
   -- @treturn table states
   -- @usage
   --   -- Enable all debugging substates
   --   local _debug = require 'std._debug'(true)
   __call = function(_, x)
      if x == true then
         _DEBUG = 'safe'
      elseif x == false then
         _DEBUG = 'fast'
      elseif x == nil then
         _DEBUG = 'default'
      else
         error("bad argument #1 to '_debug' (boolean or nil expected, got " .. type(x) .. ')', 2)
      end
      return self
   end,

   --- Lazy loading of std._debug modules.
   -- Don't load everything on initial startup, wait until first attempt
   -- to access a submodule, and then load it on demand.
   -- @function __index
   -- @string name submodule name
   -- @treturn table|nil the submodule that was loaded to satisfy the missing
   --    `name`, otherwise `nil` if nothing was found
   -- @usage
   --   local version = require 'std._debug'.version
   __index = function(self, name)
      local v = spec[name]
      if type(v) == 'table' then
         return v[_DEBUG]
      elseif v ~= nil then
         return v
      end
      local ok, r = pcall(require, 'std._debug.' .. name)
      if ok then
         spec[name] = r
         return r
      end
   end,
}


return setmetatable({}, metatable)
