//
//  AudioPlayerController.m
//  Audio-AVFoundation
//
//  Created by Artur on 07/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

@import AVFoundation;
#import "AudioPlayerController.h"

@interface AudioPlayerController ()<AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *playButton;
//AVFoundation
@property (nonatomic, retain) AVAudioPlayer *player;

@end

@implementation AudioPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Events

- (IBAction)playButtonWasPressed:(id)sender
{
    if (!_playButton.selected){
        self.playButton.selected = YES;
        
        [self setupAudio];
        [self playAudio];
    }
    else {
        self.playButton.selected = NO;
        
        [self stopAudio];
    }
}

#pragma mark - Actions

- (void)setupAudio
{
    NSString *audioUrlPath = [[NSBundle mainBundle] pathForResource:@"sound_1" ofType:@"wav"];
    NSURL *pathUrl = [[NSURL alloc] initFileURLWithPath:audioUrlPath];
    
    NSError *error;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:pathUrl error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        [self.player prepareToPlay];
    }
    self.player.delegate = self;
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
