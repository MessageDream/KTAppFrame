//
//  KTTitleBarAndTableView.h
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTTitleBarAndScrollerView.h"

@interface KTTitleBarAndTableView : KTTitleBarAndScrollerView
{
@protected
    UITableView *_tableView;
}
@property(nonatomic,readonly)UITableView *tableView;
-(instancetype)initWithTableViewStyle:(UITableViewStyle)style;
@end
