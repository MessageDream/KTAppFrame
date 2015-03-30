//
//  KTModelContactBookPeople.h
//  kt239_sdk
//
//  Created by Jayden Zhao on 10/15/14.
//  Copyright (c) 2014 KTplay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KTModelContactBookPeople : NSObject
@property(nonatomic)NSInteger index;

@property(nonatomic,strong)NSString *nickname;
@property(nonatomic,strong)NSString *mobilePhone;
@property(nonatomic,strong)NSString *recode;
@property(nonatomic,strong)NSString *userid; // NSInteger? NSString?
@property(nonatomic,assign)BOOL hasRequested;
-(id)initWithNickname:(NSString *)nickname andPhone:(NSString *)mobilePhone andRegionCode:(NSString *)code;
@end
