
TARGET := yourexecutable

SOURCES := src/a.c   \
           src/b.c 


# C compiler command
CC := cc

# C compiler flags
CFLAGS := -g -Wextra

# linker flags, e.g. -L<lib dir> if you have libraries
# in a nonstandard directory <lib dir>
LDFLAGS := -L/home/takayuki/data/build/libuv/libuv

# libraries to pass to the linker, e.g. -l<library>
LIBS := -luv -lpthread -lrt

# Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
# you have headers in a nonstandard directory <include dir>
CPPFLAGS := -I/home/takayuki/data/build/libuv/libuv/include -I./include

# C preprocessor
CPP :=

# C++ compiler command
CXX := 

# C++ compiler flags
CXXFLAGS :=

# C++ preprocessor
CXXCPP := 

objects := $(subst .c,.o,$(SOURCES))


all: $(TARGET)
.PHONY: clean

$(TARGET): $(objects)
	$(CC) $(LDFLAGS) $(objects) $(LIBS) -o $@

clean:
	rm -rf $(objects) $(TARGET) .deps *.d

.deps: $(SOURCES)
	$(CC) $(CFLAGS) $(CPPFLAGS) -MM $^ > ./.deps

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

-include .deps

