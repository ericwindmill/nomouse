#import <Cocoa/Cocoa.h>
#import "NoMouse.h"

int main() {
    @autoreleasepool {
        NoMouse* nm = [[NoMouse alloc] init];
        [[NSApplication sharedApplication] setDelegate:nm];
        [NSApp run];
    }
    return 0;
}
