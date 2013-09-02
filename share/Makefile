
EXETARGET := 
LIBTARGET := libmy

CSOURCES := list.c
CXXSOURCES := 

# 
UNAME := $(shell uname)

# C compiler command
CC := cc
CXX := c++

# C compiler flags
CFLAGS := -g -Wextra -std=c99

# C++ compiler flags
CXXFLAGS := -g -Wextra

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

# C++ preprocessor
CXXCPP := 

objects := $(subst .cc,.o,$(CXXSOURCES))
#objects := $(subst .c,.o,$(CSOURCES))


# targets
ifdef EXETARGET
TARGET += $(EXETARGET)
endif

ifdef LIBTARGET
LIBVERSION ?= 1
ATARGET := $(LIBTARGET).a

CFLAGS += -fPIC

ifeq ($(UNAME),Linux)
	SOTARGET := $(LIBTARGET).so.$(LIBVERSION)
	LNTARGET := $(LIBTARGET).so
	LDFLAGS += -shared -Wl,-soname,$(SOTARGET)
else ifeq ($(UNAME),Darwin)
	SOTARGET := $(LIBTARGET).$(LIBVERSION).dylib
	LNTARGET := $(LIBTARGET).dylib
	LDFLAGS += -dynamiclib -Wl,-install_name,@rpath/$(SOTARGET),-current_version,$(LIBVERSION)
endif

TARGET += $(SOTARGET) $(ATARGET) $(LNTARGET)

endif

.PHONY: clean
all:: $(TARGET)

clean:
	rm -rf $(objects) $(TARGET) .deps *.d core *.a *.so *.dylib $(TARGET)

.deps: $(CXXSOURCES) $(CSOURCES)
	if [ $(CSOURCES) ]; then $(CC) $(CFLAGS) $(CPPFLAGS) -MM $(CSOURCES) > ./.deps; fi
	if [ $(CXXSOURCES) ]; then $(CXX) $(CXXFLAGS) $(CPPFLAGS) -MM $(CXXSOURCES) > ./.deps; fi

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

%.o: %.cc
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

$(EXETARGET): $(objects)
	$(CXX) $(LDFLAGS) $(LIBS) $^ -o $@

$(SOTARGET): $(objects)
	$(CXX) $(LDFLAGS) $(LIBS) $^ -o $@

$(ATARGET): $(objects)
	$(AR) cru $@ $^
	ranlib $@

$(LNTARGET): $(SOTARGET)
	ln -s $< $@

-include .deps
