//
//  KTModelReward.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/24.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"

@interface KTModelReward : KTModel

@property (nonatomic,copy) NSString * mid;
@property (nonatomic, copy) NSString * name;
@property (nonatomic) NSInteger value;

@end

@interface KTModelRewards : KTModel

@property (nonatomic) NSInteger msg_id;
@property (nonatomic, copy) NSString * signature;

@property (nonatomic, retain) NSMutableArray *contents;
- (BOOL)isVerifiedWithAppSecret:(NSString *)appSecret andMsgId:(long long)andMsgId;
@end
