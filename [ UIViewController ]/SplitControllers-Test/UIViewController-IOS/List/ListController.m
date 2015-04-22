//
//  ListController.m
//  UIViewController-IOS
//
//  Created by Artur on 27/10/14.
//  Copyright (c) 2014 superarthur.io. All rights reserved.
//

#import "ListController.h"
#import "CommunicationCell.h"


@interface ListController ()

@end

@implementation ListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Register NIBs
    UINib *cellNib = [UINib nibWithNibName:@"CommunicationCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"CommunicationCell"];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell;
//    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
//    }
//    
//    cell.textLabel.text = @"List";
//    
//    return cell;
    
    CommunicationCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"CommunicationCell"];
    
    if (cell == nil) {
        cell = [[CommunicationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommunicationCell"];
    }
    
    cell.mainQuestionLabel.text = @"Как определить необходимое количество тест полосок";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
