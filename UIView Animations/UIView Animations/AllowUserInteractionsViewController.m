//
//  AllowUserInteractionsViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/7/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "AllowUserInteractionsViewController.h"

@interface AllowUserInteractionsViewController ()
{
    UIButton *interactiveBlock;
    UIButton *nonInteractiveBlock;
}
@end

@implementation AllowUserInteractionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    CGFloat blockSize = 88.0;
    
    interactiveBlock = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.25) - (blockSize / 2.0), 64.0, blockSize, blockSize)];
    [interactiveBlock setBackgroundColor:[UIColor greenColor]];
    [interactiveBlock addTarget:self action:@selector(handleBlockTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:interactiveBlock];
    
    nonInteractiveBlock = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.bounds) * 0.75) - (blockSize / 2.0), 64.0, blockSize, blockSize)];
    [nonInteractiveBlock setBackgroundColor:[UIColor redColor]];
    [nonInteractiveBlock addTarget:self action:@selector(handleBlockTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nonInteractiveBlock];
    
    // Add a tap to the screen.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        [interactiveBlock setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.view.bounds) - 128.0)];
    } completion:^(BOOL finished) {
        [interactiveBlock setTransform:CGAffineTransformIdentity];
    }];
    
    [UIView animateWithDuration:2.0 animations:^{
        [nonInteractiveBlock setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.view.bounds) - 128.0)];
    } completion:^(BOOL finished) {
        [nonInteractiveBlock setTransform:CGAffineTransformIdentity];
    }];
}

- (void)handleBlockTap:(UIButton *)block
{
    UIColor *randomColor = [UIColor colorWithRed:arc4random() % 255/255.0f green:arc4random() % 255/255.0f blue:arc4random() % 255/255.0f alpha:1.0];
    
    [block setBackgroundColor:randomColor];
}

@end
