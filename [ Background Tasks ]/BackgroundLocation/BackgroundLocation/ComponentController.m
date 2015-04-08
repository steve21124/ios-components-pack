//
//  ComponentController.m
//  BackgroundLocation
//
//  Created by Artur on 06/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ComponentController.h"
#import "LocationManager.h"
#import "LocationManager.h"

@interface ComponentController () <LocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation ComponentController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [LocationManager sharedManager].delegate = self;
    [[LocationManager sharedManager] startLocation];
    [[LocationManager sharedManager] startGeocodeLocation];
}

#pragma mark - LocationManagerDelegate

- (void)locationManagerGetAddress:(NSString *)address
{
    self.addressLabel.text = address;
}


@end
