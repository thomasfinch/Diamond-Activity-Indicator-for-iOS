//
//  DiamondActivityIndicator.m
//  Diamond Activity Indicator
//
//  Created by Thomas Finch on 8/6/13.
//  Copyright (c) 2013 Thomas Finch. All rights reserved.
//

#import "DiamondActivityIndicator.h"

#define ANIMATION_DURATION_SECS 0.6

@implementation DiamondActivityIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        stepNumber = 0;
        isAnimating = NO;
        self.hidesWhenStopped = YES;
        self.color = [UIColor grayColor];
        CGColorRef pointColor = [UIColor grayColor].CGColor;
        dotRadius = frame.size.height <= frame.size.width ? frame.size.width/12 : frame.size.height/12;
        firstPoint = CGRectMake(frame.size.width/4-dotRadius, frame.size.height/2-dotRadius, 2*dotRadius, 2*dotRadius);
        secondPoint = CGRectMake(frame.size.width/2-dotRadius, frame.size.height/4-dotRadius, 2*dotRadius, 2*dotRadius);
        thirdPoint = CGRectMake(3*frame.size.width/4-dotRadius, frame.size.height/2-dotRadius, 2*dotRadius, 2*dotRadius);
        fourthPoint = CGRectMake(frame.size.width/2-dotRadius, 3*frame.size.height/4-dotRadius, 2*dotRadius, 2*dotRadius);
        
        //First dot is the one that moves straight up and down
        firstDot = [CALayer layer];
        [firstDot setMasksToBounds:YES];
        [firstDot setBackgroundColor:pointColor];
        [firstDot setCornerRadius:dotRadius];
        [firstDot setBounds:CGRectMake(0.0f, 0.0f, dotRadius*2, dotRadius*2)];
        firstDot.frame = fourthPoint;
        
        //Second dot is the one that moves straight left and right
        secondDot = [CALayer layer];
        [secondDot setMasksToBounds:YES];
        [secondDot setBackgroundColor:pointColor];
        [secondDot setCornerRadius:dotRadius];
        [secondDot setBounds:CGRectMake(0.0f, 0.0f, dotRadius*2, dotRadius*2)];
        secondDot.frame = firstPoint;
        
        //Third dot is the one that moves around all four positions clockwise
        thirdDot = [CALayer layer];
        [thirdDot setMasksToBounds:YES];
        [thirdDot setBackgroundColor:pointColor];
        [thirdDot setCornerRadius:dotRadius];
        [thirdDot setBounds:CGRectMake(0.0f, 0.0f, dotRadius*2, dotRadius*2)];
        thirdDot.frame = thirdPoint;
        
        [[self layer] addSublayer:firstDot];
        [[self layer] addSublayer:secondDot];
        [[self layer] addSublayer:thirdDot];
        
        self.layer.hidden = YES;
    }
    return self;
}

-(void)startAnimating
{
    if (!isAnimating)
    {
        isAnimating = YES;
        self.layer.hidden = NO;
        timer = [NSTimer scheduledTimerWithTimeInterval:ANIMATION_DURATION_SECS target:self selector:@selector(animateNextStep) userInfo:nil repeats:YES];
    }
}

-(void)stopAnimating
{
    isAnimating = NO;
    if (self.hidesWhenStopped)
        self.layer.hidden = YES;
    [timer invalidate];
    stepNumber = 0;
    firstDot.frame = fourthPoint;
    secondDot.frame = firstPoint;
    thirdDot.frame = thirdPoint;
}

-(void)animateNextStep
{
    switch (stepNumber)
    {
        case 0:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            firstDot.frame = secondPoint;
            thirdDot.frame = fourthPoint;
            [CATransaction commit];
            break;
        case 1:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            secondDot.frame = thirdPoint;
            thirdDot.frame = firstPoint;
            [CATransaction commit];
            break;
        case 2:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            firstDot.frame = fourthPoint;
            thirdDot.frame = secondPoint;
            [CATransaction commit];
            break;
        case 3:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            secondDot.frame = firstPoint;
            thirdDot.frame = thirdPoint;
            [CATransaction commit];
            break;
        case 4:
            [CATransaction begin];
            [CATransaction setAnimationDuration:ANIMATION_DURATION_SECS];
            firstDot.frame = secondPoint;
            thirdDot.frame = fourthPoint;
            [CATransaction commit];
            stepNumber = 0;
        default:
            break;
    }
    
    stepNumber++;
}

-(BOOL)isAnimating
{
    return isAnimating;
}

-(void)setColor:(UIColor *)color
{
    [firstDot setBackgroundColor:[color CGColor]];
    [secondDot setBackgroundColor:[color CGColor]];
    [thirdDot setBackgroundColor:[color CGColor]];
}

@end
