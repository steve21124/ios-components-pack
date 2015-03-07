//
//  MapController.m
//  MapKit-Test
//
//  Created by Artur on 15/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "MapController.h"
#import <MapKit/MapKit.h>

@interface MapController () <MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (assign, nonatomic) CLLocationCoordinate2D carCoordinate;
@property (assign, nonatomic) CLLocationCoordinate2D userCoordinate;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) double distanceInMeters;

@end

@implementation MapController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.showsUserLocation = YES;
    
    //Get Current Location
    [self setupLocation];
    [self setupCarWithLocation];
}

// TODO:  Расставить в правильной последовательности:

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations\
{
    CLLocation *location = [locations lastObject];
    NSLog(@"\n\nlatitude: %f \nlongitude: %f", location.coordinate.latitude, location.coordinate.longitude);
    
    self.userCoordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation:(id<MKAnnotation>) annotation
{
    if (annotation == mapView.userLocation) {
        return nil;
    }
    else
    {
        MKAnnotationView *pin = (MKAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier: @"VoteSpotPin"];
        if (pin == nil) {
            pin = [[MKAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"TestPin"];
        } else {
            pin.annotation = annotation;
        }
        
        [pin setImage:[UIImage imageNamed:@"car-50.png"]];
        pin.canShowCallout = YES;
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        return pin;
    }
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor yellowColor];
    renderer.lineWidth = 5.0;
    
    return renderer;
}

#pragma mark - Initializations

- (void)setupCarWithLocation
{
    MKCoordinateRegion myRegion;
    CLLocationCoordinate2D center;
    
    //Kolco
//    55.7869624;
//    49.12269473;
    //Fun24
//    55.76835367
//    49.1019237
    
    self.carCoordinate = CLLocationCoordinate2DMake(55.76835367, 49.1019237);
    center.latitude = _mapView.userLocation.coordinate.latitude;
    center.longitude = _mapView.userLocation.coordinate.longitude;
    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    
    myRegion.center = self.carCoordinate;
    myRegion.span = span;
    [self.mapView setRegion:myRegion animated:YES];
    
    // Add CAR annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = self.carCoordinate;
    point.title = @"Литературный музей им. Горького";
    point.subtitle = @"ул. Максима Горького, 10";
    
    [self.mapView addAnnotation:point];
}

- (void)setupLocation
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //In `Info.plist` > NSLocationWhenInUseUsageDescription > Location is requered to find out where you are
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
}

#pragma mark - Events

- (IBAction)routesButtonWasPressed:(id)sender
{
    [self routesBetweenCoordinates];
}

#pragma mark - Actions

- (void)routesBetweenCoordinates
{
    MKPlacemark *placemarkFrom = [[MKPlacemark alloc] initWithCoordinate:self.userCoordinate addressDictionary:nil];
    MKMapItem *mapItemFrom = [[MKMapItem alloc] initWithPlacemark:placemarkFrom];
    //mapItemFrom.placemark.coordinate = self.userCoordinate;
    
    MKPlacemark *placemarkTo = [[MKPlacemark alloc] initWithCoordinate:self.carCoordinate addressDictionary:nil];
    MKMapItem *mapItemTo = [[MKMapItem alloc] initWithPlacemark:placemarkTo];
    //mapItemFrom.placemark.coordinate = self.carCoordinate;
    
    [self findDirectionsFrom:mapItemFrom to:mapItemTo];
}

- (void)findDirectionsFrom:(MKMapItem *)source
                        to:(MKMapItem *)destination
{
    // Create an instance of MKDirectionsRequest
    MKDirectionsRequest *request =
    [[MKDirectionsRequest alloc] init];
    // Define the starting point for routing direction
    request.source = source;
    // Define the ending point for routing direction
    request.destination = destination;
    // Define if your app wants multiple routes
    // when they are available
    request.requestsAlternateRoutes = YES;
    request.transportType = MKDirectionsTransportTypeWalking;
    // Initialize directions object MKDirections
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    
    // Finally, calculate the directions
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         if (error) {
             NSLog(@"ERROR");
             NSLog(@"%@",[error localizedDescription]);
         } else {
             NSLog(@"route count %lu", (unsigned long)[response.routes count]);
             [self showRoute:response];
         }
     }];
}

-(void)showRoute:(MKDirectionsResponse *)response
{
    for (MKRoute *route in response.routes) {
        [_mapView addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
        
        for (MKRouteStep *step in route.steps) {
            NSLog(@"%@", step.instructions);
        }
    }
    
    MKRoute *route = [response.routes lastObject];
    CLLocationDistance distance = route.distance;
    
    NSLog(@"DISTANCE = %f", distance);
    self.distanceInMeters = distance;
    
    //route.transportType
    NSTimeInterval travelTime = route.expectedTravelTime;
    NSLog(@"TRAVEL_TIME = %f", travelTime);
}

@end
