//
//  DiamondActivityIndicator.h
//  Diamond Activity Indicator
//
//  Created by Thomas Finch on 8/6/13.
//  Copyright (c) 2013 Thomas Finch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface DiamondActivityIndicator : UIView
{
    float dotRadius;
    int stepNumber;
    BOOL isAnimating;
    CGRect firstPoint, secondPoint, thirdPoint, fourthPoint;
    CALayer *firstDot, *secondDot, *thirdDot;
    NSTimer *timer;
}

@property (nonatomic) BOOL hidesWhenStopped;
@property (nonatomic) UIColor *color;

-(void)startAnimating;
-(void)stopAnimating;
-(BOOL)isAnimating;


@end
