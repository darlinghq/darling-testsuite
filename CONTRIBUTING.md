<!--
SPDX-FileCopyrightText: 2026 Darling Team
SPDX-License-Identifier: MPL-2.0
-->

Thank you for taking an interest in contributing to the darling-testsuite project!

# Breakdown Of The Testsuite

## REUSE compliance

This project's workflow uses [reuse](https://reuse.software/) to make sure all files are properly licensed.

For each file you create, make sure to add the SPDX in the comment header:
<!--
REUSE-IgnoreStart
-->
```c
// SPDX-FileCopyrightText: <YEAR> <NAME>
// SPDX-License-Identifier: <LICENSE>
```
<!--
REUSE-IgnoreEnd
-->

For files where you can't add the SPDX inside a file, use the `.license` extension. For example:
> `example.bin` <-- A binary file that doesn't support header comments.\
> `example.bin.license` <-- File that holds the SPDX information

For more details, please refer to the [REUSE Specification](https://reuse.software/spec-3.3/#comment-headers).

## Difference Between `testsuite` and `testsuite-kernel`

* `testsuite` is for testing code that is implemented in a library or framework.
  * The testsuite's path is based on the library's location. For example, the testsuite for `AddressBook.framework` is located in `testsuite/System/Library/Frameworks/AddressBook.framework`.
* `testsuite-kernel` is for testing syscalls.

## Types of Test Cases

There are three types of test cases you can create:

| Test Type | Requires Manual Setup | Requires Manually Verifying The Results |
| --- | --- | --- |
| **Automated** | No | No |
| **Semi-Automated** | Yes | No |
| **Manual** | Either yes or no | Yes |

You should always strive to have all or many of your test cases be fully automated.

For test cases that can’t be fully automated, the program must print instructions on setting up or verifying the test case.

# Template

For your convenience, we provided a template if you ever need to create a new testsuite for a library/framework:

**For `testsuite`:**\
[template/testsuite_example.dylib](template/testsuite_example.dylib)

**For `testsuite-kernel`:**\
TODO

