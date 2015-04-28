//
//  SecondController.m
//  CustomTransitions
//
//  Created by Artur on 04/10/14.
//  Copyright (c) 2014 Artur Igberdin. All rights reserved.
//

#import "SecondController.h"

//Categories
#import "UIViewController+Swipe.h"


@interface SecondController ()

@end

@implementation SecondController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
//    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
//    swipe.direction = UISwipeGestureRecognizerDirectionRight;
//    [self.view addGestureRecognizer:swipe];
    
    [self setupRightSwipe];
}

//- (void)dismiss:(UIGestureRecognizer*)gesture {
//    [self.navigationController popViewControllerAnimated:YES];
//}

@end
