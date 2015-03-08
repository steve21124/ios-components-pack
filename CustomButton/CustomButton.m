//
//  CustomButton.m
//  CustomButton
//
//  Created by Artur on 08/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "CustomButton.h"
#import "UIColor+CustomColors.h"

@interface CustomButton ()

@property (strong, nonatomic) CAGradientLayer *backgroundLayer;
@property (strong, nonatomic) CAGradientLayer *highlightBackgroundLayer;

@property (strong, nonatomic) CALayer *innerGlow;

@end

@implementation CustomButton

//+ (CustomButton *)buttonWithType:(UIButtonType)type
//{
//    UIButton *theButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [theButton setTitle:@"Друзи" forState:UIControlStateNormal];
//    [theButton setTitle:@"Мои" forState:UIControlStateHighlighted];
//    return theButton;
//}

- (id)initWithCoder:(NSCoder *)coder
{
    // Call the parent implementation of initWithCoder
    self = [super initWithCoder:coder];
    // Custom drawing methods
    if (self) {
        [self drawButton];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)drawButton
{
    CALayer *layer = self.layer;
    layer.cornerRadius = 1.5;
    layer.borderWidth = 1;
    layer.borderColor = [UIColor buttonColor].CGColor;
    layer.backgroundColor = [UIColor buttonColor].CGColor;
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

//- (void)drawInnerGlow
//{
//    if (!_innerGlow)
//    {
//        _innerGlow = [CALayer layer];
//        
//        _innerGlow.cornerRadius = 1;
//        _innerGlow.borderWidth = 1;
//        _innerGlow.borderColor = [UIColor whiteColor].CGColor;
//        _innerGlow.opacity = 0.5;
//        
//        [self.layer insertSublayer:_innerGlow atIndex:2];
//    }
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
// 
//}

@end
