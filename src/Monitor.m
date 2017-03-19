#import "Monitor.h"

@implementation Monitor

@synthesize service;
@synthesize key;

- (id)initWithDisplayId:(CGDirectDisplayID)displayId {
    self = [super init];
    if (self != nil) {
        self.service = CGDisplayIOServicePort(displayId);
        self.key = CFSTR(kIODisplayBrightnessKey);
    }
    return self;
}

- (void)setBright:(float)b {
    b = fmin(1.0, fmax(0.0, b));
    IODisplaySetFloatParameter(self.service, 0, self.key, b);
}

- (float)getBright {
    float b = 0;
    IODisplayGetFloatParameter(self.service, 0, self.key, &b);
    return b;
}

- (void)changeBy:(float)delta {
    [self setBright:[self getBright] + delta];
};

@end
