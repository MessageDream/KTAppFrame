//
//  KTModelHelperTypeEncoding.m
/**
 *  成员变量类型（属性类型）
 */
#import <Foundation/Foundation.h>


NSString *const KTModelHelperTypeInt = @"i";
NSString *const KTModelHelperTypeFloat = @"f";
NSString *const KTModelHelperTypeDouble = @"d";
NSString *const KTModelHelperTypeLong = @"q";
NSString *const KTModelHelperTypeLongLong = @"q";
NSString *const KTModelHelperTypeChar = @"c";
NSString *const KTModelHelperTypeBOOL = @"c";
NSString *const KTModelHelperTypePointer = @"*";

NSString *const KTModelHelperTypeIvar = @"^{objc_ivar=}";
NSString *const KTModelHelperTypeMethod = @"^{objc_method=}";
NSString *const KTModelHelperTypeBlock = @"@?";
NSString *const KTModelHelperTypeClass = @"#";
NSString *const KTModelHelperTypeSEL = @":";
NSString *const KTModelHelperTypeId = @"@";

/**
 *  返回值类型(如果是unsigned，就是大写)
 */
NSString *const KTModelHelperReturnTypeVoid = @"v";
NSString *const KTModelHelperReturnTypeObject = @"@";



