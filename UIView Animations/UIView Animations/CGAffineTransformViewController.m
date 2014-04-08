//
//  CGAffineTransformViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/7/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "CGAffineTransformViewController.h"

@interface CGAffineTransformViewController ()
{
    UIView *rotatingBlockView;
    UIView *scalingBlockView;
    UIView *translatingBlockView;
    
    UIView *showOffBlockView;
}
@end

@implementation CGAffineTransformViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    CGFloat blockSize = 44.0;
    
    rotatingBlockView = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.2) - (blockSize / 2.0), 128.0, blockSize, blockSize)];
    [rotatingBlockView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:rotatingBlockView];
    
    scalingBlockView = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.4) - (blockSize / 2.0), 128.0, blockSize, blockSize)];
    [scalingBlockView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:scalingBlockView];
    
    translatingBlockView = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.6) - (blockSize / 2.0), 128.0, blockSize, blockSize)];
    [translatingBlockView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:translatingBlockView];

    showOffBlockView = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.8) - (blockSize / 2.0), 128.0, blockSize, blockSize)];
    [showOffBlockView setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:showOffBlockView];

    // Add a tap to the screen.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    [UIView animateWithDuration:2.0 animations:^{
        [rotatingBlockView setTransform:CGAffineTransformMakeRotation(M_PI_2)];
    } completion:^(BOOL finished) {
        [rotatingBlockView setTransform:CGAffineTransformIdentity];
    }];
    
    [UIView animateWithDuration:2.0 animations:^{
        [scalingBlockView setTransform:CGAffineTransformMakeScale(2.0, 2.0)];
    } completion:^(BOOL finished) {
        [scalingBlockView setTransform:CGAffineTransformIdentity];
    }];
    
    [UIView animateWithDuration:2.0 animations:^{
        [translatingBlockView setTransform:CGAffineTransformMakeTranslation(0.0, 256.0)];
    } completion:^(BOOL finished) {
        [translatingBlockView setTransform:CGAffineTransformIdentity];
    }];
    
    [UIView animateWithDuration:2.0 animations:^{
        CGAffineTransform transform = CGAffineTransformMakeTranslation(0.0, 256.0);
        transform = CGAffineTransformScale(transform, 2.0, 2.0);
        transform = CGAffineTransformRotate(transform, M_PI_2);
        
        [showOffBlockView setTransform:transform];
    } completion:^(BOOL finished) {
        [showOffBlockView setTransform:CGAffineTransformIdentity];
    }];
}


@end
