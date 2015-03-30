//
//  KTValidator.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/18.
//  Copyright (c) 2014年 xingbin. All rights reserved.

#import <Foundation/Foundation.h>

static NSString *const KTValidationErrorDomain  = @"com.ktplay.validationErrorDomain";
static NSInteger const KTValidationNumericErrorCode = 1001;
static NSInteger const KTValidationAlphabetErrorCode = 1002;
static NSInteger const KTValidationEmailErrorCode = 1003;
static NSInteger const KTTextValidationRequiredErrorCode = 1004;
static NSInteger const KTTextValidationRangeErrorCode = 1005;

static NSInteger const ktTextValidationMultipleErrorCode = 1100;


@protocol KTValidator <NSObject>

+ (NSError *) errorWithReason:(NSString *)aReason code:(NSInteger)code;

@end


@interface KTValidator : NSObject <KTValidator>

@property (nonatomic, strong) NSString *reason;

+ (instancetype) validator;

- (BOOL) validateText:(NSString *)Text error:(NSError **)error;
+ (BOOL) validateText:(NSString *)Text validators:(NSArray *)validators error:(NSError **)error;

@end
