//
//  KMHomeController.m
//  museum-ios
//
//  Created by Artur on 31/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "KMHomeController.h"
#import "SWRevealViewController.h"

@interface KMHomeController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;

@end

@implementation KMHomeController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customSetup];
}

- (void)customSetup
{
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.revealButtonItem setTarget: self.revealViewController];
        [self.revealButtonItem setAction: @selector( revealToggle: )];
        [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    }
}

#pragma mark state preservation / restoration

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    // Save what you need here
    [super encodeRestorableStateWithCoder:coder];
}


- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    // Restore what you need here
    [super decodeRestorableStateWithCoder:coder];
}


- (void)applicationFinishedRestoringState
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    // Call whatever function you need to visually restore
    [self customSetup];
}


@end
