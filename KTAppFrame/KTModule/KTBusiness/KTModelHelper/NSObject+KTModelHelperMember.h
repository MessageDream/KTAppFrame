//
//  NSObject+KTModelHelperMember.h


#import <Foundation/Foundation.h>
#import "KTModeHelperIvar.h"
#import "KTModeHelperMethod.h"

/**
 *  遍历所有类的block（父类）
 */
typedef void (^KTModelHelperClassesBlock)(Class c, BOOL *stop);

@interface NSObject (KTModelHelperMember)

/**
 *  遍历所有的成员变量
 */
- (void)enumerateIvarsWithBlock:(KTModelHelperIvarsBlock)block;

/**
 *  遍历所有的方法
 */
- (void)enumerateMethodsWithBlock:(KTModelHelperMethodsBlock)block;

/**
 *  遍历所有的类
 */
- (void)enumerateClassesWithBlock:(KTModelHelperClassesBlock)block;
@end
