//
//  RootNavigationController.h
//  DynamicTableViewCellHeight
//
//  Created by Artur on 02/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

@import UIKit;

typedef enum {
    NavigationBarStyleClear = 0,
    NavigationBarStyleBlue,
    NavigationBarStyleWhiteTransparent,
    NavigationBarStyleBlackTransparent,
    NavigationBarStyleLightGray,
    NavigationBarStyleDarkGray
    
} NavigationBarStyle;

typedef enum {
    BarButtonStyleWhite = 0,
    BarButtonStyleGray,
    BarButtonStyleLightGray
    
} BarButtonStyle;

@interface RootNavigationController : UINavigationController

+ (RootNavigationController *)sharedController;

- (void)setNavigationBarStyle:(NavigationBarStyle)style;
- (void)setBackBarButtonStyle:(BarButtonStyle)style;

@end
