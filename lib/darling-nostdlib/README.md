# darling-nostdlib

## Disclaimer

The functions in `darling-nostdlib` are not feature complete compared to the standard C library. These function are error-prone and buggy. 

I do not recommend using these functions outside of testing XNU syscalls. 

## Motivation

One of the motivations for directly testing XNU syscalls is to provide test cases for any compatibility layer that supports running static Mach-O executables.

This, however, means that we can't link to any library, including the standard C library. So as a result, we will need to implement our own libc-like library.
