

#import "KTEmailValidator.h"

@implementation KTEmailValidator

- (id) init {
    self = [super init];
    if (self) {
        self.reason = NSLocalizedString(@"Email is incorrect", @"Validator reason (Alert)");
        _regularExpression = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        _errorCode = KTValidationEmailErrorCode;
    }
    
    return self;
}

@end
