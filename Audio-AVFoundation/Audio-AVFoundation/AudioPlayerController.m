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
    NSString *audioUrlPath = [[NSBundle mainBundle] pathForResource:@"warning" ofType:@"caf"];
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
