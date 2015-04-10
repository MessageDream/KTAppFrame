//
//  KTTitleBarView.m
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import "KTTitleBarView.h"

@implementation KTTitleBarView
@synthesize customTitleBar = _customTitleBar;


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initTitleBar];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initTitleBar];
    }
    return self;
}

-(void) initTitleBar{
    _customTitleBar = [[KTCustomTitleBar alloc] init];
    _customTitleBar.titleFontSize = 18;
    _customTitleBar.style = KTKTCustomTitleBar_Style_None;
    _customTitleBar.backgroundColor = [UIColor whiteColor];
    [self addSubview:_customTitleBar];
    _customTitleBar.textColor = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1];
    
    [_customTitleBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(40);
    }];
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor grayColor];
    [_customTitleBar addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_customTitleBar);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(_customTitleBar.mas_width);
        make.centerX.mas_equalTo(_customTitleBar.mas_centerX);
    }];
}

-(void)setDelegate_soon:(id<KTCustomTitleBar_ButtonDelegate>)delegate_soon
{
    [_customTitleBar.leftButton addTarget:delegate_soon action:@selector(leftButton_onClick:) forControlEvents:UIControlEventTouchUpInside];
    [_customTitleBar.rightButton addTarget:delegate_soon action:@selector(rightButton_onClick:) forControlEvents:UIControlEventTouchUpInside];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
@end
