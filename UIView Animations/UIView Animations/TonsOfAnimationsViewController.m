//
//  TonsOfAnimationsViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/7/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "TonsOfAnimationsViewController.h"

@interface TonsOfAnimationsViewController ()
{
    NSMutableArray *viewGroups;
}
@end

@implementation TonsOfAnimationsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    viewGroups = [NSMutableArray array];
    NSMutableArray *currentGroup = [NSMutableArray array];
    for (int i = 0; i < 1000; i++) {
        UIColor *randomColor = [UIColor colorWithRed:arc4random() % 255/255.0f green:arc4random() % 255/255.0f blue:arc4random() % 255/255.0f alpha:1.0];
        
        UIView *blockView = [[UIView alloc] initWithFrame:CGRectMake(0.0, arc4random() % (int)CGRectGetHeight(self.view.bounds), 8.0, 8.0)];
        [blockView setBackgroundColor:randomColor];
        [self.view addSubview:blockView];
        
        [currentGroup addObject:blockView];
        
        if (currentGroup.count >= 50) {
            [viewGroups addObject:currentGroup];
            currentGroup = [NSMutableArray array];
        }
    }
    
    // Add a tap to the screen.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)gesture
{
    UIView *aBlock = self.view.subviews.firstObject;
    CGFloat screenWidth = CGRectGetWidth(self.view.bounds) - CGRectGetWidth(aBlock.frame);
    
    if (CGRectGetMinX(aBlock.frame) == 0.0) {
        // an animation for each block.
        [self.view.subviews enumerateObjectsUsingBlock:^(UIView *blockView, NSUInteger idx, BOOL *stop) {
            [UIView animateWithDuration:arc4random() % 100/100.0f animations:^{
                [blockView setTransform:CGAffineTransformMakeTranslation(screenWidth, 0.0)];
            }];
        }];
    }
    else {
        // An animation for every 100 blocks to share
        [viewGroups enumerateObjectsUsingBlock:^(NSArray *group, NSUInteger idx, BOOL *stop) {
            [UIView animateWithDuration:arc4random() % 100/100.0f animations:^{
                [group enumerateObjectsUsingBlock:^(UIView *blockView, NSUInteger idx, BOOL *stop) {
                    [blockView setTransform:CGAffineTransformIdentity];
                }];
            }];
        }];
    }
    
}



@end
