<!--
SPDX-FileCopyrightText: 2026 Darling Team
SPDX-License-Identifier: MPL-2.0
-->

In the past, the `PubSub.framework` used to live in the `Frameworks` folder.

In later versions of macOS, Apple has moved the `PubSub.framework` implementation into the `PrivateFrameworks` folder. They also added a symlink from the public framework to the private framework.

```
DarlingHQ-macOS-1014:~ darling$ ls -l /System/Library/Frameworks/ | grep PubSub
lrwxr-xr-x   1 root  wheel   37 Feb 28  2025 PubSub.framework -> ../PrivateFrameworks/PubSub.framework
```

This framework was removed in macOS 10.15.

TODO: Figure out which version of macOS moved `PubSub.framework` into the `PrivateFrameworks` folder.

# Credits

* https://github.com/darlinghq/darling/pull/1717#issuecomment-4152743424
