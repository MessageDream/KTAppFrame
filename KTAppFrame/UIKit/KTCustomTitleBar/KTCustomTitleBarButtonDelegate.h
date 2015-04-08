//
//  KTCustomTitleBarButtonDelegate.h
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KTCustomTitleBar_ButtonDelegate <NSObject>
@optional
-(IBAction)leftButton_onClick:(id)sender;
-(IBAction)rightButton_onClick:(id)sender;
@end
