//
//  KTModelDeepLink.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/24.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"

@interface KTModelDeepLink : KTModel

@property (nonatomic) long long msg_id;

@property (nonatomic, copy) NSDictionary *contents;
@property (nonatomic, copy) NSString * link_schems;
@end
