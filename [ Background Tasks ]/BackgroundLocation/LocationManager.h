//
//  LocationManager.h
//  BackgroundLocation
//
//  Created by Artur on 06/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LocationManager : NSObject

+ (instancetype)sharedManager;

- (void)startLocation;

- (void)geocodeLocation:(void(^)(NSString *address))addressBlock;

@end
