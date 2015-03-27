//
//  VideoCell.h
//  YoutubeAPITest
//
//  Created by Artur on 27/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UIButton *iconImageButton;
@end
