# darling-testsuite

## Motivation/Goal

As contributors continue to implement macOS APIs into Darling, we need a way to verify that our macOS API implementation behaves the same way as Apple's official implementation.

The goal for this test suite is to provide a utility that can run test cases on both macOS and a third-party compatibility layer. In the long run, this test suite will be integrated into the CI/CD system that builds Darling.

## License

Unlike other Darling projects, this repo is licensed under the MIT-0 (MIT No Attribution) license.

The intention of the MIT-0 license is to allow any developer to use our test cases as a reference for implementing functionality in their proprietary applications, without needing to worry about crediting us or releasing the source code.

## How To Build & Run

Make sure the following dependencies are installed
* [CMake](https://cmake.org/)

```
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_OSX_ARCHITECTURES="arm64;x86_64" -GNinja
ninja
ninja test
```
