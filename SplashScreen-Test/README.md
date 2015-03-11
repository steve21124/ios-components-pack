Splash Screen - возможность управлять таймингом Splash screen-a.
===


**1 Способ LaunchScreen.xib**

Размещаем в LaunchScreen imageView и растягиваем (расставляем Constraints)
Меняем размеры на 320x560

```
//Задержка при запуске на 2 секунды
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   [NSThread sleepForTimeInterval:2];

   return YES;
}
```

**2 Способ - Создание нового контроллера с таймингом**
```
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
