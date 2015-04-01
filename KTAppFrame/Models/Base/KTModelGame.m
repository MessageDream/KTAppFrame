//
//  KTModelGame.m
//  KTplayBusiness
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTModelGame.h"
#import "KTplayBusiness.h"
#import "KTModelMappingDefines.h"

@implementation KTModelGame

- (NSDictionary *)replacedKeyFromPropertyName{
    return kGlobalMappingInfo;
}

@end

@implementation KTModelGames

-(NSDictionary *)objectClassInArray {
    return kGamesInArray;
}

@end
