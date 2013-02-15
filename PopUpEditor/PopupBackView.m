#import "PopUpBackView.h"

@implementation PopupBackView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
//    NSRectFill(self.bounds);
    
    const float RATIO_OF_BODY = 0.8;
    const float RATIO_OF_TAIL_HEIGHT = 0.3;
    CGRect outline = CGRectInset(self.bounds, 2, 2);
    NSPoint LB = {CGRectGetMinX(outline), CGRectGetMinY(outline)};
    NSPoint RB = {CGRectGetMinX(outline) + outline.size.width * RATIO_OF_BODY, CGRectGetMinY(outline)};
    NSPoint TAIL_BEG = {CGRectGetMinX(outline) + outline.size.width * RATIO_OF_BODY, CGRectGetMinY(outline) + (outline.size.height - outline.size.height * RATIO_OF_TAIL_HEIGHT) * 0.5};
    NSPoint TAIL_CEN = {CGRectGetMaxX(outline), CGRectGetMinY(outline) + outline.size.height * 0.5};
    NSPoint TAIL_END = {CGRectGetMinX(outline) + outline.size.width * RATIO_OF_BODY, CGRectGetMaxY(outline) - (outline.size.height - outline.size.height * RATIO_OF_TAIL_HEIGHT) * 0.5};
    NSPoint RT = {CGRectGetMinX(outline) + outline.size.width * RATIO_OF_BODY, CGRectGetMaxY(outline)};
    NSPoint LT = {CGRectGetMinX(outline), CGRectGetMaxY(outline)};
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path moveToPoint:LB];
    [path lineToPoint:RB];
    [path lineToPoint:TAIL_BEG];
    [path lineToPoint:TAIL_CEN];
    [path lineToPoint:TAIL_END];
    [path lineToPoint:RT];
    [path lineToPoint:LT];
    [path closePath];
    
    [[NSColor whiteColor] set];
    [path fill];
    
    [[NSColor blackColor] set];
    [path stroke];
}

@end
