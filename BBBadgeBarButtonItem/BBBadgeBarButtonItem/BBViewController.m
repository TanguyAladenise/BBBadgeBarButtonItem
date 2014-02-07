//
//  BBViewController.m
//  BBBadgeBarButtonItem
//
//  Created by Tanguy Aladenise on 07/02/14.
//  Copyright (c) 2014 aladenise. All rights reserved.
//

#import "BBViewController.h"
#import "BBBadgeBarButtonItem.h"

@interface BBViewController ()

@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // If you want your BarButtonItem to handle touch event and click, use a UIButton as customView
    UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    // Add your action to your button
    [customButton addTarget:self action:@selector(barButtonItemPressed:) forControlEvents:UIControlEventTouchUpInside];
    // Customize your button as you want, with an image if you have a pictogram to display for example
    [customButton setImage:[UIImage imageNamed:@"ico-to-do-list"] forState:UIControlStateNormal];
    
    // Then create and add our custom BBBadgeBarButtonItem
    BBBadgeBarButtonItem *barButton = [[BBBadgeBarButtonItem alloc] initWithCustomUIButton:customButton];
    // Set a value for the badge
    barButton.badgeValue = @"1";

    // Add it as the leftBarButtonItem of the navigation bar
    self.navigationItem.leftBarButtonItem = barButton;
}

// Fake adding element
- (IBAction)addItemToListButtonPressed
{
    BBBadgeBarButtonItem *barButton = (BBBadgeBarButtonItem *)self.navigationItem.leftBarButtonItem;
    barButton.badgeValue = [NSString stringWithFormat:@"%d", [barButton.badgeValue intValue] + 1];
}

// Bar button pressed
- (void)barButtonItemPressed:(UIButton *)sender
{
    NSLog(@"Bar Button Item Pressed");
    
    // Pretend user checked its list, remove badge
    BBBadgeBarButtonItem *barButton = (BBBadgeBarButtonItem *)self.navigationItem.leftBarButtonItem;
    barButton.badgeValue = @"0";
    
    // If you don't want to remove the badge when it's zero just set
    barButton.shouldHideBadgeAtZero = NO;
    // Next time zero should still be displayed
    
    // You can customize the badge further (color, font, background), check BBBadgeBarButtonItem.h ;)
}

// Example of how to change the color of the badge
- (IBAction)changeColorButtonPressed:(UIButton *)sender {
    BBBadgeBarButtonItem *barButton = (BBBadgeBarButtonItem *)self.navigationItem.leftBarButtonItem;
    if (sender.selected) {
        barButton.badgeBGColor      = [UIColor redColor];
        barButton.badgeTextColor    = [UIColor whiteColor];
    }
    else {
        barButton.badgeBGColor      = [UIColor whiteColor];
        barButton.badgeTextColor    = [UIColor blackColor];
    }
    sender.selected = !sender.selected;
}
@end
