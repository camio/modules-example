# Modules Example

This repository is a very simple C++ modules example. It consists of a
[Makefile](Makefile), a module [test.cppm](test.cppm), and a
[main.cpp](main.cpp) that uses it. The intent is that this code be useful for
those why are trying to learn how modules work with the (at the time of this
writing) newly released Clang 15 compiler. See [the Clang Standard C++ Modules
page](https://releases.llvm.org/15.0.0/tools/clang/docs/StandardCPlusPlusModules.html)
for more details.

# Build/Run

This project can be built with the following command,

```
make
```

If Clang 15 or later is not in your path, you can instead specify it on the
command line as follows:

```
make CXX=/path/to/clang++-15
```

The generated executable is called `main` and can be run from the command line
once built.

```
./main
```
