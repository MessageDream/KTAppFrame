//
//  NSObject+KTModelHelperMember.m


#import "NSObject+KTModelHelperMember.h"


@implementation NSObject (KTModelHelperMember)

/**
 *  遍历所有的成员变量
 */
- (void)enumerateIvarsWithBlock:(KTModelHelperIvarsBlock)block
{
    [self enumerateClassesWithBlock:^(__unsafe_unretained Class c, BOOL *stop) {
        // 1.获得所有的成员变量
        unsigned int outCount = 0;
        Ivar *ivars = class_copyIvarList(c, &outCount);
        
        // 2.遍历每一个成员变量
        for (unsigned int i = 0; i<outCount; i++) {
            KTModeHelperIvar *ivar = [[KTModeHelperIvar alloc] initWithIvar:ivars[i] srcObject:self];
            ivar.srcClass = c;
            block(ivar, stop);
        }
        
        // 3.释放内存
        free(ivars);
    }];
}

/**
 *  遍历所有的方法
 */
- (void)enumerateMethodsWithBlock:(KTModelHelperMethodsBlock)block
{
    [self enumerateClassesWithBlock:^(__unsafe_unretained Class c, BOOL *stop) {
        // 1.获得所有的成员变量
        unsigned int outCount = 0;
        Method *methods = class_copyMethodList(c, &outCount);
        
        // 2.遍历每一个成员变量
        for (unsigned int i = 0; i<outCount; i++) {
            KTModeHelperMethod *method = [[KTModeHelperMethod alloc] initWithMethod:methods[i] srcObject:self];
            method.srcClass = c;
            block(method, stop);
        }
        
        // 3.释放内存
        free(methods);
    }];
}

/**
 *  遍历所有的类
 */
- (void)enumerateClassesWithBlock:(KTModelHelperClassesBlock)block
{
    // 1.没有block就直接返回
    if (block == nil) return;
    
    // 2.停止遍历的标记
    BOOL stop = NO;
    
    // 3.当前正在遍历的类
    Class c = [self class];
    
    // 4.开始遍历每一个类
    while (c && !stop) {
        // 4.1.执行操作
        block(c, &stop);
        
        // 4.2.获得父类
        c = class_getSuperclass(c);
    }
}
@end
