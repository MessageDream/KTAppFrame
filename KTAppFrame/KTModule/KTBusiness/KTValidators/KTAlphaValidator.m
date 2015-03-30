

#import "KTAlphaValidator.h"

@implementation KTAlphaValidator

- (id) init {
    self = [super init];
    
    if (self) {
        self.reason = NSLocalizedString(@"The Text can contain only letters", @"Validator reason (Alert)");
        _regularExpression = @"^[a-zA-Z]*$";
        _errorCode = KTValidationAlphabetErrorCode;
    }
    
    return self;
}

@end
