//
//  KTModelHelperFoundation.m


#import "KTModelHelperFoundation.h"
#import "KTModelHelperConst.h"

static NSArray *_foundationClasses;

@implementation KTModelHelperFoundation

+ (void)initialize
{
    _foundationClasses = @[@"NSObject", @"NSNumber",@"NSArray",@"NSMutableArray",@"NSData",@"NSMutableData",@"NSDate",@"NSDictionary",@"NSMutableDictionary",@"NSString",@"NSMutableString"];
}

+ (BOOL)isClassFromFoundation:(Class)c
{
    MJAssertParamNotNil2(c, NO);
    return [_foundationClasses containsObject:NSStringFromClass(c)];
}
@end
