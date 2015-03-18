//
//  ViewController.m
//  Tomas
//
//  Created by Artur on 17/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"
#import "YTPlayerView.h"

@interface ViewController () <YTPlayerViewDelegate>

@property (nonatomic, strong) IBOutlet YTPlayerView *playerView;

@property(nonatomic, weak) IBOutlet UIButton *playButton;
@property(nonatomic, weak) IBOutlet UIButton *pauseButton;
@property(nonatomic, weak) IBOutlet UIButton *stopButton;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *videoId = @"0rf-vb2mXbk";
    
    // For a full list of player parameters, see the documentation for the HTML5 player
    // at: https://developers.google.com/youtube/player_parameters?playerVersion=HTML5
    NSDictionary *playerVars = @{
                                 @"controls" : @0,
                                 @"playsinline" : @1,
                                 @"autohide" : @1,
                                 @"showinfo" : @1,
                                 @"modestbranding" : @1,
                                 @"fs" : @1,
                                 @"autoplay" : @0,
                                 @"loop" : @0,
                                 @"enablejsapi": @1,
                                 @"rel": @0,
                                 };
    
    self.playerView.delegate = self;
    
    [self.playerView loadWithVideoId:videoId playerVars:playerVars];
    
    if ([self.restorationIdentifier isEqualToString:@"FullScreen"]) {
     
        CGRect frame = self.view.bounds;
        self.playerView.frame = frame;
        self.playerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    }
}

#pragma mark - Events

- (IBAction)fullScreenButtonWasPressed:(id)sender
{
    [self setupFullScreen];
    
    ViewController *forcePortrait = [self.storyboard instantiateViewControllerWithIdentifier:@"FullScreenController"];
    [self presentViewController:forcePortrait animated:NO completion:nil];
}

- (IBAction)buttonPressed:(id)sender {
    
    if (sender == self.playButton) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Playback started" object:self];
        [self.playerView playVideo];
    } else if (sender == self.stopButton) {
        [self.playerView stopVideo];
    } else if (sender == self.pauseButton) {
        [self.playerView pauseVideo];
    }
}

#pragma mark - Actions

- (void)setupFullScreen
{
    [self.playerView stopVideo];
}

- (void)receivedPlaybackStartedNotification:(NSNotification *) notification {
    if([notification.name isEqual:@"Playback started"] && notification.object != self) {
        [self.playerView pauseVideo];
    }
}

#pragma mark - UIViewControllerRotation

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
        return UIInterfaceOrientationMaskPortrait;
}

@end
