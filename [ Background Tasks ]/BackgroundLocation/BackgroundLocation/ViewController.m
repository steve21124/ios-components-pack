//
//  ViewController.m
//  BackgroundLocation
//
//  Created by Artur on 06/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) CLLocation *userLocation;
@property (nonatomic, strong) CLLocation *appleLocation;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self setupAppleLocation];
    [self setupLocation];
}

#pragma mark - Setup

- (void)setupLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    //self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;

    /*//In `Info.plist`: KEY - NSLocationWhenInUseUsageDescription > VALUE - Location is requered to find out where you are
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    */
    
    //In `Info.plist`: KEY - NSLocationAlwaysUsageDescription > VALUE - Location is requered to use always
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        //Always authorization allows the app to receive location updates both when the app is in the foreground and in the background (suspended or terminated).
        //[self.locationManager requestAlwaysAuthorization];
        [self requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
}

- (void)setupAppleLocation
{
    self.appleLocation = [[CLLocation alloc] initWithLatitude:37.509102 longitude:122.341854];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
   
    //dispatch_once
    static dispatch_once_t task;
    dispatch_once(&task, ^{
        self.appleLocation = location;
    });
    
    CLLocationDistance distance = [self.appleLocation distanceFromLocation:location];
    
    NSLog(@"\n\nlatitude : %f \nlongitude: %f \ndistance : %f", location.coordinate.latitude, location.coordinate.longitude, distance);
    
    //Preferred Walking speed ~ 1.4 m/s   >  1.4m/s*60s*10m = 840 meters.
    if (distance > 840) {
        NSLog(@"\n\n You need is more than 10 minutes to go to parking");
    }
}

#pragma mark - Actions

- (void)requestAlwaysAuthorization
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    // If the status is denied or only granted for when in use, display an alert
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusDenied) {
        NSString *title;
        title = (status == kCLAuthorizationStatusDenied) ? @"Location services are off" : @"Background location is not enabled";
        NSString *message = @"To use background location you must turn on 'Always' in the Location Services Settings";
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Settings", nil];
        [alertView show];
    }
    // The user has not enabled any location services. Request background authorization.
    else if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestAlwaysAuthorization];
    }
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        // Send the user to the Settings for this app
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:settingsURL];
    }
}

@end
