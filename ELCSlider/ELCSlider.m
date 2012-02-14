//
//  ELCSlider.m
//  ELCSiderController
//
//  Created by Collin Ruffenach on 10/27/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import "ELCSlider.h"

@interface ELCSlider (Internal)
-(void)userDidLetGo;
@end

@implementation ELCSlider

-(void)configureForInit
{
    
    [self addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    [self addTarget:self action:@selector(userDidLetGo) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    
    sliderValueController = [[SliderValueViewController alloc] initWithNibName:@"SliderValueViewController" bundle:[NSBundle mainBundle]];
    popoverController = [[UIPopoverController alloc] initWithContentViewController:sliderValueController];
    [popoverController setPopoverContentSize:sliderValueController.view.frame.size];
}

-(id)initWithCoder:(NSCoder *)aDecoder {

	if((self = [super initWithCoder:aDecoder])) {
        [self configureForInit];
    }
	
    return self;	
}

- (id)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame]))
        return nil;
    
    [self configureForInit];
    
    return self;
}

-(void)userDidLetGo
{
    if (popoverController.isPopoverVisible)
        [popoverController dismissPopoverAnimated:YES];
}

-(void)valueChanged {
	
	[sliderValueController updateSliderValueTo:self.value];
	
	CGFloat sliderMin =  self.minimumValue;
	CGFloat sliderMax = self.maximumValue;
	CGFloat sliderMaxMinDiff = sliderMax - sliderMin;
	CGFloat sliderValue = self.value;
	
	if(sliderMin < 0.0) {

		sliderValue = self.value-sliderMin;
		sliderMax = sliderMax - sliderMin;
		sliderMin = 0.0;
		sliderMaxMinDiff = sliderMax - sliderMin;
	}
	
	CGFloat xCoord = ((sliderValue-sliderMin)/sliderMaxMinDiff)*[self frame].size.width-sliderValueController.view.frame.size.width/2.0;
	
	CGFloat halfMax = (sliderMax+sliderMin)/2.0;
	
	if(sliderValue > halfMax) {
		
		sliderValue = (sliderValue - halfMax)+(sliderMin*1.0);
		sliderValue = sliderValue/halfMax;
		sliderValue = sliderValue*11.0;
		
		xCoord = xCoord - sliderValue;
	}
	
	else if(sliderValue <  halfMax) {
		
		sliderValue = (halfMax - sliderValue)+(sliderMin*1.0);
		sliderValue = sliderValue/halfMax;
		sliderValue = sliderValue*11.0;
		
		xCoord = xCoord + sliderValue;
	}

	[popoverController presentPopoverFromRect:CGRectMake(xCoord, 0, sliderValueController.view.frame.size.width, sliderValueController.view.frame.size.height) inView:self permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {    
    if (popoverController.isPopoverVisible)
        [popoverController dismissPopoverAnimated:NO];
    
    [super dealloc];
}


@end
