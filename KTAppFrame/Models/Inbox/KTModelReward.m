//
//  KTModelReward.m
//  KTplayBusiness
//
//  Created by xingbin on 14/9/24.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTModelReward.h"
#import "KTplayBusiness.h"
#import "KTModelMappingDefines.h"
#import <CommonCrypto/CommonDigest.h>

@implementation KTModelReward

- (NSDictionary *)replacedKeyFromPropertyName{
    return kGlobalMappingInfo;
}

@end

@implementation KTModelRewards
-(NSDictionary *)objectClassInArray {
    return kKTModelRewardInArray;
}

- (BOOL)isVerifiedWithAppSecret:(NSString *)appSecret andMsgId:(long long)andMsgId{
    if (!appSecret) {
        return NO;
    }
    __block NSString *baseString = @"";
    [self.contents enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        KTModelReward *reward = obj;
        baseString = [baseString stringByAppendingString:[NSString stringWithFormat:@"%@%@%ld",reward.mid,@"%3D",(long)reward.value]];
        if (idx != self.contents.count - 1) {
            baseString = [baseString stringByAppendingString:@"%26"];
        }
    }];
    return [[self md5:[NSString stringWithFormat:@"%@%lld%@",appSecret,andMsgId,baseString]] isEqualToString:self.signature];
}

-(NSString *)md5:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}



@end
