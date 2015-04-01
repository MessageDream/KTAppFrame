//
//  KTModelHomePageInfo.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"
@interface KTModelHomePage : KTModel
@property (nonatomic,strong) NSMutableArray *games;
@property (nonatomic,strong) NSMutableArray *topics;
@property (nonatomic,strong) NSMutableArray *topic_images;

@end


