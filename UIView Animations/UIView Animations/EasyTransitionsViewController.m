//
//  EasyTransitionsViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/7/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "EasyTransitionsViewController.h"

@interface EasyTransitionsViewController ()
{
    UIView *containerView;
    UIView *blockView;
}
@end

@implementation EasyTransitionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    containerView = [[UIView alloc] initWithFrame:CGRectInset(self.view.bounds, 64.0, 64.0)];
    [containerView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:containerView];
    
    blockView = [[UIView alloc] initWithFrame:CGRectInset(containerView.bounds, 32.0, 32.0)];
    [blockView setBackgroundColor:[UIColor redColor]];
    [containerView addSubview:blockView];
    
    // Add a tap to the screen.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    [UIView transitionWithView:containerView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        // Anything done here will happen at the moment the transition is out of sight.
        [blockView setHidden:!blockView.hidden];
    } completion:nil];
}

@end
