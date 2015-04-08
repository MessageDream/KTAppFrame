//
//  KTTabBar.m
//  kt239_sdk
//
//  Created by qiushuitian on 26/4/14.
//  Copyright (c) 2014 ktplay. All rights reserved.
//

#import "KTTabBar.h"
#import "KTTabBarItem.h"
#import "Masonry.h"


#define VIEW_TAG_KTTABBAR_ITEM                          0x0100100
#define VIEW_TAG_KTTABBAR_ITEM_RED_TIP                  0x0100200
#define VIEW_TAG_KTTABBAR_ITEM_FRONT_IMG_VIEW           0x0100300
#define VIEW_TAG_KTTABBAR_ITEM_SPLIT                    0x0100400



@interface KTTabBar ()
@property(nonatomic) BOOL isLandscape; //0: 横版(默认)  1: 竖版
@end

@implementation KTTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)initWithFrame:(CGRect)frame isLandscape:(BOOL)isLandscape items:(NSArray *)items tipImage:(UIImage *)tipImage style:(KTTabBarStyle)style{
    self = [super initWithFrame:frame];
    if (self) {
        _style = style;
        self.isLandscape = isLandscape;

        self.tipImage = tipImage;
        self.items = items;
        
        [self initUI];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame  items:(NSArray *)items spaceLineColor:(UIColor *)spaceLineColor tipImage:(UIImage *)tipImage style:(KTTabBarStyle)style{
    self = [super initWithFrame:frame];
    if (self) {
        _style = style;
        self.isLandscape = YES;
        self.spaceLineColor = spaceLineColor;
        self.tipImage = tipImage;
        self.items = items;
        
        [self initUI];
    }
    return self;
}

-(id)initWithLandscape:(BOOL)isLandscape items:(NSArray *)items tipImage:(UIImage *)tipImage style:(KTTabBarStyle)style{
    if (self = [super init]) {
        _style = style;
        self.isLandscape = isLandscape;
        
        self.tipImage = tipImage;
        self.items = items;
    }
    return self;
}

-(id)initWithItems:(NSArray *)items spaceLineColor:(UIColor *)spaceLineColor tipImage:(UIImage *)tipImage style:(KTTabBarStyle)style{
    if (self = [super init]) {
        _style = style;
        self.isLandscape = YES;
        self.spaceLineColor = spaceLineColor;
        self.tipImage = tipImage;
        self.items = items;
    }
    return self;
}


-(void)setSelectedIndex:(NSInteger)selectedIndex{
    if (selectedIndex >= 0 && selectedIndex < [self.items count]) {
        _selectedIndex = selectedIndex;
        [self refreshSelectStatus:selectedIndex];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(ktTabBar:didSelectIndex:flag:)]) {
            [self.delegate ktTabBar:self didSelectIndex:selectedIndex flag:2];
        }
    }
    
}
-(void)setTabBarPosition:(KTTabBarPosition)tabBarPosition{
    _tabBarPosition = tabBarPosition;
    if (_tabBarPosition == KTTabBarPositionLeft) {
        self.isLandscape = NO;
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.superview);
            make.size.mas_equalTo(CGSizeMake(self.barWidth,self.superview.bounds.size.height));
            make.centerY.mas_equalTo(self.superview.mas_centerY);
        }];
    }else{
        self.isLandscape = YES;
        if (_tabBarPosition == KTTabBarPositionBottom) {
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(self.superview.bounds.size.width,  self.barWidth));
                make.bottom.equalTo(self.superview);
                make.centerX.mas_equalTo(self.superview.mas_centerX);
            }];
        }else{
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(self.superview.bounds.size.width,  self.barWidth));
                make.top.equalTo(self.superview);
                make.centerX.mas_equalTo(self.superview.mas_centerX);
            }];
        }
    }
}

//-(void)setItemWidth:(CGFloat)itemWidth{
//    _itemWidth = itemWidth;
//    [self refreshUI];
//}
//
//-(void)setItemHeight:(CGFloat)itemHeight{
//    _itemHeight = itemHeight;
//    [self refreshUI];
//}
//
//-(void)setItemSpacing:(CGFloat)itemSpacing{
//    _itemSpacing = itemSpacing;
//    [self refreshUI];
//}
//
//-(void)setHeadSpacing:(CGFloat)headSpacing{
//    _headSpacing = headSpacing;
//    [self refreshUI];
//}
//
//-(void)setOrientation:(NSInteger)orientation{
//    _orientation = orientation;
//    [self refreshUI];
//}
//
-(void)setBackgroundImage:(UIImage *)backgroundImage{
    self.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];

}


-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void*)context{
    NSInteger tag = [[object valueForKey:@"tag"] intValue];
    if ([@"context_frontImage" isEqualToString:(__bridge NSString *)context]){
        
        for (NSUInteger i = 0; i < self.items.count; i++) {
            UITabBarItem * item = [self.items objectAtIndex:i];
            if (item.tag == tag) {
                UIButton * btn = (UIButton *)[self viewWithTag:VIEW_TAG_KTTABBAR_ITEM + i];
                if (btn) {
                    UIImageView * frontImageView = (UIImageView *)[btn viewWithTag:VIEW_TAG_KTTABBAR_ITEM_FRONT_IMG_VIEW];
                    UIImage * fromtImage = [object valueForKey:@"frontImage"];
                    frontImageView.image = fromtImage;
                    if (fromtImage == nil) {
                        frontImageView.hidden = YES;
                    }else{
                        frontImageView.hidden = NO;
                    }
                }
                break;
            }

        }
        
        
    }else if([@"context_badgeValue" isEqualToString:(__bridge NSString *)context]){

        for (NSUInteger i = 0; i < self.items.count; i++) {
            UITabBarItem * item = [self.items objectAtIndex:i];
            if (item.tag == tag) {
                UIButton * btn = (UIButton *)[self viewWithTag:VIEW_TAG_KTTABBAR_ITEM + i];
                if (btn) {
                    UIImageView * redTipView = (UIImageView *)[btn viewWithTag:VIEW_TAG_KTTABBAR_ITEM_RED_TIP];
                    if (redTipView) {
                        NSString * badgeValue = [object valueForKey:@"badgeValue"];
                        if (badgeValue == nil || [badgeValue isEqualToString:@"0"]) {
                            redTipView.hidden = YES;
                        }else{
                            redTipView.hidden = NO;
                        }
                    }
                }
                break;
            }

        }
    }


}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self initUI];
}

-(void)initUI{
    for (UIView *item in self.subviews) {
        [item removeFromSuperview];
    }
    //把所有UI元素加入进来
    //KTImagePool *imgPool = [KTImagePool shareImagePool];
    
    self.backgroundColor = [UIColor colorWithPatternImage:self.backgroundImage];
    self.userInteractionEnabled = YES;
    NSUInteger itemsCount = [self.items count];
//    int space_dis = self.isLandscape?(self.bounds.size.width/itemsCount):(self.bounds.size.height/itemsCount);
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = self.isLandscape?(self.bounds.size.width/itemsCount):self.bounds.size.width;
    CGFloat h = self.isLandscape?self.bounds.size.height:(self.bounds.size.height/itemsCount);
    if (self.isLandscape){
        //FIX iphone 6 plus  按钮边线有问题
        y = -0.5;
        h = h+0.5;
    }else{
       
    }
    for (int i = 0; i < itemsCount; i++){

        
        KTTabBarItem * item = [self.items objectAtIndex:i];
        
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame =  CGRectMake(x, y, w, h);
        btn.accessibilityLabel = [item accessibilityLabel];
        [btn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
     
//        [btn setBackgroundImage:item.normalBGImage forState:UIControlStateNormal];
      // [btn setBackgroundColor:[UIColor blueColor]];
       
        [btn setBackgroundImage:item.selectedBGImage forState:UIControlStateSelected];

        [btn setImage:item.selectedImage forState:UIControlStateSelected];

        [btn setImage:item.normalImage forState:UIControlStateNormal];
        
      
        
        
        if (item.text) {
            [btn setTitle:item.text forState:UIControlStateNormal];
        }
        
        if (item.textColor)
        {
            [btn setTitleColor:item.textColor forState:UIControlStateNormal];
        }
        
        if (item.textFont) {
            btn.titleLabel.font = item.textFont;
        }
        
        
        
        [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"context_badgeValue"];
        [item addObserver:self forKeyPath:@"frontImage" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"context_frontImage"];
        
        UIImageView * frontImageView = [[UIImageView alloc] initWithImage:item.frontImage];
        CGFloat minL = (w < h ? w :h) * 0.66f;
        frontImageView.frame = CGRectMake(0, 0, minL, minL);
        frontImageView.center = CGPointMake(w/2,h/2);
        frontImageView.clipsToBounds = YES;
        frontImageView.layer.cornerRadius = frontImageView.bounds.size.width / 2;
        frontImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        frontImageView.layer.borderWidth = 2;
        frontImageView.tag = VIEW_TAG_KTTABBAR_ITEM_FRONT_IMG_VIEW;
        if (item.frontImage == nil) {
            frontImageView.hidden = YES;
        }else{
            frontImageView.hidden = NO;
        }
        [btn addSubview:frontImageView];
        
        UIImageView * redTipView = [[UIImageView alloc] initWithImage:self.tipImage];
        redTipView.frame = CGRectMake(0, 0, self.tipImage.size.width, self.tipImage.size.height);
        if (self.isLandscape&&i==itemsCount-1) //fix 水平切换最后一个标签，红点压边
        {
            redTipView.center = CGPointMake(w-self.tipImage.size.width/2-2 , 0+self.tipImage.size.height/2 );

        }else{
            redTipView.center = CGPointMake(w-self.tipImage.size.width/2 , 0+self.tipImage.size.height/2 );

        }

        if (item.badgeValue == nil || [item.badgeValue isEqualToString:@"0"]) {
            redTipView.hidden = YES;
        }else{
            redTipView.hidden = NO;
        }
        redTipView.tag = VIEW_TAG_KTTABBAR_ITEM_RED_TIP;
        [btn addSubview:redTipView];
        btn.tag = VIEW_TAG_KTTABBAR_ITEM + i;
        [self addSubview:btn];
        

        
        if (self.spaceLineColor&&(i >= 0 && i < itemsCount - 1)) {
            UIView * splitLabel = [[UIView alloc] initWithFrame:CGRectMake(btn.bounds.size.width-1, 0, 1, btn.bounds.size.height)];
            splitLabel.backgroundColor = self.spaceLineColor;
            splitLabel.tag = VIEW_TAG_KTTABBAR_ITEM_SPLIT + i;
            [self addSubview:splitLabel];
        }
        
        if (self.isLandscape) {
            x += w;
            y = -0.5;
        }else{
            x = 0;
            y += h;
        }
    }

}


//刷新UI 排版,只修改内部view的fram的大小和位置
//-(void)refreshUI{
//    self.backgroundColor = [UIColor colorWithPatternImage:self.backgroundImage];
//    self.userInteractionEnabled = YES;
//    
//    CGFloat tipSpace = 0;
//    
//    if (self.orientation == 0) { //ktplay横版 tabbar竖着的
//        CGFloat x = (self.frame.size.width - self.itemWidth) / 2;
//        if (x < 0) {x = 0;}
//        
//        for (int i = 0; i < [self.items count]; i++) {
//            UIButton * btn = (UIButton *)[self viewWithTag:VIEW_TAG_KTTABBAR_ITEM + i];
//            if (btn) {
//                // 刷新按钮大小和位置
//                btn.frame = CGRectMake(x,
//                                       self.headSpacing + i * (self.itemHeight + self.itemSpacing),
//                                       self.itemWidth,
//                                       self.itemHeight);
//                // 刷新titleLabel大小
//                btn.titleLabel.frame = CGRectMake(0, 0, btn.frame.size.width, btn.frame.size.height);
//
//                if (self.style == KTTabBarStyleText) {
//               //     tipSpace = btn.frame.size.width / 5.0f;
//                    tipSpace = 0;
//                }
//                UIImageView * redTipView = (UIImageView *)[btn viewWithTag:VIEW_TAG_KTTABBAR_ITEM_RED_TIP];
//                if (redTipView) {
//                    // 刷新redTipView大小
//                    redTipView.image = self.tipImage;
//                    redTipView.frame = CGRectMake(btn.frame.size.width - self.tipImage.size.width - tipSpace,
//                                                  0,
//                                                  self.tipImage.size.width,
//                                                  self.tipImage.size.height);
//                }
//                
//
//                UIImageView * frontImageView = (UIImageView *)[btn viewWithTag:VIEW_TAG_KTTABBAR_ITEM_FRONT_IMG_VIEW];
//                if (frontImageView) {
//                    // 刷新redTipView大小
//                    CGFloat frontImageViewWidth = (btn.frame.size.height < btn.frame.size.width ? btn.frame.size.height : btn.frame.size.width)  * 2 / 3;
//                    frontImageView.frame = CGRectMake((btn.frame.size.width - frontImageViewWidth) / 2,
//                                                      (btn.frame.size.height - frontImageViewWidth) / 2,
//                                                      frontImageViewWidth,
//                                                      frontImageViewWidth);
//                    frontImageView.layer.cornerRadius = frontImageView.bounds.size.width / 2;
//                }
//            }
//            
//            UILabel * splitLabel = (UILabel *)[self viewWithTag:VIEW_TAG_KTTABBAR_ITEM_SPLIT + i];
//            if (splitLabel && btn) {
//                splitLabel.frame = CGRectMake(0,
//                                              self.headSpacing + i * (self.itemHeight + self.itemSpacing) + self.itemHeight,
//                                              self.frame.size.width,
//                                              self.itemSpacing * 2);
//                splitLabel.backgroundColor = self.spaceColor;
//            }
//        }
//    }else{  //ktplay竖版 tabbar横着的
//        CGFloat y = (self.frame.size.height - self.itemHeight) / 2;
//        if (y < 0) {y = 0;}
//        
//        for (int i = 0; i < [self.items count]; i++) {
//            UIButton * btn = (UIButton *)[self viewWithTag:VIEW_TAG_KTTABBAR_ITEM + i];
//            if (btn) {
//                btn.frame = CGRectMake(self.headSpacing + i * (self.itemWidth + self.itemSpacing),
//                                       y,
//                                       self.itemWidth,
//                                       self.itemHeight);
//                // 刷新titleLabel大小
//                //btn.titleLabel.hidden = NO;
//                btn.titleLabel.frame = CGRectMake(0, 0, btn.frame.size.width, btn.frame.size.height);
//                
//                if (self.style == KTTabBarStyleText) {
//                    tipSpace = btn.frame.size.width / 5.0f;
//                }
//                UIImageView * redTipView = (UIImageView *)[btn viewWithTag:VIEW_TAG_KTTABBAR_ITEM_RED_TIP];
//                if (redTipView) {
//                    redTipView.image = self.tipImage;
//                    redTipView.frame = CGRectMake(btn.frame.size.width - self.tipImage.size.width - tipSpace,
//                                                  0,
//                                                  self.tipImage.size.width,
//                                                  self.tipImage.size.height);
//                }
//                
//                UIImageView * frontImageView = (UIImageView *)[btn viewWithTag:VIEW_TAG_KTTABBAR_ITEM_FRONT_IMG_VIEW];
//                if (frontImageView) {
//                    CGFloat frontImageViewWidth = (btn.frame.size.height < btn.frame.size.width ? btn.frame.size.height : btn.frame.size.width)  * 2 / 3;
//                    frontImageView.frame = CGRectMake((btn.frame.size.width - frontImageViewWidth) / 2,
//                                                      (btn.frame.size.height - frontImageViewWidth) / 2,
//                                                      frontImageViewWidth,
//                                                      frontImageViewWidth);
//                    frontImageView.layer.cornerRadius = frontImageView.bounds.size.width / 2;
//                }
//            }
//            
//            UILabel * splitLabel = (UILabel *)[self viewWithTag:VIEW_TAG_KTTABBAR_ITEM_SPLIT + i];
//            if (splitLabel) {
//                splitLabel.frame = CGRectMake(self.headSpacing + i * (self.itemWidth + self.itemSpacing) + self.itemWidth ,
//                                              0,
//                                              self.itemSpacing,
//                                              self.frame.size.height);
//                splitLabel.backgroundColor = self.spaceColor;
//            }
//            
//        }
//    }
//}


-(void)refreshSelectStatus:(NSInteger)index{
    
    //设置状态
    if (index >= 0 && index < [self.items count]) {
        for (int i = 0; i < [self.items count]; i ++) {
            UIButton * btnTmp = (UIButton *)[self viewWithTag:VIEW_TAG_KTTABBAR_ITEM + i];
            if (btnTmp) {
                if (i == index) {
                  
                    btnTmp.selected = YES;
                    btnTmp.userInteractionEnabled = NO;
                    [btnTmp setTitleColor:[UIColor colorWithRed:0/255.0f green:123/255.0f blue:251/255.0f alpha:1.0f] forState:UIControlStateNormal];
                }
                else{
                    btnTmp.selected =  NO;
                    btnTmp.userInteractionEnabled = YES;
                    [btnTmp setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }
            }
        }
    }
}

-(void)clickItem:(UIButton *)btn{
    NSInteger index = btn.tag - VIEW_TAG_KTTABBAR_ITEM;
    [self refreshSelectStatus:index];
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ktTabBar:didSelectIndex:flag:)]) {
        [self.delegate ktTabBar:self didSelectIndex:index flag:1];
    }

}

-(void)dealloc{
    for (NSUInteger i = 0; i < self.items.count; i++) {
        KTTabBarItem * item = [self.items objectAtIndex:i];
        [item removeObserver:self forKeyPath:@"badgeValue"];
        [item removeObserver:self forKeyPath:@"frontImage"];
    }
}

@end
