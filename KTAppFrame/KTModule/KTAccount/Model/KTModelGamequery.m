//
//  KTModelGamequery.m
//  KTplayBusiness
//
//  Created by qinxuliang on 15/1/9.
//  Copyright (c) 2015年 xingbin. All rights reserved.
//

#import "KTModelGamequery.h"

@implementation KTModelGameinfo

@end

@implementation KTModelGamequery

-(NSDictionary *)objectClassInArray {
	return @{@"games": [KTModelGameinfo class]};
}

@end
