//
//  DynamicTableController.m
//  TableView-Tests
//
//  Created by Artur on 24/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "DynamicTableController.h"

@interface DynamicTableController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DynamicTableController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"kButtonHere"];
    }
    
    if (indexPath.row == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"kAnotherButtonHere"];
    }
    
    return cell;
}

@end
