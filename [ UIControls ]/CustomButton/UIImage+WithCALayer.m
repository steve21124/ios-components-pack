//
//  UIImage+WithCALayer.m
//  CustomButton
//
//  Created by Artur on 08/03/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "UIImage+WithCALayer.h"

@implementation UIImage (WithCALayer)

+ (UIImage *)imageFromCALayer:(CALayer *)layer
{
    UIGraphicsBeginImageContext([layer frame].size);
    
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return outputImage;
}

@end
