//
//  KTBaseInfo.h
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"
@interface KTModelAppInfo : KTModel
@property (nonatomic) NSInteger app_type;
@property (nonatomic,copy) NSString *app_version;
@property (nonatomic) NSInteger game_id;
@property (nonatomic) NSInteger game_groupid;
@property (nonatomic,copy) NSString *app_name;
@property (nonatomic,copy) NSString *app_icon_url;

@property (nonatomic,copy) NSString *app_download_url;
@end

@interface KTModelTopicConfig : KTModel
@property (nonatomic,strong) NSArray *category_list;

@end

//@interface KTModelReportConfig : KTModel
//@property (nonatomic,strong) NSArray *report_types;
//
//@end

@interface KTModelMoreGameConfig : KTModel
@property (nonatomic,copy) NSString *mainpage;
@property (nonatomic,copy) NSString *profile;
@property (nonatomic,copy) NSString *userpage;
@property (nonatomic,copy) NSString *screenshot;
@property (nonatomic,copy) NSString *discussion;
@end

@interface KTModelThirdpartKey : KTModel
@property (nonatomic,copy) NSString *analytics_game;
@property (nonatomic,copy) NSString *analytics_ktplay;

@end


@interface KTModelCrossPromotion : KTModel
@property (nonatomic,strong) KTModelMoreGameConfig *display_storetrigger_in;

@end

@interface KTModelTopicCategory : KTModel
@property (nonatomic) NSInteger mid;
@property (nonatomic,copy) NSString *name;

@end

@interface KTModelReportType : KTModel
@property (nonatomic,copy) NSString *rtype;
@property (nonatomic,copy) NSString *name;

@end

@interface KTModelBaseInfo : KTModel
@property (nonatomic,copy) NSString *enabled;
@property (nonatomic,strong) KTModelAppInfo *app_info;
@property (nonatomic,strong) KTModelTopicConfig *topic_config;
@property (nonatomic,strong) KTModelCrossPromotion *store_config;
@property (nonatomic,strong) KTModelThirdpartKey *thirdparty_keys;
@property (nonatomic,strong) NSMutableArray *report_types;
@property (nonatomic,strong) NSString *chat_app_key;


@property (nonatomic,copy) NSString *s_s;
//+(KTModelBaseInfo *)shareBaseInfo;
@end


