//
//  KTResponse.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KTErrorCode){
    KTNetErrorCode_Fail = 0,
    KTNetErrorCode_TimerOut = -1004,
};
@class KTApiResponse;

@interface KTApiResponse : NSObject
@property (nonatomic       ) NSInteger                  code;
@property (nonatomic,copy  ) NSString                   *msg;
@property (nonatomic  )      NSInteger                  intenal_code;
@property (nonatomic,copy  ) NSString                   *intenal_msg;
@property (nonatomic,strong) id                         userInfo;
+(KTApiResponse *)checkResponseWithObject:(id)object path:(NSString *)path paras:(NSDictionary *)params;



@end

