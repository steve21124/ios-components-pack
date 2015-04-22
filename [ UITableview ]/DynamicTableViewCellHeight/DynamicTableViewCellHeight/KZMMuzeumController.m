//
//  MuzeumController.m
//  DynamicTableViewCellHeight
//
//  Created by Artur on 02/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "KZMMuzeumController.h"
#import "RootNavigationController.h"

@interface KZMMuzeumController ()

@end

@implementation KZMMuzeumController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[RootNavigationController sharedController] setNavigationBarStyle:NavigationBarStyleClear];
    [[RootNavigationController sharedController] setBackBarButtonStyle:BarButtonStyleLightGray];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    
    
    NSLog(@"\n\n viewWillAppear inside");
}

@end
