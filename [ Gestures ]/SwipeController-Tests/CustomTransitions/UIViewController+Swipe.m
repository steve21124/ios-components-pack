//
//  UIViewController+Swipe.m
//  CustomTransitions
//
//  Created by Artur on 28/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

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

@end
