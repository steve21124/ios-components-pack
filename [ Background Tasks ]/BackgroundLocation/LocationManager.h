//
//  LocationManager.h
//  BackgroundLocation
//
//  Created by Artur on 06/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LocationManagerDelegate <NSObject>

@optional
//delegate methods
- (void)locationManagerGetAddress:(NSString *)address;

@end

@interface LocationManager : NSObject

//delegate
@property (nonatomic, assign) id<LocationManagerDelegate>delegate;

//singleton
+ (instancetype)sharedManager;

//methods
- (void)startLocation;
- (void)startGeocodeLocation;

@end
