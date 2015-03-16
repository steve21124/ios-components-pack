//
//  AudioManager.h
//  Audio-AVFoundation
//
//  Created by Artur on 16/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

@import Foundation;

@interface AudioManager : NSObject

+ (instancetype)sharedManager;

//Setup audio from bundle
- (void)setupAudio:(NSString *)audio;

- (void)playAudio;
- (void)stopAudio;

@end
