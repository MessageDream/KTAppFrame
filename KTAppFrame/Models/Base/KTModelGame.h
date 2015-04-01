//
//  KTModelGame.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"
@interface KTModelGame : KTModel
@property (nonatomic) NSInteger mid;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *download_url;
@property (nonatomic,copy) NSString *icon_url;
@property (nonatomic,copy) NSString *info;

@property (nonatomic) NSInteger game_id;
@end


@interface KTModelGames : KTModel
@property (nonatomic,strong) NSArray *games;
//NOTE: user/game/list
@property (nonatomic) long long time;
@property (nonatomic) NSInteger total;
@end
