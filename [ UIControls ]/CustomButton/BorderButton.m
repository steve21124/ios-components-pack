//
//  BorderButton.m
//  CustomButton
//
//  Created by Artur on 08/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "BorderButton.h"
#import "UIColor+CustomColors.h"


@implementation BorderButton

- (id)initWithCoder:(NSCoder *)coder
{
    // Call the parent implementation of initWithCoder
    self = [super initWithCoder:coder];
    
    // Custom drawing methods
    if (self) {
        [self drawButton];
        [self setTitleColor:[UIColor buttonColor] forState:UIControlStateNormal];
    }
    
    return self;
}

- (void)drawButton
{
    CALayer *layer = self.layer;
    layer.cornerRadius = 1.5;
    layer.borderWidth = 1;
    layer.borderColor = [UIColor buttonColor].CGColor;
    //layer.backgroundColor = [UIColor buttonColor].CGColor;
}

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted == YES) {
        self.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    else {
        self.layer.borderColor = [UIColor buttonColor].CGColor;
    }
}

- (void)setSelected:(BOOL)selected
{
    if (selected == YES) {
        self.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    else {
        self.layer.borderColor = [UIColor buttonColor].CGColor;
    }
}


@end
