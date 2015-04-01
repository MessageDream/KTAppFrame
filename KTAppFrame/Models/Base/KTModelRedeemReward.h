//
//  KTModelRedeemReward.h
//  KTplayBusiness
//
//  Created by Jayden Zhao on 15/3/5.
//  Copyright (c) 2015年 xingbin. All rights reserved.
//

#import "KTModel.h"

@interface KTModelRedeemReward : KTModel
@property (nonatomic,copy) NSString * mid;
@property (nonatomic, copy) NSString * name;
@property (nonatomic) NSInteger value;
@property (nonatomic, copy) NSString *icon_url;
@end

@interface KTModelRedeemRewards : KTModel
@property (nonatomic,copy) NSString * redeem_code;
@property (nonatomic, copy) NSString * signature;
@property (nonatomic,retain) NSMutableArray *contents;
- (BOOL)isVerifiedWithAppSecret:(NSString *)appSecret andTime:(int)time;
@end
