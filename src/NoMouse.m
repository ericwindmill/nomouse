#import "NoMouse.h"

@implementation NoMouse

@synthesize monitors;

- (id)init {
    self = [super init];
    if (self == nil) {
        return nil;
    }

    CGDirectDisplayID ids[MAX_MONITORS];
    uint32_t count;

    CGGetActiveDisplayList(MAX_MONITORS, ids, &count);
    if (count > 0) {
        self.monitors = [[NSMutableArray alloc] init];
        for (int i = 0; i < count; i++) {
            [self.monitors addObject:[[Monitor alloc] initWithDisplayId:ids[i]]];
        }
    }

    return self;
}

- (void)changeBy:(float)delta {
    for (Monitor* monitor in monitors) {
        [monitor changeBy:delta];
    }
}

- (void)restore {
    [self changeBy:BRIGHTNESS_INCREMENT];
}

- (void)applicationDidFinishLaunching:(NSNotification*)aNotification {
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(restore)
                                   userInfo:nil
                                    repeats:YES];

    void (^onClick)(NSEvent*) = ^(NSEvent* event) {
        [self changeBy:BRIGHTNESS_DECREMENT];
    };

    [NSEvent addGlobalMonitorForEventsMatchingMask:NSLeftMouseDownMask
                                           handler:onClick];
}
 
@end
