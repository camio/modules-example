.PHONY: all clean

# Needs Clang 15 or greater
CXX:= clang++

# Turn on C++20 mode which includes modules
CXXFLAGS:=-std=c++20

# Specify where prebuilt modules are placed. This is similar to '-I' for include
# files.
CPPFLAGS:=-fprebuilt-module-path=.

all: main

clean:
	$(RM) main *.o *.pcm

# Modules (.cppm) generate a .pcm instead of a .o as specified below
%.pcm: %.cppm
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) --precompile $^ -o $@

# It's important to specify that building main.o depends on the *compiled*
# module file. That allows the build system to build in the correct order.
main.o: main.cpp test.pcm

# This is standard
main: main.o test.pcm
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $^ -o $@
