

#import "KTRegexValidator.h"
#import "KTRequiredValidator.h"


@implementation KTRegexValidator

#pragma mark -
#pragma mark Validation

- (BOOL) validateText:(NSString *)Text error:(NSError **)error {
    NSRegularExpression *regex = [NSRegularExpression
        regularExpressionWithPattern:_regularExpression
        options:NSRegularExpressionAnchorsMatchLines error:error];
    
    if ([Text length] == 0) {
        if (error != nil) {
            NSString *theReason = NSLocalizedString(@"The text field doesn't contain any characters, can't validate", @"Validator reason (Alert)");
            *error = [[self class] errorWithReason:theReason code:KTTextValidationRequiredErrorCode];
        }
        return NO;
    }
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:Text
                                                        options:NSMatchingAnchored
                                                          range:NSMakeRange(0, [Text length])];
    
    if (numberOfMatches == 0) {
        if (error != nil) {
            *error = [self error];
        }
        
        return NO;
    }
    
    return YES;
}

- (NSError *) error {
    return [[self class] errorWithReason:self.reason code:_errorCode];
}


@end
