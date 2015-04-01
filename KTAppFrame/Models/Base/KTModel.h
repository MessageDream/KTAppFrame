//
//  KTModel.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/18.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface KTModel : NSObject <NSCoding>
@property (nonatomic,copy) NSString *error;
@property (nonatomic) NSInteger error_code;
@end


@interface KTModelPaginator : KTModel

@property (nonatomic, copy) NSString * next_cursor_str;
@property (nonatomic) NSInteger next_cursor;
@property (nonatomic, copy) NSString * previous_cursor_str;
@property (nonatomic) NSInteger previous_cursor;
@property (nonatomic) NSInteger total;
@property (nonatomic) NSInteger end;      

@end

//@interface KTModelWithNSCoding : KTModel <NSCoding>
//
//@end






