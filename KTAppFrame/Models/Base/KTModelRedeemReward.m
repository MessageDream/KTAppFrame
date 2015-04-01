//
//  KTModelRedeemReward.m
//  KTplayBusiness
//
//  Created by Jayden Zhao on 15/3/5.
//  Copyright (c) 2015年 xingbin. All rights reserved.
//

#import "KTModelRedeemReward.h"
#import "KTModelMappingDefines.h"
#import <CommonCrypto/CommonDigest.h>

@implementation KTModelRedeemReward
- (NSDictionary *)replacedKeyFromPropertyName{
    return kGlobalMappingInfo;
}
@end

@implementation KTModelRedeemRewards

-(NSDictionary *)objectClassInArray {
    return kKTModelRedeemRewardInArray;
}

- (BOOL)isVerifiedWithAppSecret:(NSString *)appSecret andTime:(int)time{
    if (!appSecret) {
        return NO;
    }
    __block NSString *baseString = @"";
    [self.contents enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        KTModelRedeemReward *reward = obj;
        baseString = [baseString stringByAppendingString:[NSString stringWithFormat:@"%@%@%ld",reward.mid,@"%3D",(long)reward.value]];
        if (idx != self.contents.count - 1) {
          baseString = [baseString stringByAppendingString:@"%26"];
        }
    }];
    return [[self md5:[NSString stringWithFormat:@"%@%d%@%@",appSecret,time,self.redeem_code,baseString]] isEqualToString:self.signature];
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