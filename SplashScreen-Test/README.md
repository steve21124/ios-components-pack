Splash Screen - how to create spash screens with timing
===

## LaunchScreen.xib

Put UIImageView in `LaunchScreen.xib` and add space constraints (top, bottom, left, right)
Change xib size: 320x560

```objc
//Задержка при запуске на 2 секунды
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   [NSThread sleepForTimeInterval:2];

   return YES;
}
```

## Create new SplashController with scheduling time (NSTimer)

```objc
@implementation SplashController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
   [super viewDidLoad];
   [self setupSplashTimer];
}

#pragma mark - Setup

- (void)setupSplashTimer
{
   [NSTimer scheduledTimerWithTimeInterval:2.0
                                    target:self
                                  selector:@selector(transitionToAuthorization)
                                  userInfo:nil
                                   repeats:NO];
}

#pragma mark - Action

- (void)transitionToAuthorization
{
   ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
   [self presentViewController:vc animated:NO completion:nil];
}
```
