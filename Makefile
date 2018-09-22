# Debug Hints Library for Lua 5.1, 5.2, 5.3 & 5.4
# Copyright (C) 2002-2018 std._debug authors

LDOC	= ldoc
LUA	= lua
MKDIR	= mkdir -p
SED	= sed
SPECL	= specl

VERSION	= 1.0.1

luadir	= lib/std/_debug
SOURCES =				\
	$(luadir)/init.lua		\
	$(luadir)/version.lua		\
	$(NOTHING_ELSE)


all: $(luadir)/version.lua


$(luadir)/version.lua: .FORCE
	@echo 'return "Debug hints library / $(VERSION)"' > '$@T';		\
	if cmp -s '$@' '$@T'; then						\
	    rm -f '$@T';							\
	else									\
	    echo 'echo return "Debug hints library / $(VERSION)" > $@';		\
	    mv '$@T' '$@';							\
	fi

doc: build-aux/config.ld $(SOURCES)
	$(LDOC) -c build-aux/config.ld .

build-aux/config.ld: build-aux/config.ld.in
	$(SED) -e "s,@PACKAGE_VERSION@,$(VERSION)," '$<' > '$@'


CHECK_ENV = LUA=$(LUA)

check: $(SOURCES)
	LUA=$(LUA) $(SPECL) $(SPECL_OPTS) spec/*_spec.yaml


.FORCE:
