//
//  KZMHomeController.m
//  DynamicTableViewCellHeight
//
//  Created by Artur on 31/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "KZMHomeController.h"

#import "KZMMuzeumCell.h"
#import "KZMMainTitleCell.h"

#import "KZMMuzeumController.h"
#import "RootNavigationController.h"

@interface KZMHomeController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_tableData;
    NSArray *_imageData;
    
    KZMMuzeumCell *_nameCell;
    KZMMainTitleCell *_titleCell;
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
    
    [[RootNavigationController sharedController] setNavigationBarStyle:NavigationBarStyleClear];
    [[RootNavigationController sharedController] setBackBarButtonStyle:BarButtonStyleWhite];
    
    //Name Cell
    UINib *cellNib = [UINib nibWithNibName:@"KZMMuzeumCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"MuzeumCell"];
    _nameCell = [cellNib instantiateWithOwner:nil options:nil][0];
    
    //Title Cell
    UINib *cellTitleNib = [UINib nibWithNibName:@"KZMMainTitleCell" bundle:nil];
    [self.tableView registerNib:cellTitleNib forCellReuseIdentifier:@"MainTitleCell"];
    _titleCell = [cellTitleNib instantiateWithOwner:nil options:nil][0];
    
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
    
    
    _imageData = @[@"icon_tukay",
                   @"icon_university",
                   @"icon_kremlin",
                   @"icon_izo",
                   @"icon_boratinsky",
                   @"icon_hazine",
                   @"icon_intro",
                   @"icon_izo",
                   @"icon_cannon",
                   @"icon_kremlin",
                   @"icon_national",
                   @"icon_smena",
                   @"icon_gorky",
                   @"icon_statehood",
                   @"icon_tolstoy"
                   ];
    
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
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        KZMMainTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTitleCell" forIndexPath:indexPath];
        [self configureTitleCell:cell atIndexPath:indexPath];
        return cell;
    }
    
    KZMMuzeumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MuzeumCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureTitleCell:(KZMMainTitleCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    //Cell Selection
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *selectedView = [[UIView alloc]init];
    selectedView.backgroundColor = [UIColor blackColor];
    cell.selectedBackgroundView = selectedView;
}

- (void)configureCell:(KZMMuzeumCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    //Label
    cell.muzeumNameLabel.text = [_tableData objectAtIndex:indexPath.row];
    
    //Image
    NSString *imageName = [_imageData objectAtIndex:indexPath.row];
    cell.muzeumImageView.image = [UIImage imageNamed:imageName];
    
    //Cell Selection
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView *selectedView = [[UIView alloc]init];
    selectedView.backgroundColor = [UIColor blackColor];
    cell.selectedBackgroundView = selectedView;
}

#pragma mark - Cell Height

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    if (indexPath.row == 0) {
        [self configureTitleCell:_titleCell atIndexPath:indexPath];
        [_titleCell layoutSubviews];
         height = [_titleCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    }
    else {
        [self configureCell:_nameCell atIndexPath:indexPath];
        [_nameCell layoutSubviews];
        height = [_nameCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    }
    
    return height + 1;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 50.f;
//}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\n\n didSelect = %ld", (long)indexPath.row);
    
    KZMMuzeumController *muzeumVC = [self.storyboard instantiateViewControllerWithIdentifier:@"KZMMuzeumController"];
    
    [self.navigationController pushViewController:muzeumVC animated:YES];
}



@end
