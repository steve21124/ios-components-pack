//
//  SplashController.m
//  SplashScreen
//
//  Created by Artur on 11/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "SplashController.h"
#import "ViewController.h"

@interface SplashController ()

@end

@implementation SplashController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSplashTimer];
}

#pragma mark - Setup

- (void)setupSplashTimer
{
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(transitionToAuthorization)
                                   userInfo:nil
                                    repeats:NO];
}

#pragma mark - Action

- (void)transitionToAuthorization
{
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    [self presentViewController:vc animated:NO completion:nil];
}

@end
