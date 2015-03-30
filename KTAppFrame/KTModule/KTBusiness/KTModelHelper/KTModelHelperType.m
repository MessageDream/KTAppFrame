//
//  KTModelHelperType.m
//  KTModelHelperExtension

#import "KTModelHelperType.h"
#import "KTModelHelperExtension.h"
#import "KTModelHelperFoundation.h"
#import "KTModelHelperConst.h"

@implementation KTModelHelperType

- (instancetype)initWithCode:(NSString *)code
{
    if (self = [super init]) {
        self.code = code;
    }
    return self;
}

/** 类型标识符 */
- (void)setCode:(NSString *)code
{
    _code = code;
    
    MJAssertParamNotNil(code);
    
    if (code.length == 0 || [code isEqualToString:KTModelHelperTypeSEL] ||
        [code isEqualToString:KTModelHelperTypeIvar] ||
        [code isEqualToString:KTModelHelperTypeMethod]) {
        _KVCDisabled = YES;
    } else if ([code hasPrefix:@"@"] && code.length > 3) {
        // 去掉@"和"，截取中间的类型名称
        _code = [code substringFromIndex:2];
        _code = [_code substringToIndex:_code.length - 1];
        _typeClass = NSClassFromString(_code);
        
        _fromFoundation = [KTModelHelperFoundation isClassFromFoundation:_typeClass];
    }
}

MJLogAllIvrs
@end
