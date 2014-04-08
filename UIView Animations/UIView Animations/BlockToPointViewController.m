//
//  BlockToPointViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/7/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "BlockToPointViewController.h"

@interface BlockToPointViewController ()
{
    UIView *blockView;
}
@end

@implementation BlockToPointViewController

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
    // Pick Random Point
    CGPoint randomPoint = CGPointMake(arc4random() % (int)CGRectGetWidth(self.view.bounds), arc4random() % (int)CGRectGetHeight(self.view.bounds));
    
    [UIView animateWithDuration:1.0 animations:^{
        [blockView setCenter:randomPoint];
    }];
}

@end
