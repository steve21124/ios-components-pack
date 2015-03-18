//
//  ViewController.m
//  AlertView-Tests
//
//  Created by Artur on 18/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"
#import <TSMessages/TSMessage.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [TSMessage setDefaultViewController:self];
    
}

- (IBAction)errorButtonWasPressed:(id)sender
{
    [TSMessage showNotificationWithTitle:@"Error"
                                subtitle:@"There was a problem with..."
                                    type:TSMessageNotificationTypeError];
}

- (IBAction)successButtonWasPressed:(id)sender
{
    [TSMessage showNotificationWithTitle:@"Success"
                                subtitle:@"This message was success"
                                    type:TSMessageNotificationTypeSuccess];
}

- (IBAction)warningButtonWasPressed:(id)sender
{
    [TSMessage showNotificationWithTitle:@"Warning"
                                subtitle:@"This message was warning"
                                    type:TSMessageNotificationTypeWarning];
}

- (IBAction)messageButtonWasPressed:(id)sender
{
    [TSMessage showNotificationWithTitle:@"Message"
                                subtitle:@"This message was choosing"
                                    type:TSMessageNotificationTypeMessage];
}





@end
