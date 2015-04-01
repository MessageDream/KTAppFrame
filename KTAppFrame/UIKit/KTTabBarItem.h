//
//  KTTabBarItem.h
//  kt239_sdk
//
//  Created by qiushuitian on 26/4/14.
//  Copyright (c) 2014 ktplay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KTTabBarItem : NSObject

@property(nonatomic,strong) UIImage * frontImage;
@property(nonatomic,strong) UIImage * lostFocusImage;
@property(nonatomic,strong) UIColor * lostFocusTextColor;


@property(nonatomic,strong) UIImage * selectedImage;
@property(nonatomic,strong) UIImage * normalImage;


@property(nonatomic,strong) UIImage * selectedBGImage;
@property(nonatomic,strong) UIImage * normalBGImage;
@property(nonatomic)   UIEdgeInsets titleEdgeInsets;
@property(nonatomic,copy) NSString * badgeValue;
@property(nonatomic,copy) NSString * text;
@property(nonatomic,strong) UIFont *  textFont;
@property(nonatomic,strong) UIColor * textColor;
@property(nonatomic)    NSInteger tag;


@end
