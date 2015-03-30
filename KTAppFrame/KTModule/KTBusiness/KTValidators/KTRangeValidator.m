//
//  KTRangeValidator.m
//  KTplayBusiness
//
//  Created by xingbin on 14/9/18.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTRangeValidator.h"

@implementation KTRangeValidator
- (id) init {
    self = [super init];
    
    if (self) {
        self.reason = NSLocalizedString(@"The text field can't not be empty.", @"Validator reason (Alert)");
        self.range = NSMakeRange(0,0);
    }
    
    return self;
}

- (BOOL) validateText:(NSString *)Text error:(NSError **) error {
    NSInteger minLength = self.range.location ;
    NSInteger maxLength = self.range.length ;
    NSString *text = [Text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    if ([text length] > maxLength ||[text length] < minLength )  {
        if (error != nil) {
            *error = [[self class] errorWithReason:self.reason code:KTTextValidationRangeErrorCode];
        }
        return NO;
    }
    return YES;
}

@end
