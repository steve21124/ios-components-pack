//
//  LocationController.m
//  MapKit-Test
//
//  Created by Artur on 15/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "LocationController.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *userLocation;

@end

@implementation LocationController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLocation];
}

- (void)setupLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //In `Info.plist`: KEY - NSLocationWhenInUseUsageDescription > VALUE - Location is requered to find out where you are
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    NSLog(@"\n\nlatitude: %f \nlongitude: %f", location.coordinate.latitude, location.coordinate.longitude);
}

//- (void)locationManager:(CLLocationManager*)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
//{
//    switch (status) {
//        case kCLAuthorizationStatusNotDetermined: {
//            NSLog(@"User still thinking..");
//        } break;
//        case kCLAuthorizationStatusDenied: {
//            NSLog(@"User hates you");
//        } break;
//        case kCLAuthorizationStatusAuthorizedWhenInUse:
//        case kCLAuthorizationStatusAuthorizedAlways: {
//            [_locationManager startUpdatingLocation]; //Will update location immediately
//        } break;
//        default:
//            break;
//    }
//}


//Calculate distance between two locations.
//- (void)calculateDistanceBetweenTwoLocations
//{
//    CLLocation *locA = [[CLLocation alloc] initWithLatitude:lat1 longitude:long1];
//    CLLocation *locB = [[CLLocation alloc] initWithLatitude:lat2 longitude:long2];
//    CLLocationDistance distance = [locA distanceFromLocation:locB];
//}



@end
