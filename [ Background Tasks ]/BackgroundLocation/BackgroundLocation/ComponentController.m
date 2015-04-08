//
//  ComponentController.m
//  BackgroundLocation
//
//  Created by Artur on 06/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ComponentController.h"
#import "LocationManager.h"

@interface ComponentController ()

@end

@implementation ComponentController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[LocationManager sharedManager] startLocation];
    
    [[LocationManager sharedManager] geocodeLocation:^(NSString *address) {
        
    }];
}


@end
