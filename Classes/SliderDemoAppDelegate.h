//
//  SliderDemoAppDelegate.h
//  SliderDemo
//
//  Created by Collin Ruffenach on 10/27/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SliderDemoViewController;

@interface SliderDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SliderDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SliderDemoViewController *viewController;

@end

