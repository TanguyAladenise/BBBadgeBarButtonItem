//
//  BBBadgeBarButtonItem.m
//
//  Created by Tanguy Aladenise on 07/02/14.
//  Copyright (c) 2014 Riverie, Inc. All rights reserved.
//

#import "BBBadgeBarButtonItem.h"

// Default padding value for the badge
static int const BBBadgeMargin = 6;
// Minimum size badge to small
static int const BBMinSize = 8;
// Default offset for the badge

// This are the default values for offseting the badge over the BarButtonItem you picked
static int const BBoriginX = 7;
static int const BBoriginY = -9;


@interface BBBadgeBarButtonItem()

// The badge displayed over the BarButtonItem
@property (nonatomic) UILabel *badge;

@end

@implementation BBBadgeBarButtonItem


#pragma mark - Init methods

- (BBBadgeBarButtonItem *)initWithCustomUIButton:(UIButton *)customButton
{
    self = [self initWithCustomView:customButton];
    if (self) {
        [self initializer];
    }
    
    return self;
}

- (void)initializer
{
    // Default design initialization
    self.badgeBGColor   = [UIColor redColor];
    self.badgeTextColor = [UIColor whiteColor];
    self.badgeFont      = [UIFont systemFontOfSize:12.0];
    self.shouldHideBadgeAtZero = YES;
    self.shouldAnimateBadge = YES;
    // Avoids badge to be clipped when animating its scale
    self.customView.clipsToBounds = NO;
}

#pragma mark - Utility methods

// Handle badge display when its properties have been changed (color, font, ...)
- (void)refreshBadge
{
    // Change new attributes
    self.badge.textColor        = self.badgeTextColor;
    self.badge.backgroundColor  = self.badgeBGColor;
    self.badge.font             = self.badgeFont;
}

// Handle the badge changing value
- (void)updateBadgeValue
{
    // Bounce animation on badge if value changed and if animation authorized
    if (self.shouldAnimateBadge && ![self.badge.text isEqualToString:self.badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4 :1.3 :1 :1]];
        [self.badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }

    // Set the new value
    self.badge.text = self.badgeValue;
    
    // When the value changes the badge could need to get bigger
    // Calculate expected size to fit new value
    // Use an intermediate label to get expected size thanks to sizeToFit
    // We don't call sizeToFit on the true label to avoid bad display
    UILabel *frameLabel = [self duplicateLabel:self.badge];
    [frameLabel sizeToFit];
    CGSize expectedLabelSize = frameLabel.frame.size;
    // Make sure that for small value, the badge will be big enough
    float minHeight = expectedLabelSize.height;
    // Using a const we make sure the badge respect the minimum size
    minHeight = (minHeight < BBMinSize) ? BBMinSize : expectedLabelSize.height;
    float minWidth = expectedLabelSize.width;
    // Using const we make sure the badge doesn't get too smal
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    
    // Animate the size modification if needed
    [UIView animateWithDuration:0.2 animations:^{
        self.badge.frame = CGRectMake(BBoriginX, BBoriginY, minWidth + BBBadgeMargin, minHeight + BBBadgeMargin);
        self.badge.layer.cornerRadius   = (minHeight + BBBadgeMargin) / 2;
        self.badge.layer.masksToBounds = YES;
    }];
    
}

- (UILabel *)duplicateLabel:(UILabel *)labelToCopy
{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    
    return duplicateLabel;
}

- (void)removeBadge
{
    // Animate badge removal
    [UIView animateWithDuration:0.2 animations:^{
        self.badge.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.badge removeFromSuperview];
        self.badge = nil;
    }];
}

#pragma mark - Setters

- (void)setBadgeValue:(NSString *)badgeValue
{
    // Set new value
    _badgeValue = badgeValue;

    // When changing the badge value check if we need to remove the badge
    if (!badgeValue || [badgeValue isEqualToString:@""] || ([badgeValue isEqualToString:@"0"] && self.shouldHideBadgeAtZero)) {
        [self removeBadge];

        return;
    }
    
    // Otwhersise check if badge already exists
    else if(!self.badge) {
        // Create a new badge because not existing
        self.badge                      = [[UILabel alloc] initWithFrame:CGRectMake(BBoriginX, BBoriginY, 20, 20)];
        self.badge.textColor            = self.badgeTextColor;
        self.badge.backgroundColor      = self.badgeBGColor;
        self.badge.font                 = self.badgeFont;
        self.badge.textAlignment        = NSTextAlignmentCenter;
        [self.customView addSubview:self.badge];
    }
    
    [self updateBadgeValue];
}

- (void)setBadgeBGColor:(UIColor *)badgeBGColor
{
    _badgeBGColor = badgeBGColor;
    
    if (self.badge) {
        [self refreshBadge];
    }
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    _badgeTextColor = badgeTextColor;
    
    if (self.badge) {
        [self refreshBadge];
    }
}

- (void)setBadgeFont:(UIFont *)badgeFont
{
    _badgeFont = badgeFont;
    
    if (self.badge) {
        [self refreshBadge];
    }
}

@end