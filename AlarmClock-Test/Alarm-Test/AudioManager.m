//
//  AudioManager.m
//  Audio-AVFoundation
//
//  Created by Artur on 16/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

@import AVFoundation;
#import "AudioManager.h"


@interface AudioManager()<AVAudioPlayerDelegate>

@property (nonatomic, retain) AVAudioPlayer *player;

@end

@implementation AudioManager

#pragma mark - Shared Singleton

+ (instancetype)sharedManager
{
    static AudioManager *manager = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

#pragma mark - Methods

-(void)setupAudio:(NSString *)audio
{
    NSString *audioUrlPath = [[NSBundle mainBundle] pathForResource:audio ofType:nil];
    NSURL *pathUrl = [[NSURL alloc] initFileURLWithPath:audioUrlPath];
    
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:pathUrl error:&error];
    self.player.numberOfLoops = 3;
    self.player.delegate = self;
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        [self.player prepareToPlay];
    }
}

- (void)playAudio
{
    [self.player play];
}

- (void)stopAudio
{
    [self.player stop];
}

@end
