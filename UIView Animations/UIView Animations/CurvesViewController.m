//
//  CurvesViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/7/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "CurvesViewController.h"

@interface CurvesViewController ()
{
    UIView *easeInBlock;
    UIView *easeOutBlock;
    UIView *easeInOutBlock;
    UIView *linearBlock;
}
@end

@implementation CurvesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    CGFloat blockSize = 44.0;
    
    easeInBlock = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.2) - (blockSize / 2.0), 64.0, blockSize, blockSize)];
    [easeInBlock setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:easeInBlock];
    
    easeOutBlock = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.4) - (blockSize / 2.0), 64.0, blockSize, blockSize)];
    [easeOutBlock setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:easeOutBlock];
    
    easeInOutBlock = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.6) - (blockSize / 2.0), 64.0, blockSize, blockSize)];
    [easeInOutBlock setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:easeInOutBlock];
    
    linearBlock = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.8) - (blockSize / 2.0), 64.0, blockSize, blockSize)];
    [linearBlock setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:linearBlock];
    
    // Add a tap to the screen.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [easeInBlock setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.view.bounds) - 128.0)];
    } completion:^(BOOL finished) {
        [easeInBlock setTransform:CGAffineTransformIdentity];
    }];
    
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [easeOutBlock setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.view.bounds) - 128.0)];
    } completion:^(BOOL finished) {
        [easeOutBlock setTransform:CGAffineTransformIdentity];
    }];
    
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [easeInOutBlock setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.view.bounds) - 128.0)];
    } completion:^(BOOL finished) {
        [easeInOutBlock setTransform:CGAffineTransformIdentity];
    }];
    
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [linearBlock setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.view.bounds) - 128.0)];
    } completion:^(BOOL finished) {
        [linearBlock setTransform:CGAffineTransformIdentity];
    }];
}

@end
