//
//  HomeController.m
//  UIViewController-IOS
//
//  Created by Artur on 27/10/14.
//  Copyright (c) 2014 superarthur.io. All rights reserved.
//

#import "HomeController.h"
#import "QuestionsController.h"
#import "ObjectionsController.h"
#import "TypeController.h"
#import "ListController.h"

@interface HomeController ()

@property (nonatomic, strong) ObjectionsController *ovc;
@property (nonatomic, strong) QuestionsController *qvc;

@property (strong, nonatomic) IBOutlet ListController *listController;
@property (strong, nonatomic) IBOutlet TypeController *typeController;

@end

@implementation HomeController

#pragma mark - View lifecycle
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didGetFightersListNotification:)
                                                 name:@"FightersListNotification" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
}

#pragma mark - Actions

//From Storyboard
- (IBAction)questionsPressed:(id)sender
{
    self.qvc = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionsController"];
    [self.view addSubview:_qvc.view];
    
    [_qvc.view setFrame:CGRectMake(1024-250-250-50, 70, 250, 768)];
}

//From XIB
- (IBAction)objectionsPressed:(id)sender
{
    self.ovc = [[ObjectionsController alloc] initWithNibName:@"ObjectionsView" bundle:nil];
    [self.view addSubview:_ovc.view];
    
    [_ovc.view setFrame:CGRectMake(1024-250, 70, 250, 768)];
}

- (IBAction)typePressed:(id)sender
{
//    self.tVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TypeController"];
//    [self.view addSubview:_tVC.view];
//    [_tVC.view setFrame:CGRectMake(0, 70, 200, 768)];
}

- (IBAction)listPressed:(id)sender
{
//    self.lVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ListController"];
//    [self.view addSubview:_lVC.view];
//    [_lVC.view setFrame:CGRectMake(200, 70, 200, 768)];
}

- (void)didGetFightersListNotification:(NSNotification *)notification
{
    NSLog(@"\n\n%@", [notification object]);
}

@end
