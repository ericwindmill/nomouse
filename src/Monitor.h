#import <Cocoa/Cocoa.h>
#import <IOKit/graphics/IOGraphicsLib.h>

@interface Monitor : NSObject

@property io_service_t service;
@property CFStringRef key;

- (id)initWithDisplayId:(CGDirectDisplayID)displayId;
- (void)setBright:(float)b;
- (float)getBright;
- (void)changeBy:(float)delta;

@end
