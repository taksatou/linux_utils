EXETARGET := 
LIBTARGET := libims

SOURCES := list.c

# 
UNAME := $(shell uname)

# C compiler command
CC := cc

# C compiler flags
CFLAGS := -g -Wextra -std=c99

# linker flags, e.g. -L<lib dir> if you have libraries
# in a nonstandard directory <lib dir>
LDFLAGS :=

# libraries to pass to the linker, e.g. -l<library>
LIBS := -lpthread

# Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
# you have headers in a nonstandard directory <include dir>
CPPFLAGS := 

# C preprocessor
CPP :=

# C++ compiler command
CXX := 

# C++ compiler flags
CXXFLAGS :=

# C++ preprocessor
CXXCPP := 

objects := $(subst .c,.o,$(SOURCES))

# targets
ifdef EXETARGET
TARGET += $(EXETARGET)
endif

ifdef LIBTARGET
LIBVERSION ?= 1
SOTARGET := $(LIBTARGET).so.$(LIBVERSION)
ATARGET := $(LIBTARGET).a
LNTARGET := $(LIBTARGET).so

CFLAGS += -fPIC
TARGET += $(SOTARGET) $(ATARGET) $(LNTARGET)

ifeq ($(UNAME),Linux)
	LDFLAGS += -Wl,-soname,$(SOTARGET)
else ifeq ($(UNAME),Darwin)
	LDFLAGS += -Wl,-install_name,$(SOTARGET)
endif

endif

.PHONY: clean
all:: $(TARGET)

clean:
	rm -rf $(objects) $(TARGET) .deps *.d core

.deps: $(SOURCES)
	$(CC) $(CFLAGS) $(CPPFLAGS) -MM $^ > ./.deps

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

$(EXETARGET): $(objects)
	$(CC) $(LDFLAGS) $(LIBS) $^ -o $@

$(SOTARGET): $(objects)
	$(CC) -shared $(LDFLAGS) $^ -o $@

$(ATARGET): $(objects)
	$(AR) cru $@ $^
	ranlib $@

$(LNTARGET): $(SOTARGET)
	ln -s $< $@

-include .deps
