// SPDX-FileCopyrightText: 2026 Lubos Dolezel
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    @autoreleasepool {
        NSScrollView *scrollView = [NSTextView scrollableTextView];
        assert_equals_BOOL("[scrollView isKindOfClass:[NSScrollView class]]", YES, [scrollView isKindOfClass:[NSScrollView class]]);

        // The text view is the scroll view's document view.
        NSTextView *textView = [scrollView documentView];
        assert_equals_BOOL("[textView isKindOfClass:[NSTextView class]]", YES, [textView isKindOfClass:[NSTextView class]]);
        assert_equals_BOOL("[textView enclosingScrollView] == scrollView", YES, [textView enclosingScrollView] == scrollView);
        assert_equals_BOOL("isEditable", YES, [textView isEditable]);
        assert_equals_BOOL("isSelectable", YES, [textView isSelectable]);

        // Scrolls vertically only.
        assert_equals_BOOL("hasVerticalScroller", YES, [scrollView hasVerticalScroller]);
        assert_equals_BOOL("hasHorizontalScroller", NO, [scrollView hasHorizontalScroller]);

        // Text wraps at the width of the view, which grows downwards.
        assert_equals_BOOL("isVerticallyResizable", YES, [textView isVerticallyResizable]);
        assert_equals_BOOL("isHorizontallyResizable", NO, [textView isHorizontallyResizable]);
        assert_equals_BOOL("([textView autoresizingMask] & NSViewWidthSizable) != 0", YES, ([textView autoresizingMask] & NSViewWidthSizable) != 0);
        assert_equals_BOOL("widthTracksTextView", YES, [[textView textContainer] widthTracksTextView]);
        assert_equals_BOOL("heightTracksTextView", NO, [[textView textContainer] heightTracksTextView]);

        // The height is effectively unbounded (macOS 27 reports 10,000,000).
        assert_equals_BOOL("[textView maxSize].height >= 10000000", YES, [textView maxSize].height >= 10000000);
        assert_equals_BOOL("[[textView textContainer] containerSize].height >= 10000000", YES, [[textView textContainer] containerSize].height >= 10000000);

        // The text view follows the width of the visible area.
        [scrollView setFrame:NSMakeRect(0, 0, 300, 200)];
        assert_equals_CGFloat("textView width", [scrollView contentSize].width, [textView frame].size.width);

        // Text longer than the visible area makes the text view taller than it.
        NSMutableString *text = [NSMutableString string];
        for (int i = 0; i < 40; i++)
            [text appendString:@"line\n"];
        [textView setString:text];
        [[textView layoutManager] ensureLayoutForTextContainer:[textView textContainer]];
        [textView sizeToFit];
        assert_equals_BOOL("[textView frame].size.height > [scrollView contentSize].height", YES, [textView frame].size.height > [scrollView contentSize].height);
    }
}
