//
//  RecipeDetailController.m
//  PrepareForSegue-Tests
//
//  Created by Artur on 09/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "RecipeDetailController.h"

@interface RecipeDetailController ()

@end

@implementation RecipeDetailController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.recipeLabel.text = _recipeName;
}


@end
