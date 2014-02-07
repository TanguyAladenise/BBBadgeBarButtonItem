BBBadgeBarButtonItem
==============

<p>Create a BarButtonItem with a badge on top. Easily customizable.</p>

<img alt="ScreenShot BarButtonItem" src="https://github.com/TanguyAladenise/BBBadgeBarButtonItem/blob/master/screenshot.png?raw=true" width="320px"/>


How To Get Started
------------------

It's quite easy, just add "BBBadgeBarButtonItem.h" and "BBBadgeBarButtonItem.m" into your xcodeproject. 
Don't forget to import it wherever you need them :

``` objective-c
#import "BBBadgeBarButtonItem.h"
```

Then you only need to instantiate your beautiful BBBadgeBarButtonItem and add it to your navigation bar

``` objective-c
UIButton *customButton = [[UIButton alloc] init];
//...

// Create and add our custom BBBadgeBarButtonItem
BBBadgeBarButtonItem *barButton = [[BBBadgeBarButtonItem alloc] initWithCustomUIButton:customButton];
// Set a value for the badge
barButton.badgeValue = @"1";

// Add it as the leftBarButtonItem of the navigation bar
self.navigationItem.leftBarButtonItem = barButton;
```

If you want your BarButtonItem to handle touch event and click, use a UIButton as customView


Usefull properties
---------------

Take a look at BBBadgeBarButtonItem.h to see how easily and quickly you can customize the badge.

<p>Manually change menu focus on item, with animation or not:</p>
``` objective-c
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
```

What else ?
---------------

The class is compatible with iOS >= 6.0.

There is a little demo project to help you if you need ;)

More
----

<p>Any suggestions are welcome ! as I am looking to learn good practices, to understand better behaviors and Objective-C in general !
Thank you.</p>

