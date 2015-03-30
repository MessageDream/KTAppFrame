//
//  KTModelTopic.m
//  KTplayBusiness
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTModelTopic.h"
#import "KTplayBusiness.h"
#import "KTModelMappingDefines.h"
@implementation KTModelTopic
- (NSDictionary *)replacedKeyFromPropertyName{
    return kGlobalMappingInfo;
}
-(NSDictionary *)objectClassInArray {
    return kImagesInArray;
}
@end



@implementation KTModelTopics

-(NSDictionary *)objectClassInArray {
    return kTopicInArray;
}
@end
