//
//  KTBaseUIView.m
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import "KTBaseView.h"

@interface KTBaseView ()
{
    BOOL keyboardShown;
    double activeKeyboardControlOfScrollViewToBottomHeight;
    CGSize saveKeyboardSize;
    CGSize savekeepOutViewSize;
    UIView *keepOutView;
    CGFloat originScrollHeigh;
}
- (void)keyboardWillShown:(NSNotification*)aNotification;
- (void)keyboardWillHidden:(NSNotification*)aNotification;
@end

@implementation KTBaseView
//@synthesize noCanCoverControlOfScrollViewToBottomHeight;

-(instancetype)init{
    if (self = [super init]) {
        [self initFirst];
    }
    return self;
}

-(void)initFirst{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShown:)
                                                 name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    keyboardShown = NO;
    activeKeyboardControlOfScrollViewToBottomHeight = 0;
}

- (void)keyboardWillShown:(NSNotification*)aNotification
{
    if(self.activeKeyboardControl==nil || self.activeKeyboardControlOfScrollView == nil)
        return;
    
    originScrollHeigh = self.activeKeyboardControlOfScrollView.bounds.size.height;
    NSDictionary* info = [aNotification userInfo];
    
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].keyWindow.frame.origin.y - self.frame.origin.y;
    
    
    activeKeyboardControlOfScrollViewToBottomHeight = height - self.activeKeyboardControlOfScrollView.bounds.size.height - self.activeKeyboardControlOfScrollView.frame.origin.y;
    
    CGFloat newHeight =  originScrollHeigh - keyboardSize.height + activeKeyboardControlOfScrollViewToBottomHeight;
    
    [UIView animateWithDuration:0.2 animations:^{
        [self.activeKeyboardControlOfScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(newHeight);
        }];
        CGRect activeKeyboardControlRect = [self.activeKeyboardControl frame];
        //    [self.activeKeyboardControlOfScrollView scrollRectToVisible:activeKeyboardControlRect animated:YES];
        self.activeKeyboardControlOfScrollView.contentOffset = CGPointMake(0, activeKeyboardControlRect.origin.y);
    }];
  
    
    saveKeyboardSize = keyboardSize;
    keyboardShown = YES;
}


- (void)keyboardWillHidden:(NSNotification*)aNotification
{
    if(self.activeKeyboardControlOfScrollView == nil || self.activeKeyboardControl == nil)
        return;
    
   [UIView animateWithDuration:0.2 animations:^{
       [self.activeKeyboardControlOfScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
           make.height.mas_equalTo(originScrollHeigh);
       }];
   } completion:^(BOOL finished) {
       keyboardShown = NO;
       saveKeyboardSize = CGSizeZero;
   }];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:NO];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}
@end
