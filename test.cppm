export module test;

// <iostream> doesn't work for me. Don't know why yet.
#include <cstdio>

// I didn't have to name this namespace the same as the module, but it
// seems like a good convention.
namespace test {

// Functions like this need to be explicitly marked for export.
export void hello()
{
  printf("Hello World\n");
}

}
