#import "PIImageView.h"

@implementation PIImageView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
        self.backgroundColor = UIColor.clearColor;
    return self;
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
       return NO;
}
@end


