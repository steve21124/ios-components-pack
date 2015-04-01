//
//  KZMHomeController.m
//  DynamicTableViewCellHeight
//
//  Created by Artur on 31/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "KZMHomeController.h"
#import "KZMMuzeumCell.h"

@interface KZMHomeController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_tableData;
    NSArray *_imageData;
    
    KZMMuzeumCell *_nameCell;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation KZMHomeController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:@"KZMMuzeumCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"MuzeumCell"];
    
    _nameCell = [cellNib instantiateWithOwner:nil options:nil][0];
    
    _tableData = @[
                   @"Центр современной культуры Смена",
                   @"Литературный музей Габдуллы Тукая",
                   @"Музей истории Казанского Университета",
                   @"Дом-музей В.И. Ленина",
                   @"Музей Е.А. Боратынского",
                   @"Музей Л.Н. Толстого",
                   @"Литературный музей А.М. Горького",
                   @"Казанские музеи",
                   @"Музей-заповедник Казанский Кремль",
                   @"Национальный музей РТ",
                   @"Музей изобразительных искусств РТ",
                   @"Музей Пушечный двор",
                   @"Национальная галерея Хазинэ",
                   @"Музей истории государственности татарского народа",
                   @"Центр современной культуры Смена",
                   @"Литературный музей Габдуллы Тукая",
                   @"Музей истории Казанского Университета",
                   @"Дом-музей В.И. Ленина",
                   @"Музей Е.А. Боратынского",
                   @"Музей Л.Н. Толстого",
                   @"Литературный музей А.М. Горького",
                   @"Казанские музеи",
                   @"Музей-заповедник Казанский Кремль",
                   @"Национальный музей РТ",
                   @"Музей изобразительных искусств РТ",
                   @"Музей Пушечный двор",
                   @"Национальная галерея Хазинэ",
                   @"Музей истории государственности татарского народа"
                   ];
    
//    _tableData = @[
//                   
//                   ];
    
    //[self configureTableView];
}

- (void)configureTableView
{
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //self.tableView.estimatedRowHeight = 45;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KZMMuzeumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MuzeumCell" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(KZMMuzeumCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.muzeumNameLabel.text = [_tableData objectAtIndex:indexPath.row];
}

#pragma mark - Cell Height

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self configureCell:_nameCell atIndexPath:indexPath];
//    [_nameCell layoutSubviews];
//    
//    CGFloat height = [_nameCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
//    return height + 1;
//}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 50.f;
//}


@end
