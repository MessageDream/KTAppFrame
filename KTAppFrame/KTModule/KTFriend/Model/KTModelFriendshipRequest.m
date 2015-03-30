//
//  KTFriendshipRequest.m
//  KTplayBusiness
//
//  Created by xingbin on 14/9/24.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTModelFriendshipRequest.h"
#import "KTplayBusiness.h"
#import "KTModelMappingDefines.h"

@implementation KTModelFriendshipRequest

@end


@implementation KTModelFriendshipRequests

-(NSDictionary *)objectClassInArray {
    return @{@"requests": [KTModelFriendshipRequest class]};
}

@end

@implementation KTModelFriendshipRequestActivity

@end
