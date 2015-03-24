//
//  ViewController.m
//  CustomButton
//
//  Created by Artur on 08/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CustomButton *friendsButton;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CustomButton *button = [CustomButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(100, 100, 200, 60);
//    [self.view addSubview:button];
}

- (IBAction)friendsButtonWasPressed:(id)sender
{
    NSLog(@"Friends Button");
}

@end
