#import <Cocoa/Cocoa.h>
#import <IOKit/graphics/IOGraphicsLib.h>

#import "config.h"
#import "Monitor.h"

#define MAX_MONITORS 20

@interface NoMouse : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) NSMutableArray* monitors;

- (id)init;
- (void)changeBy:(float)delta;
- (void)restore;
- (void)applicationDidFinishLaunching:(NSNotification*)aNotification;

@end
