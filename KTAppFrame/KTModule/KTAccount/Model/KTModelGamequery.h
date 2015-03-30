//
//  KTModelGamequery.h
//  KTplayBusiness
//
//  Created by qinxuliang on 15/1/9.
//  Copyright (c) 2015年 xingbin. All rights reserved.
//

#import "KTModel.h"

@interface KTModelGameinfo : KTModel

@property (nonatomic, copy) NSString * icon_url;
@property (nonatomic, copy) NSString * name;

@end

@interface KTModelGamequery : KTModel

@property (nonatomic, copy) NSString * select_token;
@property (nonatomic, strong) NSArray *games;

@end
