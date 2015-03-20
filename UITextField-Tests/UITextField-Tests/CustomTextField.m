//
//  CustomTextField.m
//  UITextField-Tests
//
//  Created by Artur on 18/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "CustomTextField.h"

@interface CustomTextField () <UITextFieldDelegate>

@property (nonatomic, assign) float verticalPadding;
@property (nonatomic, assign) float horizontalPadding;

@property (nonatomic, strong) UIButton *keyboardDownButton;

@end

@implementation CustomTextField

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.delegate = self;
        
        [self setBackgroundColor:[UIColor colorWithRed:243/255.0 green:231/255.0 blue:233/255.0 alpha:1.0]];
        
        [self drawTextField];
        [self setupKeyboardDownButton];
    }
    return self;
}

#pragma mark - Setups

- (void)drawTextField
{
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth =  1.0f;
    self.layer.cornerRadius = 2.0f;
    
    self.verticalPadding = 10;
    self.horizontalPadding = 20;
}

- (void)setupKeyboardDownButton
{
    _keyboardDownButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_keyboardDownButton setBackgroundImage:[UIImage imageNamed:@"keyboard-down"] forState:UIControlStateNormal];
    _keyboardDownButton.alpha = 0.6;
    [_keyboardDownButton addTarget:self action:@selector(keyboardDownButtonPressed:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:_keyboardDownButton];
    
    CGRect frame = self.bounds;
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    
    _keyboardDownButton.frame = CGRectMake(width*0.875, height*0.15, 27, 31);
    _keyboardDownButton.hidden = YES;
}

#pragma mark - UITextFieldDelegate

- (void)keyboardDownButtonPressed:(id)sender
{
    [self resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _keyboardDownButton.hidden = NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _keyboardDownButton.hidden = YES;
}

//drawing and positioning overrides

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + _horizontalPadding, bounds.origin.y + _verticalPadding, bounds.size.width - _horizontalPadding*2, bounds.size.height - _verticalPadding*2);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

@end
