//
//  KTAppFrame.h
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface KTAppFrame : NSObject
+(KTAppFrame *) instance;
-(void)showInController:(UIViewController *)contrroller;
@end
