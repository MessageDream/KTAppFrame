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
    
    if(keyboardShown)
    {
        if(!CGSizeEqualToSize(keyboardSize, saveKeyboardSize))
        {
            CGRect viewFrame = [self.activeKeyboardControlOfScrollView frame];
            
            viewFrame.size.height = originScrollHeigh;
            self.activeKeyboardControlOfScrollView.frame = viewFrame;
        }
    }
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].keyWindow.frame.origin.y - self.frame.origin.y;
    
    
    activeKeyboardControlOfScrollViewToBottomHeight = height - self.activeKeyboardControlOfScrollView.bounds.size.height - self.activeKeyboardControlOfScrollView.frame.origin.y;
    
    CGRect viewFrame = [self.activeKeyboardControlOfScrollView frame];
    viewFrame.size.height =  viewFrame.size.height - keyboardSize.height + activeKeyboardControlOfScrollViewToBottomHeight;
//    self.activeKeyboardControlOfScrollView.frame = viewFrame;
    
  
    
    [UIView animateWithDuration:0.2 animations:^{
        [self.activeKeyboardControlOfScrollView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(viewFrame.size);
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
//    NSDictionary* info = [aNotification userInfo];
//    
//    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGSize keyboardSize = [aValue CGRectValue].size;
    
   [UIView animateWithDuration:0.2 animations:^{
       CGRect viewFrame = [self.activeKeyboardControlOfScrollView frame];
       viewFrame.size.height = originScrollHeigh;
       self.activeKeyboardControlOfScrollView.frame = viewFrame;
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
}
@end
