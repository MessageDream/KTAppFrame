//
//  CustomTitleView.h
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTCustomTitleBarButtonDelegate.h"

//@protocol KTCustomTitleBar_ButtonDelegate <NSObject>
//@optional
//-(IBAction)leftButton_onClick:(id)sender;
//-(IBAction)rightButton_onClick:(id)sender;
//@end


enum KTKTCustomTitleBar_Style
{
    KTKTCustomTitleBar_Style_None,
    KTKTCustomTitleBar_Style_DecorateLine,
};

@interface KTCustomTitleBar : UIView
{
@protected
    UIButton *_leftButton;
    UIButton *_rightButton;
    enum KTKTCustomTitleBar_Style _style;
    NSString *_titleText;
    UIImage *_leftButtonImage;
    UIImage *_rightButtonImage;
    UIColor *_textColor;
    int _titleFontSize;
    
}
@property(nonatomic,strong)NSString *titleText;
@property(nonatomic)int titleFontSize;
@property(nonatomic,strong)UIImage *leftButtonImage;
@property(nonatomic,strong)UIImage *rightButtonImage;
@property(nonatomic,strong)UIImage *backgroundImage;
@property(nonatomic,weak)id<KTCustomTitleBar_ButtonDelegate> buttonEventObserver;
@property(nonatomic)NSTextAlignment titleTextAlignment;
@property(nonatomic,readonly)UIButton *leftButton;
@property(nonatomic,readonly)UIButton *rightButton;
@property(nonatomic)enum KTKTCustomTitleBar_Style style;
@property(nonatomic,strong)UIColor *textColor;

-(id)initWithBackgroundImage:(UIImage*)image;
-(void)displayBackgroundImage:(BOOL)isDisplay;
-(void)displayCustomTitleView:(BOOL)flag;
@end
