//
//  ViewController.m
//  ShakeGesture-Tests
//
//  Created by Artur on 10/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView; //rear view
@property (weak, nonatomic) IBOutlet UIView *grayView; //front view

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Shake Gesture

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (UIEventSubtypeMotionShake) {
        
        NSLog(@"I'm shaking!");
        
        [self.view bringSubviewToFront:_blueView];
    }
}

#pragma mark - Events

- (IBAction)blueViewWasPressed:(id)sender {
    [self.view sendSubviewToBack:_blueView];
}

@end
