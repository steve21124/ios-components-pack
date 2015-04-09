//
//  RecipeDetailController.h
//  PrepareForSegue-Tests
//
//  Created by Artur on 09/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeName;

@end
