//
//  BlockToTouchViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/7/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "BlockToTouchViewController.h"

@interface BlockToTouchViewController ()
{
    UIView *blockView;
}
@end

@implementation BlockToTouchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    blockView = [[UIView alloc] initWithFrame:CGRectMake(128.0, 128.0, 50.0, 50.0)];
    [blockView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:blockView];
    
    // Add a tap to the screen.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    // Get Touch Location
    CGPoint location = [gesture locationInView:self.view];
    
    [UIView animateWithDuration:1.0 animations:^{
        [blockView setCenter:location];
    }];
}

@end
