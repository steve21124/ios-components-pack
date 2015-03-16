//
//  ViewController.m
//  Alarm-Test
//
//  Created by Artur on 16/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *dateTimePicker;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Events

- (void)setButtonWasPressed:(id)sender
{
    //For logging CORRECT DATE in console
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    NSString *dateTimeString = [dateFormatter stringFromDate:_dateTimePicker.date];
    NSLog(@"\n\nSet Date: %@", dateTimeString);
    
    //Set local notification method
    [self scheduleLocalNotificationWithDate:_dateTimePicker.date andBlock:^(BOOL isScheduled) {
        if (isScheduled) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Notification was sheduled" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}

- (void)cancelButtonWasPressed:(id)sender {
    
}

#pragma mark - Actions

- (void) scheduleLocalNotificationWithDate:(NSDate *)fireDate andBlock:(void(^)(BOOL isScheduled))block
{
    //Permissions for local notifications (sound | badge | alert)
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    //Set local notification
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = fireDate;
    notification.alertBody = @"Time to wake up!";
    notification.soundName = @"warning.caf";      // UILocalNotificationDefaultSoundName
    notification.applicationIconBadgeNumber = 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    //present notification now
    //[[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    
    block(YES);
}

@end
