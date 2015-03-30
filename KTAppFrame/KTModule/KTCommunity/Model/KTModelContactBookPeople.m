//
//  KTModelContactBookPeople.m
//  kt239_sdk
//
//  Created by Jayden Zhao on 10/15/14.
//  Copyright (c) 2014 KTplay. All rights reserved.
//

#import "KTModelContactBookPeople.h"

@implementation KTModelContactBookPeople
-(id)initWithNickname:(NSString *)nickname andPhone:(NSString *)mobilePhone andRegionCode:(NSString *)code
{
    if (self=[super init]) {
        self.nickname=nickname==nil?@"":nickname;
        self.mobilePhone=mobilePhone==nil?@"":[mobilePhone stringByReplacingOccurrencesOfString:@"-" withString:@""];;
        self.recode=code==nil?@"":code;
    }
    return self;
}
@end
