//
//  QuestionsController.h
//  UIViewController-IOS
//
//  Created by Artur on 27/10/14.
//  Copyright (c) 2014 superarthur.io. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
