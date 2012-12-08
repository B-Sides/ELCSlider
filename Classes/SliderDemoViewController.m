//
//  SliderDemoViewController.m
//  SliderDemo
//
//  Created by Collin Ruffenach on 10/27/10.
//  Copyright 2010 ELC Technologies. All rights reserved.
//

#import "SliderDemoViewController.h"
#import "ELCSlider.h" // for instantiate programmatically.

@implementation SliderDemoViewController


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Instantiate programmatically
    ELCSlider *slider = [[ELCSlider alloc] initWithFrame:CGRectMake(224, 200, 320, 88)];
    slider.minimumValue = 0.0f;
    slider.maximumValue = 10.0f;
    slider.value = 5.0f;
    [self.view addSubview:slider];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
