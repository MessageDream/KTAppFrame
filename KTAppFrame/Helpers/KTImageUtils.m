//
//  KTImageUtils.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/1.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTImageUtils.h"
#import <CoreGraphics/CoreGraphics.h>


@implementation KTImageUtils
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
