//
//  KTModelHelperExtension.h

//

#import "KTModelHelperTypeEncoding.h"
#import "NSObject+KTModelHelperCoding.h"
#import "NSObject+KTModelHelperMember.h"
#import "NSObject+KTModelHelperKeyValue.h"

#define MJLogAllIvrs \
- (NSString *)description \
{ \
    return [self keyValues].description; \
}
