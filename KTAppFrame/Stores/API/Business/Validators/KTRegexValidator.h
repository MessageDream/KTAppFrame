//
//  KTRegularExpressionTextValidator.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/18.
//  Copyright (c) 2014年 xingbin. All rights reserved.

#import "KTValidator.h"

@interface KTRegexValidator : KTValidator {
    @protected
    NSString *_regularExpression;
    NSInteger _errorCode;
}

@end
