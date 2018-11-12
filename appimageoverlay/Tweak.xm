#import "PIImageView.h"

@interface SpectrogramView : UIView
@end

@interface SpectrogramViewController : UIViewController
- (void)toggleFullScreen;
@end

%hook SpectrogramViewController PIImageView *overlayView;
SpectrogramView *refView;

- (void)viewDidLoad {
    %orig;
    
    NSString *bundlePath = @"/Library/Application Support/AppImageOverlay";
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    
    for (SpectrogramView *subview in self.view.subviews) {
        if ([subview
             isMemberOfClass:[objc_getClass("SpectrogramView") class]]) {
            refView = subview;
        }
    }
    overlayView = [[PIImageView alloc] initWithFrame:refView.bounds];
    ////overlayView.contentMode=UIViewContentModeScaleAspectFill;
    overlayView.image = [UIImage imageNamed:@"UIViewOverlay"
                                   inBundle:bundle
              compatibleWithTraitCollection:nil];
    [self.view addSubview:overlayView];
    [self.view bringSubviewToFront:overlayView];
    NSLog(@"ViewDidLoad");
}
- (void)viewDidLayoutSubviews {
    %orig;
    
    NSLog(@"LayoutSubviews");
    overlayView.frame = refView.bounds;
    overlayView.bounds = refView.bounds;
    
    [self.view bringSubviewToFront:overlayView];
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            [self.view bringSubviewToFront:subview];
            subview.backgroundColor = UIColor.blackColor;
        }
    }
}

- (void)toggleFullScreen {
    %orig;
    
    [self.view bringSubviewToFront:overlayView];
    overlayView.frame = refView.bounds;
    overlayView.bounds = refView.bounds;
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            [self.view bringSubviewToFront:subview];
            subview.backgroundColor = UIColor.blackColor;
        }
    }
}
%end
