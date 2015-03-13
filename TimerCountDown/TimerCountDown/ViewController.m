//
//  ViewController.m
//  TimerCountDown
//
//  Created by Artur on 12/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;

@property (weak, nonatomic) IBOutlet UIButton *countDownButton;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) NSDate *addDate;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - Timer from Date Picker

- (IBAction)coundDownButtonWasPressed:(id)sender
{
    //Remove the time component from the datePicker.  We care only about the date
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    NSUInteger preservedComponents = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay);
    
    self.datePicker.date = [calendar dateFromComponents:[calendar components:preservedComponents fromDate:self.datePicker.date]];
    
    //Set up a timer that calls the updateTime method every second to update the label
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateTime)
                                           userInfo:nil
                                            repeats:YES];
    
}

-(void)updateTime
{
    //Get the time left until the specified date
    NSInteger ti = ((NSInteger)[self.datePicker.date timeIntervalSinceNow]);
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600) % 24;
    NSInteger days = (ti / 86400);
    
    //Update the label with the remaining time
    self.countDownLabel.text = [NSString stringWithFormat:@"%02i days %02i hrs %02i min %02i sec", days, hours, minutes, seconds];
}


#pragma mark - Timer from Text Field

- (IBAction)startButtonWasPressed:(id)sender
{
    NSDate *date = [NSDate date];
    
    NSInteger minutesToAdd = [self.textField.text integerValue];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setMinute:minutesToAdd];
    
    NSDate *newDate = [calendar dateByAddingComponents:components toDate:date options:0];
    
    self.addDate = newDate;
    
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateTiming)
                                           userInfo:nil
                                            repeats:YES];
}

-(void)updateTiming
{
    //Get the time left until the specified date
    NSInteger ti = ((NSInteger)[self.addDate timeIntervalSinceNow]);
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600) % 24;
    NSInteger days = (ti / 86400);
    
    //Update the label with the remaining time
    self.countDownLabel.text = [NSString stringWithFormat:@"%02i days %02i hrs %02i min %02i sec", days, hours, minutes, seconds];
}


@end
