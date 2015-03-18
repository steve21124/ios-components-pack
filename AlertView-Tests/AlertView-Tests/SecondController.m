//
//  SecondController.m
//  AlertView-Tests
//
//  Created by Artur on 18/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "SecondController.h"
#import <TSMessages/TSMessage.h>

@interface SecondController ()

@end

@implementation SecondController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)nextErrorButtonWasPressed:(id)sender
{
    [TSMessage showNotificationInViewController:self
                                          title:@"Error title"
                                       subtitle:nil
                                           type:TSMessageNotificationTypeError ];
}

- (IBAction)successButtonWasPressed:(id)sender
{
    [TSMessage showNotificationWithTitle:@"Settings saved"
                                    type:TSMessageNotificationTypeSuccess];
}

- (IBAction)warningButtonWasPressed:(id)sender
{
    [TSMessage showNotificationInViewController:self
                                          title:nil
                                       subtitle:@"Warning"
                                           type:TSMessageNotificationTypeWarning
                                       duration:2.0];
}

- (IBAction)messageButtonWasPressed:(id)sender
{
    [TSMessage showNotificationInViewController:self
                                          title:@"Title"
                                       subtitle:@"Subtitle"
                                           type:TSMessageNotificationTypeMessage
                                       duration:1.0
                           canBeDismissedByUser:YES];
    
}


@end
