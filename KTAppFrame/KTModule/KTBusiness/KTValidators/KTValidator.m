

#import "KTValidator.h"
#import "KTNumericValidator.h"
#import "KTAlphaValidator.h"
#import "KTEmailValidator.h"
#import "KTRequiredValidator.h"

@implementation KTValidator

+ (instancetype) validator {
    return [[self alloc] init];
}

#pragma mark -
#pragma mark Validation

- (BOOL) validateText:(NSString *)Text error:(NSError **)error {
    if (error) {
        *error = nil; 
    }
    
    return NO;
}

+ (BOOL) validateText:(NSString *)Text validators:(NSArray *)validators error:(NSError **)error {
    NSMutableArray *errors = [NSMutableArray array];
    for (KTValidator *validator in validators) {
        NSError *error = nil;
        BOOL isValid = [validator validateText:Text error:&error];
        
        
        if (!isValid) {
            [errors addObject:error];
        }
    }
    
    BOOL isValid = [errors count] == 0;
    
    if (!isValid) {
        NSMutableString *errorMessage = [NSMutableString string];
        for (NSError *error in errors) {
            [errorMessage appendFormat:@"%@\n", [error localizedFailureReason]];
        }
        [errorMessage deleteCharactersInRange:NSMakeRange([errorMessage length] - 1, 1)];
        
        *error = [[self class] errorWithReason:errorMessage code:ktTextValidationMultipleErrorCode];
    }
    
    return isValid;
}


+ (NSError *) errorWithReason:(NSString *)aReason code:(NSInteger)code {
    NSString *description = NSLocalizedString(@"Text Validation Failed", @"Text Validation Failed");
    NSDictionary *userInfo =  @{NSLocalizedDescriptionKey : description,
                                NSLocalizedFailureReasonErrorKey : aReason};

    NSError *error = [NSError errorWithDomain:KTValidationErrorDomain code:code userInfo:userInfo];
    return error;
}

@end
