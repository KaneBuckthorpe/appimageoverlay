#import "PIImageView.h"

@interface RotateRootViewController:UIViewController
@end

@interface SpectrogramView:UIView
@end

@interface SpectrogramViewController:UIViewController
-(void)toggleFullScreen;
@end

%hook SpectrogramViewController
PIImageView*overlayView;
SpectrogramView*mySuperView;

-(void)viewDidLoad{
	%orig;

                  

NSString*bundlePath=@"/Library/Application Support/AppImageOverlay";
NSBundle*bundle=[NSBundle bundleWithPath:bundlePath];


 for (SpectrogramView*subview in self.view.subviews){
	   if ([subview isMemberOfClass:[objc_getClass("SpectrogramView") class]]) { 
		   mySuperView=subview;
        }
 }
overlayView=[[PIImageView alloc]initWithFrame:mySuperView.bounds];
////overlayView.contentMode=UIViewContentModeScaleAspectFill;
overlayView.image=[UIImage imageNamed:@"UIViewOverlay" inBundle:bundle compatibleWithTraitCollection:nil];
 [self.view addSubview:overlayView];
		      	  [self.view bringSubviewToFront:overlayView];  
		      	  NSLog(@"ViewDidLoad");
}
-(void)viewDidLayoutSubviews{
%orig;

NSLog(@"LayoutSubviews");
	overlayView.frame=mySuperView.bounds;
	overlayView.bounds=mySuperView.bounds;
	
			 		      	 [self.view bringSubviewToFront:overlayView];
	
 for (UIView*subview in self.view.subviews){	 
	   if ([subview isKindOfClass:[UIButton class]]) { 
	   							[self.view bringSubviewToFront:subview];   
   	  subview.backgroundColor=UIColor.blackColor;  
   	  
        } 
 }
 
}

-(void)toggleFullScreen{
%orig;

   	 [mySuperView bringSubviewToFront:overlayView];  
   	  overlayView.frame=mySuperView.bounds;
	overlayView.bounds=mySuperView.bounds;
	
	for (UIView*subview in self.view.subviews){	 
	   if ([subview isKindOfClass:[UIButton class]]) { 
	   							[self.view bringSubviewToFront:subview];   
   	  subview.backgroundColor=UIColor.blackColor;  
   	  
        } 
 }
}
%end