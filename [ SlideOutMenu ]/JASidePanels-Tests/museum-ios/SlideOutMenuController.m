//
//  SlideOutMenuController.m
//  museum-ios
//
//  Created by Artur on 02/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "SlideOutMenuController.h"
#import "JASidePanelController.h"
#import "HomeController.h"
#import "UIViewController+JASidePanel.h"
#import "AppDelegate.h"


@interface SlideOutMenuController ()

@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation SlideOutMenuController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)changeCenterPanelTapped:(id)sender {
    
   
}

- (IBAction)kremlinButtonWasPressed:(id)sender
{
    HomeController *homeVC = (HomeController *)_appDelegate.homeController;
    
    self.sidePanelController.centerPanel = [[UINavigationController alloc] initWithRootViewController:homeVC];

    
    NSNotification *msg = [NSNotification notificationWithName:@"LeftPanelMsg" object:@"Kremlin"];
    
    [[NSNotificationCenter defaultCenter] postNotification:msg];
    
}

- (IBAction)cannonYardWasPressed:(id)sender
{
    
}

@end
