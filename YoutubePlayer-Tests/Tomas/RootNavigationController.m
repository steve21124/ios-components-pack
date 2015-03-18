//
//  RootNavigationController.m
//  Tomas
//
//  Created by Artur on 18/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Rotation Manager

- (BOOL)shouldAutorotate
{
    UIViewController *topController = (UIViewController *)self.topViewController;
    return [topController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    UIViewController *topController = (UIViewController *)self.topViewController;
    return [topController supportedInterfaceOrientations];
}

@end
