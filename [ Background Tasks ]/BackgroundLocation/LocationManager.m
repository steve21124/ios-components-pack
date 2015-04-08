//
//  LocationManager.m
//  BackgroundLocation
//
//  Created by Artur on 06/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface LocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, strong) CLLocation *carLocation;
@property (nonatomic, strong) CLLocation *userLocation;

//Geocoding
@property (nonatomic, strong) CLGeocoder *geocoder;
@property (nonatomic, strong) CLPlacemark *placemark;


@end

@implementation LocationManager

#pragma mark - Shared Singleton

+ (instancetype)sharedManager
{
    static LocationManager *manager = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //[self setupCarLocation];
        //[self setupLocation];
        
    }
    return self;
}

//- (void)setupCarLocation
//{
//    //Parking Capture
//    NSArray *captures = [MMParkingCapture MR_findAll];
//    MMParkingCapture *capture = [captures lastObject];
//    
//    self.carLocation = [[CLLocation alloc] initWithLatitude:capture.latitudeValue longitude:capture.longitudeValue];
//}

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

#pragma mark - Actions

- (void)startLocation
{
    [self setupLocation];
}

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

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    
        //dispatch_once
        static dispatch_once_t task;
        dispatch_once(&task, ^{
            self.carLocation = location;
        });
    
    CLLocationDistance distance = [self.carLocation distanceFromLocation:location];
    
    NSLog(@"\n\nlatitude : %f \nlongitude: %f \ndistance : %f", location.coordinate.latitude, location.coordinate.longitude, distance);
    
    //Preferred Walking speed ~ 1.4 m/s   >  1.4m/s*60s*10m = 840 meters.
    if (distance > 840) {
        NSLog(@"\n\n You need is more than 10 minutes to go to parking");
    }
}

- (void)geocodeLocation:(void(^)(NSString *address))addressBlock
{
    NSLog(@"Resolving the Address");
    
    CLLocation *currentLocation = _userLocation;
    
    //__block NSString *addressText = nil;
    [self.geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            self.placemark = [placemarks lastObject];
            
            NSString *addressText = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@, %@",
                                      _placemark.subThoroughfare, _placemark.thoroughfare,
                                      _placemark.postalCode, _placemark.locality,
                                      _placemark.administrativeArea,
                                      _placemark.country];
            
            addressBlock(addressText);
            
        } else {
            NSLog(@"%@", error.debugDescription);
            
            addressBlock(nil);
        }
    } ];
    
    //[self.locationManager stopUpdatingLocation];
    //return addressText;
}

@end
