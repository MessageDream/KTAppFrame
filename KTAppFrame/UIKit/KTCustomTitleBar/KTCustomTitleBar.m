//
//  CustomTitleView.m
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import "KTCustomTitleBar.h"
#import "Masonry.h"

@interface KTCustomTitleBar()
{
    UILabel *lbl_title;
    UIImageView *backgroundImageView;
    UIImageView *_decorateLine ;
    UIImageView *_decorateLine2 ;
}
@property(nonatomic,strong)UILabel *lbl_title;
-(void)createControl;
-(IBAction)leftButton_onClick:(id)sender;
-(IBAction)rightButton_onClick:(id)sender;
@end


@implementation KTCustomTitleBar
@synthesize titleText = _titleText;
@synthesize leftButtonImage = _leftButtonImage;
@synthesize rightButtonImage = _rightButtonImage;
@synthesize backgroundImage = _backgroundImage;
@synthesize lbl_title;
@synthesize titleFontSize = _titleFontSize;
@synthesize titleTextAlignment;
@synthesize leftButton = _leftButton;
@synthesize rightButton = _rightButton;
@synthesize style = _style;
@synthesize textColor = _textColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _style = KTKTCustomTitleBar_Style_None;
        titleTextAlignment = NSTextAlignmentCenter;
        _titleFontSize = 20;
        
    }
    return self;
}
-(id)initWithBackgroundImage:(UIImage*)image
{
    CGRect frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.width = image.size.width;
    frame.size.height = image.size.height;
    self = [self initWithFrame:frame];
    self.backgroundImage = image;
    return self;
}
-(void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImage = backgroundImage;
    backgroundImageView.image = _backgroundImage;
}
-(void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    self.lbl_title.textColor = textColor;
}
-(void)displayBackgroundImage:(BOOL)isDisplay
{
    if(isDisplay)
        backgroundImageView.hidden = NO;
    else
        backgroundImageView.hidden = YES;
}
-(void)displayCustomTitleView:(BOOL)flag
{
    if (flag)
    {
       
        
    }
    else
    {
        self.leftButton.hidden = YES;
        _decorateLine.hidden = YES;
        _decorateLine2.hidden = YES;
        self.rightButton.hidden = YES;
        self.userInteractionEnabled = NO;
    }
}
-(void)setTitleText:(NSString *)titleText
{
    _titleText = titleText;
    self.lbl_title.text = _titleText;
}
-(void)setLeftButtonImage:(UIImage *)leftButtonImage
{
    _leftButtonImage = leftButtonImage;
    if(_leftButton == nil)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setBackgroundImage:self.leftButtonImage forState:UIControlStateNormal];
       
        [_leftButton addTarget:self action:@selector(leftButton_onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftButton];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_leftButtonImage.size);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.equalTo(self).mas_offset(10);
            //            make.top.equalTo(_customTitleBar).mas_offset(padding/2);
            //            make.bottom.equalTo(_customTitleBar).mas_offset(-padding/2);
        }];
    }
    else
    {
        [_leftButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_leftButtonImage.size);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.left.equalTo(self).mas_offset(10);
            //            make.top.equalTo(_customTitleBar).mas_offset(padding/2);
            //            make.bottom.equalTo(_customTitleBar).mas_offset(-padding/2);
        }];
        [_leftButton setBackgroundImage:_leftButtonImage forState:UIControlStateNormal];
    }
}
-(void)setRightButtonImage:(UIImage *)rightButtonImage
{
    _rightButtonImage = rightButtonImage;
    
    if(_rightButton == nil)
    {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setBackgroundImage:self.rightButtonImage forState:UIControlStateNormal];
        
        [_rightButton addTarget:self action:@selector(rightButton_onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightButton];
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_rightButtonImage.size);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.equalTo(self).mas_offset(-10);
            //            make.top.equalTo(_customTitleBar).mas_offset(padding/2);
            //            make.bottom.equalTo(_customTitleBar).mas_offset(-padding/2);
        }];
    }
    else
    {
        [_rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(_rightButtonImage.size);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.equalTo(self).mas_offset(-10);
            //            make.top.equalTo(_customTitleBar).mas_offset(padding/2);
            //            make.bottom.equalTo(_customTitleBar).mas_offset(-padding/2);
        }];
        [_rightButton setBackgroundImage:_rightButtonImage forState:UIControlStateNormal];
    }
}
-(void)setTitleFontSize:(int)titleFontSize
{
    _titleFontSize = titleFontSize;
    [self.lbl_title setFont:[UIFont fontWithName:@"Helvetica-Bold" size:_titleFontSize]];
}
-(void)setFrame:(CGRect)frame
{
    super.frame = frame;
    frame.origin.x=0;
    frame.origin.y=0;
    backgroundImageView.frame=frame;
}
-(void)setStyle:(enum KTKTCustomTitleBar_Style)style
{
    _style = style;
    if(self.style == KTKTCustomTitleBar_Style_DecorateLine)
    {
        CGRect frame;
        if(self.leftButtonImage != nil)
        {
            _decorateLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:NSLocalizedStringFromTable(@"title_bar_line",@"",@"")]];
            frame = _decorateLine.frame;
            frame.origin.x = _leftButton.frame.origin.x+_leftButton.frame.size.width+10;
            frame.size.height = self.bounds.size.height;
            _decorateLine.frame = frame;
            [self addSubview:_decorateLine];
        }
        if(self.rightButtonImage != nil)
        {
            _decorateLine2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:NSLocalizedStringFromTable(@"title_bar_line",@"",@"")]];
            frame = _decorateLine2.frame;
            frame.origin.x =_rightButton.frame.origin.x-10;
            frame.size.height = self.bounds.size.height;
            _decorateLine2.frame = frame;
            [self addSubview:_decorateLine2];
        }
        
    }
}
-(void)createControl
{
    CGRect frame;
    if(self.backgroundImage != nil)
    {
        backgroundImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
        backgroundImageView.contentMode = UIViewContentModeScaleToFill;
        frame = backgroundImageView.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        backgroundImageView.frame = frame;
        [self addSubview:backgroundImageView];
    }
    
    self.lbl_title = [[UILabel alloc] initWithFrame:CGRectMake(10,0, self.bounds.size.width-20, self.bounds.size.height)];
    self.lbl_title.backgroundColor = [UIColor clearColor];
    self.lbl_title.text = _titleText;
    self.lbl_title.shadowOffset = CGSizeMake(0, -1);
    self.lbl_title.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.lbl_title.textAlignment = titleTextAlignment;
    self.lbl_title.textColor = [UIColor whiteColor];
    [self.lbl_title setFont:[UIFont fontWithName:@"Helvetica-Bold" size:_titleFontSize]];
    [self addSubview:self.lbl_title];
    
}
-(IBAction)leftButton_onClick:(id)sender
{
    if(self.buttonEventObserver!=nil)
        [self.buttonEventObserver leftButton_onClick:sender];
}
-(IBAction)rightButton_onClick:(id)sender
{
    if(self.buttonEventObserver!=nil)
        [self.buttonEventObserver rightButton_onClick:sender];
}
-(void)didMoveToSuperview
{
    [self createControl];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSUInteger numTaps = [[touches anyObject] tapCount];
    if(numTaps == 1)
    {
        for (UITouch *touch in touches)
        {
            CGPoint point = [touch locationInView:self];
            
            CGRect btn_leftButtonFrame,btn_rightButtonFrame;
            
            if(_leftButton!=nil)
            {
                btn_leftButtonFrame = _leftButton.frame;
                btn_leftButtonFrame.origin.x-=10;
                btn_leftButtonFrame.origin.y = 0;
                btn_leftButtonFrame.size.width+=20;
                btn_leftButtonFrame.size.height+=20;
            }
            if(_rightButton!=nil)
            {
                btn_rightButtonFrame = _rightButton.frame;
                btn_rightButtonFrame.origin.x-=10;
                btn_rightButtonFrame.origin.y = 0;
                btn_rightButtonFrame.size.width+=20;
                btn_rightButtonFrame.size.height+=20;
            }
            
            
            if(CGRectContainsPoint(btn_leftButtonFrame, point))
            {
                [self leftButton_onClick:nil];
                return;
            }
            else if(CGRectContainsPoint(btn_rightButtonFrame, point))
            {
                [self rightButton_onClick:nil];
                return;
            }
        }
    }
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
