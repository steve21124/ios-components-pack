//
//  KZMMuzeumCell.m
//  DynamicTableViewCellHeight
//
//  Created by Artur on 01/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "KZMMuzeumCell.h"

@implementation KZMMuzeumCell

- (void)awakeFromNib {
    // Initialization code
    
    self.muzeumImageView.layer.cornerRadius = self.muzeumImageView.frame.size.width / 2;
    self.muzeumImageView.clipsToBounds = YES;
    self.muzeumImageView.layer.borderWidth = 1.0f;
    self.muzeumImageView.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
