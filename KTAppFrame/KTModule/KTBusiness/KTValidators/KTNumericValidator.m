

#import "KTNumericValidator.h"

@implementation KTNumericValidator

- (id) init {
    self = [super init];
    if (self) {
        self.reason = NSLocalizedString(@"The Text can contain only numerical values", @"Validator reason (Alert)");
        _regularExpression = @"^[0-9]*$";
        _errorCode = KTValidationNumericErrorCode;
    }
    
    return self;
}

@end
