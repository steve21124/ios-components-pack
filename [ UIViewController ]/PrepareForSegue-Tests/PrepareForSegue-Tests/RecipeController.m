//
//  RecipeController.m
//  PrepareForSegue-Tests
//
//  Created by Artur on 09/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "RecipeController.h"
#import "RecipeDetailController.h"
#import "RecipeCell.h"

@interface RecipeController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *recipes;

@end

@implementation RecipeController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //Name Cell
//    UINib *cellNib = [UINib nibWithNibName:@"RecipeCell" bundle:nil];
//    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"RecipeCell"];
    
    self.recipes = @[@"Egg Benedict",
                     @"Mushroom Risotto",
                     @"Full Breakfast",
                     @"Hamburger",
                     @"Ham and Egg Sandwich",
                     @"Creme Brelee",
                     @"White Chocolate Donut",
                     @"Starbucks Coffee",
                     @"Vegetable Curry",
                     @"Instant Noodle with Egg",
                     @"Noodle with BBQ Pork",
                     @"Japanese Noodle with Pork",
                     @"Green Tea",
                     @"Thai Shrimp Cake",
                     @"Angry Birds Cake",
                     @"Ham and Cheese Panini"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    RecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    cell.recipeLabel.text = [_recipes objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        RecipeDetailController *detailController = segue.destinationViewController;
        
        detailController.recipeName = [_recipes objectAtIndex:indexPath.row];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
