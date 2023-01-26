module;

#include <iostream>

export module test;

// I didn't have to name this namespace the same as the module, but it
// seems like a good convention.
namespace test {

// Functions like this need to be explicitly marked for export.
export void hello()
{
  std::cout << "Hello World" << std::endl;
}

}
