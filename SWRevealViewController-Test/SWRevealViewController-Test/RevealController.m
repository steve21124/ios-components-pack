//
//  RevealController.m
//  SWRevealViewController-Test
//
//  Created by Artur on 02/04/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "RevealController.h"

@interface RevealController ()

@end

@implementation RevealController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureSlideOutMenu];
}

- (void)configureSlideOutMenu
{
    // INITIAL APPEARANCE: Configure the initial position of the menu and content views
    self.frontViewPosition = FrontViewPositionRight; // FrontViewPositionLeft (only content), FrontViewPositionRight(menu and content), FrontViewPositionRightMost(only menu), see others at library documentation...
    self.rearViewRevealWidth = 320.0f; // how much of the menu is shown (default 260.0)
    
    // TOGGLING OVERDRAW: Configure the overdraw appearance of the content view while dragging it
    self.rearViewRevealOverdraw = 0.0f; // how much of an overdraw can occur when dragging further than 'rearViewRevealWidth' (default 60.0)
    self.bounceBackOnOverdraw = NO; // If YES the controller will bounce to the Left position when dragging further than 'rearViewRevealWidth' (default YES)
    
    // TOGGLING MENU DISPLACEMENT: how much displacement is applied to the menu when animating or dragging the content
    self.rearViewRevealDisplacement = 160.0f; // (default 40.0)
    
    // TOGGLING ANIMATION: Configure the animation while the menu gets hidden
    self.toggleAnimationType = SWRevealToggleAnimationTypeSpring; // Animation type (SWRevealToggleAnimationTypeEaseOut or SWRevealToggleAnimationTypeSpring)
    self.toggleAnimationDuration = 0.5f; // Duration for the revealToggle animation (default 0.25)
    self.springDampingRatio = 1.0f; // damping ratio if SWRevealToggleAnimationTypeSpring (default 1.0)
    
    // SHADOW: Configure the shadow that appears between the menu and content views
    self.frontViewShadowRadius = 10.0f; // radius of the front view's shadow (default 2.5)
    self.frontViewShadowOffset = CGSizeMake(0.0f, 2.5f); // radius of the front view's shadow offset (default {0.0f,2.5f})
    self.frontViewShadowOpacity = 0.5f; // front view's shadow opacity (default 1.0)
    self.frontViewShadowColor = [UIColor lightGrayColor]; // front view's shadow color (default blackColor)
}


@end
