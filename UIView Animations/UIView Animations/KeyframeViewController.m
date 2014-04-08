//
//  KeyframeViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/7/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "KeyframeViewController.h"

@interface KeyframeViewController ()
{
    UIView *blockView;
}
@end

@implementation KeyframeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    blockView = [[UIView alloc] initWithFrame:CGRectMake(64.0, 64.0, 44.0, 44.0)];
    [blockView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:blockView];
    
    // Add a tap to the screen.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    [UIView animateKeyframesWithDuration:4.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.25 animations:^{
            [blockView setCenter:CGPointMake(CGRectGetWidth(self.view.bounds) - 64.0, 64.0)];
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            [blockView setCenter:CGPointMake(CGRectGetWidth(self.view.bounds) - 64.0, CGRectGetHeight(self.view.bounds) - 64.0)];
        }];

        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            [blockView setCenter:CGPointMake(64.0, CGRectGetHeight(self.view.bounds) - 64.0)];
        }];

        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            [blockView setCenter:CGPointMake(64.0, 64.0)];
        }];

    } completion:nil];
}

@end
