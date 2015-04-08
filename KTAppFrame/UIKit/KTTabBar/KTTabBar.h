//
//  KTTabBar.h
//  kt239_sdk
//
//  Created by qiushuitian on 26/4/14.
//  Copyright (c) 2014 ktplay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTTabBarItem;
@protocol KTTabBarDelegate;

typedef enum {
    KTTabBarStyleImage,
    KTTabBarStyleText
}KTTabBarStyle;

typedef enum {
    KTTabBarPositionBottom,
    KTTabBarPositionTop,
    KTTabBarPositionLeft,
}KTTabBarPosition;

@interface KTTabBar : UIView

@property(nonatomic,weak) id<KTTabBarDelegate> delegate;
@property(nonatomic,copy)   NSArray * items;


@property(nonatomic) NSInteger selectedIndex;

@property(nonatomic,strong) UIImage * backgroundImage;
@property(nonatomic,strong) UIImage * tipImage;

@property(nonatomic, strong) UIColor * spaceLineColor; //分个区颜色
@property(nonatomic) CGFloat  barWidth; //Bar高度或者宽度



//@property(nonatomic) CGFloat itemWidth;     // 默认40
//@property(nonatomic) CGFloat itemHeight;    // 默认40
//@property(nonatomic) CGFloat headSpacing;   //头上留出的间距。横版左边为头，竖版上面为头。默认0
//@property(nonatomic) CGFloat itemSpacing;   // 默认 0
//@property(nonatomic, strong) UIColor * spaceColor; //分个区颜色

@property(nonatomic) KTTabBarPosition tabBarPosition;
@property(nonatomic) KTTabBarStyle style;

// UI布局
// 1. frame只在初始化的时候设定。内部不修改frame。
// 2. item位置为去除头部间距后，顺序往下排列显示。出界不管。
//-(id)initWithFrame:(CGRect)frame items:(NSArray *)items style:(KTTabBarStyle)style;
-(id)initWithFrame:(CGRect)frame isLandscape:(BOOL)isLandscape items:(NSArray *)items tipImage:(UIImage *)tipImage style:(KTTabBarStyle)style;
-(id)initWithFrame:(CGRect)frame  items:(NSArray *)items spaceLineColor:(UIColor *)spaceLineColor tipImage:(UIImage *)tipImage style:(KTTabBarStyle)style;
-(id)initWithLandscape:(BOOL)isLandscape items:(NSArray *)items tipImage:(UIImage *)tipImage style:(KTTabBarStyle)style;
-(id)initWithItems:(NSArray *)items spaceLineColor:(UIColor *)spaceLineColor tipImage:(UIImage *)tipImage style:(KTTabBarStyle)style;
@end



@protocol KTTabBarDelegate<NSObject>
@optional
- (void)ktTabBar:(KTTabBar *)tabBar didSelectIndex:(NSInteger)index flag:(int)flag; //flag 1:主动点 2:被动点
@end
