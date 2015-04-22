//
//  QuestionsController.m
//  UIViewController-IOS
//
//  Created by Artur on 27/10/14.
//  Copyright (c) 2014 superarthur.io. All rights reserved.
//

#import "QuestionsController.h"
#import "CommunicationCell.h"

@interface QuestionsController ()

@end

@implementation QuestionsController

#pragma mark - View lifecycle

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
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
//    }
//    cell.textLabel.text = @"Question";
//    return cell;
    
    CommunicationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommunicationCell"];
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
