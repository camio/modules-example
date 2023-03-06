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

# Modules (.cppm) generate a .pcm
%.pcm : %.cppm
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) --precompile $^ -o $@

# Precompiled modules (.pcm) generate a .o
%.o : %.pcm
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $^ -o $@

# Same as the above two rules, but done in one call to the compiler. This won't have
# as much parallelism as the above.
# %.pcm %.o &: %.cppm
# 	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -fmodule-output=$(addsuffix .pcm,$(basename $^)) -c $^ -o $(addsuffix .o,$(basename $^))

# It's important to specify that building main.o depends on the *compiled*
# module file. That allows the build system to build in the correct order.
main.o: main.cpp test.pcm

# This is standard
main: main.o test.o
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) $^ -o $@
