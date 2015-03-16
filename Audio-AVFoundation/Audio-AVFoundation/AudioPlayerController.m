//
//  AudioPlayerController.m
//  Audio-AVFoundation
//
//  Created by Artur on 07/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "AudioPlayerController.h"
#import "AudioManager.h"

@interface AudioPlayerController ()

@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end

@implementation AudioPlayerController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.clearsSelectionOnViewWillAppear = NO;
}

#pragma mark - Events

- (IBAction)playButtonWasPressed:(id)sender
{
    if (!_playButton.selected){
        self.playButton.selected = YES;
        
        [[AudioManager sharedManager] setupAudio:@"drum_1.mp3"];
        [[AudioManager sharedManager] playAudio];
    }
    else {
        self.playButton.selected = NO;

        [[AudioManager sharedManager] stopAudio];
    }
}

@end
