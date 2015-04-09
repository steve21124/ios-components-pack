//
//  KZMMainTitleCell.m
//  DynamicTableViewCellHeight
//
//  Created by Artur on 01/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "KZMMainTitleCell.h"

@implementation KZMMainTitleCell

- (void)awakeFromNib {
    // Initialization code
    
    self.museumImageView.layer.cornerRadius = self.museumImageView.frame.size.width / 2;
    self.museumImageView.clipsToBounds = YES;
    self.museumImageView.layer.borderWidth = 1.0f;
    self.museumImageView.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
