
//
//  KTLengthValidator.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/18.
//  Copyright (c) 2014年 xingbin. All rights reserved.

#import "KTLengthValidator.h"

static NSUInteger const kKLValidatorDefaultMinLength = 1;

@implementation KTLengthValidator

- (id) init {
    self = [super init];
    
    if (self) {
        self.reason = NSLocalizedString(@"The text field can't not be empty.", @"Validator reason (Alert)");
        self.length = kKLValidatorDefaultMinLength;
    }
    
    return self;
}

- (BOOL) validateText:(NSString *)Text error:(NSError **) error {
    NSString *text = [Text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([text length] < self.length) {
        if (error != nil) {
            *error = [[self class] errorWithReason:self.reason code:KTTextValidationRequiredErrorCode];
        }
        return NO;
    }
    return YES;
}

@end
