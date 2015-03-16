 # Alarm Clock


Use UILocalNotification to create - Alarm Clock

1. First we need `permisssions (sound | badge | alert)` for local notification

2. Shedule local notification by date

```objc

- (void)setButtonWasPressed:(id)sender
{
    [self scheduleLocalNotificationWithDate:_dateTimePicker.date andBlock:^(BOOL isScheduled) {
        if (isScheduled) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Notification was sheduled" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }];
}

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
```



