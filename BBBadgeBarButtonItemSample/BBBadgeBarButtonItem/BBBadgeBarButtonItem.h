//
//  BBBadgeBarButtonItem.h
//  Riverie
//
//  Created by Tanguy Aladenise on 07/02/14.
//  Copyright (c) 2014 Riverie, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBadgeBarButtonItem : UIBarButtonItem

// Each time you change one of properties, the badge will refresh with your changes

// Badge value to be display
@property (nonatomic) NSString *badgeValue;
// Badge background color
@property (nonatomic) UIColor *badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *badgeTextColor;
// Badge font
@property (nonatomic) UIFont *badgeFont;
// In case of numbers, remove the badge when reaching zero
@property BOOL shouldHideBadgeAtZero;

- (BBBadgeBarButtonItem *)initWithCustomUIButton:(UIButton *)customButton;

@end