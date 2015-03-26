Facebook SSO Authentication
==

1. In Info.plist add `Key > FacebookAppID and Value > 783515061684992`

2. Target > Project > URL Types

Add `URL Type > URL Schemes fb783515061684992` (SSO Authentication work with url scheme.)

3. Add FacebookSDK.framework from Podfile or manually to project.

4. AppDelegate

```objc
- (void)applicationDidBecomeActive:(UIApplication *)application 
{
    // FBSample logic
    // Call the 'activateApp' method to log an app event for use in analytics and advertising reporting.
    [FBAppEvents activateApp];

    // FBSample logic
    // We need to properly handle activation of the application with regards to SSO
    //  (e.g., returning from iOS 6.0 authorization dialog or from fast app switching).
    [FBAppCall handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application 
{
    // FBSample logic
    // if the app is going away, we close the session object
    [FBSession.activeSession close];
}

#pragma mark Facebook methods
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                    fallbackHandler:^(FBAppCall *call) {
                        NSLog(@"In fallback handler");
                    }];
}
```
5.  ViewController

```objc
//Protocol
@interface ViewController () <FBLoginViewDelegate>

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
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
user:(id<FBGraphUser>)user {
}

- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
}

```