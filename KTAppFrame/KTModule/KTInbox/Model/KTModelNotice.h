//
//  KTModelNotice.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/23.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"

@interface KTModelNotice : KTModel

@property (nonatomic) NSInteger alert_level;
@property (nonatomic, copy) NSString * content;
@property (nonatomic) NSInteger  create_time; //FIXME: LONG? DOUBLE?
@property (nonatomic, copy) NSString * download_url;
@property (nonatomic, copy) NSString * icon_url;
@property (nonatomic) long long msg_id;
@property (nonatomic) NSInteger status;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, copy) NSString * button_title;

//TODO: cleck
@property (nonatomic) NSInteger clicked;
@end


@interface KTModelNotices : KTModel

//NOTE: ///game/msgbox/latest
@property (nonatomic) long long last_msg_id; //TODO: should be long long?
@property (nonatomic) NSInteger total;

//NOTE: ///game/msgbox/latest
@property (nonatomic, strong) NSArray *contents;

@end
