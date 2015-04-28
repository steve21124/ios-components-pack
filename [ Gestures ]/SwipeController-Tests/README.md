Swipe Controllers
==

Категория UIViewController+Swipe

```objc
#import <UIKit/UIKit.h>

@interface UIViewController (Swipe)

- (void)setupLeftSwipe;   //popup
- (void)setupRightSwipe;  //dismiss

@end


#import "UIViewController+Swipe.h"

@implementation UIViewController (Swipe)

- (void)setupLeftSwipe
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
}

- (void)setupRightSwipe
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

- (void)dismiss:(UIGestureRecognizer*)gesture {
    [self.navigationController popViewControllerAnimated:YES];
}
``` 


@end


