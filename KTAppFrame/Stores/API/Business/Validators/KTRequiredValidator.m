

#import "KTRequiredValidator.h"

@implementation KTRequiredValidator

- (id) init {
    self = [super init];
    
    if (self) {
        self.reason = NSLocalizedString(@"The text field can't not be empty.", @"Validator reason (Alert)");
    }
    
    return self;
}

- (BOOL) validateText:(NSString *)Text error:(NSError **) error {
    NSString *text = [Text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([text length] == 0) {
        if (error != nil) {
            *error = [[self class] errorWithReason:self.reason code:KTTextValidationRequiredErrorCode];
        }
        return NO;
    }
    return YES;
}

@end
