<!--
SPDX-FileCopyrightText: 2026 Darling Team
SPDX-License-Identifier: MPL-2.0
-->

# darling-testsuite

## Motivation/Goal

As contributors continue to implement macOS APIs into Darling, we need a way to verify that our macOS API implementation behaves the same way as Apple's official implementation.

The goal for this test suite is to provide a utility that can run test cases on both macOS and a third-party compatibility layer. In the long run, this test suite will be integrated into the CI/CD system that builds Darling.

## License

TODO: Add note about the following:
* Test cases being licensed under MIT-0.
* Other code (including the test case management library) being licensed under MPL2.

## How To Build & Run

Make sure the following dependencies are installed
* [CMake](https://cmake.org/)

```
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_OSX_ARCHITECTURES="arm64;x86_64" -GNinja
ninja
ninja test
```
