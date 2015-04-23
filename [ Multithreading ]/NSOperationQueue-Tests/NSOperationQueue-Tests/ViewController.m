//
//  ViewController.m
//  NSOperationQueue-Tests
//
//  Created by Artur on 23/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation ViewController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Queue

//Очередь запросов
- (IBAction)requestQueueWasPressed:(id)sender
{
    self.operationQueue = [NSOperationQueue new];
    
    //Эта конструкция срабатывает сразу же.
    NSInvocationOperation *operation =
    [[NSInvocationOperation alloc] initWithTarget:self
                                         selector:@selector(authorizationTask)
                                           object:nil];
    [self.operationQueue addOperation:operation];
    //
    
    operation =
    [[NSInvocationOperation alloc] initWithTarget:self
                                         selector:@selector(configTask) object:nil];
    [self.operationQueue addOperation:operation];
    
    operation =
    [[NSInvocationOperation alloc] initWithTarget:self
                                         selector:@selector(variablesTask) object:nil];
    [self.operationQueue addOperation:operation];
    
    operation =
    [[NSInvocationOperation alloc] initWithTarget:self
                                         selector:@selector(messagesTask) object:nil];
    [self.operationQueue addOperation:operation];
}


#pragma mark - Requests
- (void)authorizationTask
{
    NSLog(@"authorizationRequest");
}

- (void)configTask
{
    NSLog(@"configRequest");
}

- (void)variablesTask
{
    NSLog(@"variablesRequest");
}

- (void)messagesTask
{
    NSLog(@"messagesRequest");
}


@end
