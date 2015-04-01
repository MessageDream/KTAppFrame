//
//  KTBaseInfo.m
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import "KTModelBaseInfo.h"
#import "KTplayBusiness.h"
#import "KTModelMappingDefines.h"
#import "KTApiClient.h"

@implementation KTModelAppInfo

-(NSString *)app_download_url{
    return [_app_download_url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//-(void)encodeWithCoder:(NSCoder *)aCoder{
//    
//    [aCoder encodeObject:self.app_version forKey:@"app_version"];
//    [aCoder encodeObject:@(self.game_id) forKey:@"game_id"];
//    [aCoder encodeObject:@(self.game_groupid) forKey:@"game_groupid"];
//    [aCoder encodeObject:self.app_name forKey:@"app_name"];
//    [aCoder encodeObject:self.app_icon_url forKey:@"app_icon_url"];
//}


//-(id)initWithCoder:(NSCoder *)aDecoder{
//    
//    if (self = [super init]) {
//        
//        self.app_version = [aDecoder decodeObjectForKey:@"app_version"];
//        self.game_id = [[aDecoder decodeObjectForKey:@"game_id"] integerValue];
//        self.game_groupid = [[aDecoder decodeObjectForKey:@"game_groupid"] integerValue];
//        self.app_name = [aDecoder decodeObjectForKey:@"app_name"];
//        self.app_icon_url = [aDecoder decodeObjectForKey:@"app_icon_url"];
//
//
//    }
//    
//    return self;
//}
//



@end

@implementation KTModelTopicConfig
//-(void)encodeWithCoder:(NSCoder *)aCoder{
//    
//    [aCoder encodeObject:self.category_list forKey:@"category_list"];
// 
//}
//
//
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    
//    if (self = [super init]) {
//        
//        self.category_list = [aDecoder decodeObjectForKey:@"category_list"];
//    }
//    
//    return self;
//}


-(NSDictionary *)objectClassInArray {
    return kTopicConfigInArray;
}

@end


@implementation KTModelCrossPromotion

//
//-(void)encodeWithCoder:(NSCoder *)aCoder{
//    
//    [aCoder encodeObject:self.moreGameConfig forKey:@"moreGameConfig"];
//    
//}
//
//
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    
//    if (self = [super init]) {
//        
//        self.moreGameConfig = [aDecoder decodeObjectForKey:@"moreGameConfig"];
//    }
//    
//    return self;
//}


@end

@implementation KTModelThirdpartKey

//-(void)encodeWithCoder:(NSCoder *)aCoder{
//    
//    [aCoder encodeObject:self.chat forKey:@"chat"];
//    [aCoder encodeObject:self.analytics_game forKey:@"analytics_game"];
//
//    [aCoder encodeObject:self.analytics_ktplay forKey:@"analytics_ktplay"];
//}
//
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    
//    if (self = [super init]) {
//        self.chat = [aDecoder decodeObjectForKey:@"chat"];
//        self.analytics_game = [aDecoder decodeObjectForKey:@"analytics_game"];
//
//        self.analytics_ktplay = [aDecoder decodeObjectForKey:@"analytics_ktplay"];
//    }
//    
//    return self;
//}



@end

@implementation KTModelTopicCategory
//-(void)encodeWithCoder:(NSCoder *)aCoder{
//    
//    [aCoder encodeObject:@(self.mid) forKey:@"mid"];
//    [aCoder encodeObject:self.name forKey:@"name"];
//    
//    
//    
//}
//
//
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    
//    if (self = [super init]) {
//        self.mid = [[aDecoder decodeObjectForKey:@"mid"] integerValue];
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        
//    }
//    
//    return self;
//}
- (NSDictionary *)replacedKeyFromPropertyName{
    return kGlobalMappingInfo;
}

@end

@implementation KTModelReportType


@end

@implementation KTModelMoreGameConfig


//-(void)encodeWithCoder:(NSCoder *)aCoder{
//    
//    [aCoder encodeObject:self.mainpage forKey:@"mainpage"];
//    [aCoder encodeObject:self.profile forKey:@"profile"];
//    [aCoder encodeObject:self.userpage forKey:@"userpage"];
//    [aCoder encodeObject:self.discussion forKey:@"discussion"];
//    [aCoder encodeObject:self.screenshot forKey:@"screenshot"];
//
//    
//    
//}
//
//
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    
//    if (self = [super init]) {
//        self.mainpage = [aDecoder decodeObjectForKey:@"mainpage"];
//        self.profile = [aDecoder decodeObjectForKey:@"profile"];
//        self.userpage = [aDecoder decodeObjectForKey:@"userpage"];
//        self.discussion = [aDecoder decodeObjectForKey:@"discussion"];
//        self.screenshot = [aDecoder decodeObjectForKey:@"screenshot"];
//
//    }
//    
//    return self;
//}
//
//
//- (NSString *)description{
//        return [NSString stringWithFormat:@"mainpage:%@\n profile:%@\n userpage:%@\n screenshot:%@\n discussion:%@\n",self.mainpage,self.profile,self.userpage,self.screenshot,self.discussion];
//  
//}
@end



@implementation KTModelBaseInfo


//-(void)encodeWithCoder:(NSCoder *)aCoder{
//    
//    [aCoder encodeObject:self.enabled forKey:@"enabled"];
////    [aCoder encodeObject:self.app_info forKey:@"app_info"];
////    [aCoder encodeObject:self.topic_config forKey:@"topic_config"];
////    [aCoder encodeObject:self.store_config forKey:@"store_config"];
////    [aCoder encodeObject:self.thirdparty_keys forKey:@"thirdparty_keys"];
//    
//    [aCoder encodeObject:self.s_s forKey:@"s_s"];
//
//    
//}
//
//
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    
//    if (self = [super init]) {
//        self.enabled = [aDecoder decodeObjectForKey:@"enabled"];
//        self.app_info = [aDecoder decodeObjectForKey:@"app_info"];
//        self.topic_config = [aDecoder decodeObjectForKey:@"topic_config"];
//        self.store_config = [aDecoder decodeObjectForKey:@"store_config"];
//        self.thirdparty_keys = [aDecoder decodeObjectForKey:@"thirdparty_keys"];
//        self.s_s = [aDecoder decodeObjectForKey:@"s_s"];
//
//    }
//    
//    return self;
//}




//+(KTModelBaseInfo *)shareBaseInfo{
//    
//   
//    return [[KTApiClient api] baseInfo];
//}


@end
