//
//  ViewController.m
//  CustomTransitions
//
//  Created by Artur on 04/10/14.
//  Copyright (c) 2014 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"

//Controllers
#import "SecondController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(presentInfo:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:swipe];
}

#pragma mark - UI interactions

-(void)presentInfo:(UIGestureRecognizer*)gesture
{
    SecondController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondController"];
    [self.navigationController pushViewController:secondVC animated:YES];
}


@end