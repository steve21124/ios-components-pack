//
//  AppDelegate.h
//  museum-ios
//
//  Created by Artur on 30/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeController.h"

@class JASidePanelController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JASidePanelController *viewController;

@property (nonatomic, strong) HomeController *homeController;

@end

