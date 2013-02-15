#import "MainController.h"
#import "PopupWindowController.h"
@implementation MainController
{
    IBOutlet NSWindow *mainWindow;
    PopupWindowController *wc;
    
    IBOutlet NSTextField *label1;
    IBOutlet NSTextField *label2;
}
- (void)awakeFromNib
{
    label1.target = label2.target = self;
    label1.action = label2.action = @selector(onDoubleClicked:);
}
- (void)setText:(NSString *)text
{
    [self willChangeValueForKey:@"text"];
    _text = text;
    [self didChangeValueForKey:@"text"];
}
- (void)onDoubleClicked:(NSTextField *)sender
{
    wc = [[PopupWindowController alloc] initWithWindowNibName:@"Popup"];
    
    NSPoint target = [sender.window convertBaseToScreen:[sender convertPoint:NSMakePoint(0, sender.bounds.size.height * 0.5) toView:sender.window.contentView]];
    
    NSRect frame = {
        target.x - wc.window.frame.size.width,
        target.y - wc.window.frame.size.height * 0.5,
        wc.window.frame.size.width,
        wc.window.frame.size.height,
    };
    
    [wc.window setFrame:frame display:YES animate:NO];
    [wc.textField bind:@"value" toObject:sender withKeyPath:@"stringValue" options:@{NSContinuouslyUpdatesValueBindingOption : @YES}];
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.5];
    [[wc.window animator] setAlphaValue:1.0];
    [NSAnimationContext endGrouping];
    
    [wc showWindow:nil];
}

@end
