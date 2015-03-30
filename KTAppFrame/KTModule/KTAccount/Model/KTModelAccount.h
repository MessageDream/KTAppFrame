//
//  KTModelAccount.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-15.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModelUser.h"

@interface KTModelAccount : KTModelUser<NSCoding>

@property (nonatomic, copy) NSString * user_token;

@property (nonatomic, copy) NSString * platform_login_code;

@end
