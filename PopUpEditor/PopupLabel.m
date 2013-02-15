#import "PopupLabel.h"
#import <objc/message.h>
@implementation PopupLabel
- (void)mouseUp:(NSEvent*)event {
    if (event.clickCount == 2) {
        if([self.target respondsToSelector:self.action])
        {
            objc_msgSend(self.target, self.action, self);
        }
    }
}
@end
