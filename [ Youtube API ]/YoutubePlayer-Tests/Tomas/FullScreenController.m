//
//  FullScreenController.m
//  Tomas
//
//  Created by Artur on 18/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "FullScreenController.h"
#import "YTPlayerView.h"

@interface FullScreenController () <YTPlayerViewDelegate>

@property (nonatomic, strong) IBOutlet YTPlayerView *playerView;

@end

@implementation FullScreenController

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
        
        UISwipeGestureRecognizer * swipedown =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipedown:)];
        swipedown.direction=UISwipeGestureRecognizerDirectionDown;
        [self.view addGestureRecognizer:swipedown];
    }
    
    UISwipeGestureRecognizer * swipedown =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipedown:)];
    swipedown.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipedown];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self performSelector:@selector(startToPlayVideo) withObject:nil afterDelay:1.0];
}

#pragma mark - Actions

-(void) startToPlayVideo
{
    [self.playerView playVideo];
}

- (void)swipedown:(UISwipeGestureRecognizer *)gestureRecognizer
{
    [self dismissViewControllerAnimated:self completion:nil];
}

#pragma mark - UIViewControllerRotation

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

@end
