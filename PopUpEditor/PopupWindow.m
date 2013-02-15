#import "PopupWindow.h"

@implementation PopupWindow
- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (BOOL)canBecomeMainWindow {
    return YES;
}
- (void)awakeFromNib
{
    [self setOpaque:NO];
    [self setAlphaValue:0.0f];
    [self setBackgroundColor:[NSColor clearColor]];
}
- (void)resignKeyWindow
{
    [[self animator] setAlphaValue:0];
    [self close];
}
@end
