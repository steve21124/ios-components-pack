//
//  ViewController.m
//  Facebook-sso-authentication
//
//  Created by Artur on 20/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <FBLoginViewDelegate>

@property (strong, nonatomic) id<FBGraphUser> loggedInUser;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create Login View so that the app will be granted "status_update" permission.
    FBLoginView *loginview = [[FBLoginView alloc] init];
    
    loginview.frame = CGRectOffset(loginview.frame, 5, 5);
#ifdef __IPHONE_7_0
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        loginview.frame = CGRectOffset(loginview.frame, 5, 25);
    }
#endif
#endif
#endif
    loginview.delegate = self;
    [self.view addSubview:loginview];
    [loginview sizeToFit];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
//    FBLinkShareParams *p = [[FBLinkShareParams alloc] init];
//    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
//    BOOL canShareFB = [FBDialogs canPresentShareDialogWithParams:p];
//    BOOL canShareiOS6 = [FBDialogs canPresentOSIntegratedShareDialogWithSession:nil];
//    BOOL canShareFBPhoto = [FBDialogs canPresentShareDialogWithPhotos];
    
//    self.buttonPostStatus.enabled = canShareFB || canShareiOS6;
//    self.buttonPostPhoto.enabled = canShareFBPhoto;
//    self.buttonPickFriends.enabled = NO;
//    self.buttonPickPlace.enabled = NO;
//    
//    // "Post Status" available when logged on and potentially when logged off.  Differentiate in the label.
//    [self.buttonPostStatus setTitle:@"Post Status Update (Logged Off)" forState:self.buttonPostStatus.state];
//    
//    self.profilePic.profileID = nil;
//    self.labelFirstName.text = nil;
//    self.loggedInUser = nil;
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
//    // here we use helper properties of FBGraphUser to dot-through to first_name and
//    // id properties of the json response from the server; alternatively we could use
//    // NSDictionary methods such as objectForKey to get values from the my json object
//    self.labelFirstName.text = [NSString stringWithFormat:@"Hello %@!", user.first_name];
//    // setting the profileID property of the FBProfilePictureView instance
//    // causes the control to fetch and display the profile picture for the user
//    self.profilePic.profileID = user.objectID;
//    self.loggedInUser = user;
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
//    // see https://developers.facebook.com/docs/reference/api/errors/ for general guidance on error handling for Facebook API
//    // our policy here is to let the login view handle errors, but to log the results
//    NSLog(@"FBLoginView encountered an error=%@", error);
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
//    // first get the buttons set for login mode
//    self.buttonPostPhoto.enabled = YES;
//    self.buttonPostStatus.enabled = YES;
//    self.buttonPickFriends.enabled = YES;
//    self.buttonPickPlace.enabled = YES;
//    
//    // "Post Status" available when logged on and potentially when logged off.  Differentiate in the label.
//    [self.buttonPostStatus setTitle:@"Post Status Update (Logged On)" forState:self.buttonPostStatus.state];
}

@end
