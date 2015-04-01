//
//  KTModelCommunityActivity.m
//  KTplayBusiness
//
//  Created by xingbin on 14/9/24.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTModelTopicActivity.h"
#import "KTplayBusiness.h"
#import "KTModelMappingDefines.h"

@implementation KTModelTopicAcitvityCount

@end

@implementation KTModelTopicActivity

@end

@implementation KTModelFriendActivity
-(NSDictionary *)objectClassInArray {
    return @{@"actions":[KTModelTopicActivity class]};
}
@end
