#import "PIImageView.h"

@interface RotateRootViewController:UIViewController
@end
/*
%hook RotateRootViewController
-(void)viewDidLoad{
	%orig;
	  NSLog(@"App viewDidLoad");
	  PIImageView*overlayView=[[PIImageView alloc]initWithFrame:self.view.bounds];
         [self.view addSubview:overlayView];

NSString*bundlePath=@"/Library/Application Support/AppImageOverlay";
NSBundle*bundle=[NSBundle bundleWithPath:bundlePath];
overlayView.contentMode=UIViewContentModeScaleAspectFit;
overlayView.image=[UIImage imageNamed:@"UIViewOverlay" inBundle:bundle compatibleWithTraitCollection:nil];

}

%end
*/
@interface SpectrogramView:UIView
@end

@interface SpectrogramViewController:UIViewController

@end

%hook SpectrogramViewController
-(void)viewDidLoad{
	%orig;
	  NSLog(@"SpectrogramViewController viewDidLoad");
	  PIImageView*overlayView=[[PIImageView alloc]initWithFrame:self.view.bounds];
         [self.view addSubview:overlayView];
         

NSString*bundlePath=@"/Library/Application Support/AppImageOverlay";
NSBundle*bundle=[NSBundle bundleWithPath:bundlePath];
overlayView.contentMode=UIViewContentModeScaleAspectFit;
overlayView.image=[UIImage imageNamed:@"UIViewOverlay" inBundle:bundle compatibleWithTraitCollection:nil];


}
-(void)viewDidLayoutSubviews{
%orig;
 for (UIView*subview in self.view.subviews){
	 
	   if ([subview isKindOfClass:[UIButton class]]) { 
   	  [self.view bringSubviewToFront:subview];   
   	  subview.backgroundColor=UIColor.blackColor;  
        }
 }
 
}
%end