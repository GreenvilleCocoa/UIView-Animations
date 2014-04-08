//
//  CATransform3DViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/7/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "CATransform3DViewController.h"

@import QuartzCore;

@interface CATransform3DViewController ()
{
    UIView *blockView;
}
@end

@implementation CATransform3DViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    blockView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 128.0, 128.0)];
    [blockView setCenter:self.view.center];
    [blockView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:blockView];
    
    // Add a tap to the screen.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / 800.0;
    
    transform = CATransform3DRotate(transform, M_PI, 1.0, 1.0, 1.0);
    
    [UIView animateWithDuration:1.0 animations:^{
        [blockView.layer setTransform:transform];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            [blockView.layer setTransform:CATransform3DIdentity];
        }];
    }];
}

@end
