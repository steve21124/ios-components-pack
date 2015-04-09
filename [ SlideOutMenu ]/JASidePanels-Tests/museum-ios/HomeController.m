//
//  HomeController.m
//  museum-ios
//
//  Created by Artur on 02/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "HomeController.h"

@interface HomeController ()


@end

@implementation HomeController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(msgResponder:) name:@"LeftPanelMsg" object:nil];
    
    //self.museumLabel.text = @"Pushka";
}

- (void)msgResponder:(NSNotification *)notification
{
    NSLog(@"name: %@ object: %@", notification.name, notification.object);
    
    self.museumLabel.text = notification.object;
}


@end
