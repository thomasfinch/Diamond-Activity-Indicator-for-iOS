//
//  DAIViewController.m
//  Diamond Activity Indicator
//
//  Created by Thomas Finch on 8/6/13.
//  Copyright (c) 2013 Thomas Finch. All rights reserved.
//

#import "DAIViewController.h"
#import "DiamondActivityIndicator.h"

@interface DAIViewController ()

@end

@implementation DAIViewController

@synthesize startAnimatingButton;
@synthesize stopAnimatingButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    DiamondActivityIndicator *activityIndicator = [[DiamondActivityIndicator alloc] initWithFrame:CGRectMake(60, 40, 200, 200)];
    [self.view addSubview:activityIndicator];
    [activityIndicator startAnimating];
    
    [startAnimatingButton addTarget:activityIndicator action:@selector(startAnimating) forControlEvents:UIControlEventTouchUpInside];
    [stopAnimatingButton addTarget:activityIndicator action:@selector(stopAnimating) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end