//
//  ListViewController.m
//  UIView Animations
//
//  Created by Ryan Poolos on 4/6/14.
//  Copyright (c) 2014 Frozen Fire Studios, Inc. All rights reserved.
//

#import "ListViewController.h"

#import "NoAnimationViewController.h"
#import "BlockToPointViewController.h"
#import "BlockToTouchViewController.h"
#import "PixelForPixelViewController.h"
#import "CGAffineTransformViewController.h"
#import "EasyTransitionsViewController.h"
#import "AllowUserInteractionsViewController.h"
#import "BeginFromCurrentStateViewController.h"
#import "CurvesViewController.h"
#import "CATransform3DViewController.h"
#import "KeyframeViewController.h"
#import "SpringsViewController.h"
#import "TonsOfAnimationsViewController.h"
#import "CoreAnimationPathViewController.h"
#import "ExplodingViewController.h"


typedef NS_ENUM(NSInteger, Sections){
    NoAnimationSection,
    BasicsSection,
    OptionSection,
    IntermediateSection,
    AdvancedSection
};


@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    [self setTitle:@"Animations!"];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == NoAnimationSection) {
        return 1;
    }
    else if (section == BasicsSection) {
        return 5;
    }
    else if (section == OptionSection) {
        return 3;
    }
    else if (section == IntermediateSection) {
        return 3;
    }
    else if (section == AdvancedSection) {
        return 3;
    }
    
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == NoAnimationSection) {
        return nil;
    }
    else if (section == BasicsSection) {
        return @"Basics";
    }
    else if (section == OptionSection) {
        return @"Basics (Options)";
    }
    else if (section == IntermediateSection) {
        return @"Intermediate";
    }
    else if (section == AdvancedSection) {
        return @"Advanced";
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    if (section == NoAnimationSection) {
        if (row == 0) {
            [cell.textLabel setText:@"No Animations"];
        }
    }
    else if (section == BasicsSection) {
        // Basic: Move Block to Point
        if (row == 0) {
            [cell.textLabel setText:@"Move To Point"];
        }
        // Basic: Move Block to Touch
        else if (row == 1) {
            [cell.textLabel setText:@"Move to Touch"];
        }
        // Basic: Pixel for Pixel Moves
        else if (row == 2) {
            [cell.textLabel setText:@"Pixel for Pixel Example"];
        }
        // Basic: CGAffineTransforms
        else if (row == 3) {
            [cell.textLabel setText:@"CGAffineTransforms"];
        }
        // Basic: Transitions
        else if (row == 4) {
            [cell.textLabel setText:@"Easy Transitions"];
        }
    }
    else if (section == OptionSection) {
        // Options: UIViewAnimationOptionAllowUserInteraction: Show that you can’t interact with views while they are being animated.
        if (row == 0) {
            [cell.textLabel setText:@"Allow User Interactions"];
        }
        // Options: UIViewAnimationBeginFromCurrentState: Move to Tap, show what happens when you start an animation before one is finished.
        else if (row == 1) {
            [cell.textLabel setText:@"Being from Current State"];
        }
        // Options: UIViewAnimationOptionCurves: Show blocks on a starting line and start 4 animations with different easing curves.
        else if (row == 2) {
            [cell.textLabel setText:@"Animation Curves"];
        }
    }
    else if (section == IntermediateSection) {
        // Intermediate: CATransform3D (m.34 for perspective)
        if (row == 0) {
            [cell.textLabel setText:@"CATransform3D"];
        }
        // Intermediate: Keyframe Animations (iOS7)
        else if (row == 1) {
            [cell.textLabel setText:@"Keyframe Animations"];
        }
        // Intermediate: Spring Animations (iOS7)
        else if (row == 2) {
            [cell.textLabel setText:@"Spring Animations"];
        }
    }
    else if (section == AdvancedSection) {
        // Advanced: Move 50 Blocks (one animation block, 50 animation blocks)
        if (row == 0) {
            [cell.textLabel setText:@"Performance Comparisons"];
        }
        // Advanced: Core Animation Along a Path
        else if (row == 1) {
            [cell.textLabel setText:@"Animate Along A Path"];
        }
        // Advanced: Explosions!
        else if (row == 2) {
            [cell.textLabel setText:@"Explosions!"];
        }
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    if (section == NoAnimationSection) {
        if (row == 0) {
            [self.navigationController pushViewController:[[NoAnimationViewController alloc] init] animated:YES];
        }
    }
    else if (section == BasicsSection) {
        // Basic: Move Block to Point
        if (row == 0) {
            [self.navigationController pushViewController:[[BlockToPointViewController alloc] init] animated:YES];
        }
        // Basic: Move Block to Touch
        else if (row == 1) {
            [self.navigationController pushViewController:[[BlockToTouchViewController alloc] init] animated:YES];
        }
        // Basic: Pixel for Pixel Moves
        else if (row == 2) {
            [self.navigationController pushViewController:[[PixelForPixelViewController alloc] init] animated:YES];
        }
        // Basic: CGAffineTransforms
        else if (row == 3) {
            [self.navigationController pushViewController:[[CGAffineTransformViewController alloc] init] animated:YES];
        }
        // Basic: Transitions
        else if (row == 4) {
            [self.navigationController pushViewController:[[EasyTransitionsViewController alloc] init] animated:YES];
        }
    }
    else if (section == OptionSection) {
        // Options: UIViewAnimationOptionAllowUserInteraction: Show that you can’t interact with views while they are being animated.
        if (row == 0) {
            [self.navigationController pushViewController:[[AllowUserInteractionsViewController alloc] init] animated:YES];
        }
        // Options: UIViewAnimationBeginFromCurrentState: Move to Tap, show what happens when you start an animation before one is finished.
        else if (row == 1) {
            [self.navigationController pushViewController:[[BeginFromCurrentStateViewController alloc] init] animated:YES];
        }
        // Options: UIViewAnimationOptionCurves: Show blocks on a starting line and start 4 animations with different easing curves.
        else if (row == 2) {
            [self.navigationController pushViewController:[[CurvesViewController alloc] init] animated:YES];
        }
    }
    else if (section == IntermediateSection) {
        // Intermediate: CATransform3D (m.34 for perspective)
        if (row == 0) {
            [self.navigationController pushViewController:[[CATransform3DViewController alloc] init] animated:YES];
        }
        // Intermediate: Keyframe Animations (iOS7)
        else if (row == 1) {
            [self.navigationController pushViewController:[[KeyframeViewController alloc] init] animated:YES];
        }
        // Intermediate: Spring Animations (iOS7)
        else if (row == 2) {
            [self.navigationController pushViewController:[[SpringsViewController alloc] init] animated:YES];
        }
    }
    else if (section == AdvancedSection) {
        // Advanced: Move 50 Blocks (one animation block, 50 animation blocks)
        if (row == 0) {
            [self.navigationController pushViewController:[[TonsOfAnimationsViewController alloc] init] animated:YES];
        }
        // Advanced: Core Animation Along a Path
        else if (row == 1) {
            [self.navigationController pushViewController:[[CoreAnimationPathViewController alloc] init] animated:YES];
        }
        // Advanced: Explosions!
        else if (row == 2) {
            [self.navigationController pushViewController:[[ExplodingViewController alloc] init] animated:YES];
        }
    }
    
}

#pragma mark - Views

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [_tableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
        
        [_tableView setDataSource:self];
        [_tableView setDelegate:self];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    return _tableView;
}

@end
