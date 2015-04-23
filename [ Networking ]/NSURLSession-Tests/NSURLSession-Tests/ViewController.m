//
//  ViewController.m
//  NSURLSession-Tests
//
//  Created by Artur on 16/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

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

- (IBAction)getJSonWasPressed:(id)sender
{
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                NSLog(@"%@", json);
                                                
                                            }];
    
    [task resume];
}



- (IBAction)downloadFileWasPressed:(id)sender {
}


- (IBAction)postJsonWasPressed:(id)sender {
}




@end
