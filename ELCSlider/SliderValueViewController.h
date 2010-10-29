//
//  sliderValueViewController.h
//  ftl-sales-app
//
//  Created by Collin Ruffenach on 10/19/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SliderValueViewController : UIViewController {

	IBOutlet UILabel *sliderValue;
}

@property (nonatomic, retain) IBOutlet UILabel *sliderValue;

-(void)updateSliderValueTo:(CGFloat)_value;

@end
