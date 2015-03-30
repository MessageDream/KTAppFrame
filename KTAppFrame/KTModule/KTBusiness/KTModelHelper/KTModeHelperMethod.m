//
//  KTModelHelperType.m
//

#import "KTModeHelperMethod.h"
#import "KTModelHelperConst.h"

@implementation KTModeHelperMethod
/**
 *  初始化
 *
 *  @param method    方法
 *  @param srcObject 哪个对象的方法
 *
 *  @return 初始化好的对象
 */
- (instancetype)initWithMethod:(Method)method srcObject:(id)srcObject
{
    if (self = [super initWithSrcObject:srcObject]) {
        self.method = method;
    }
    return self;
}

/**
 *  设置方法
 */
- (void)setMethod:(Method)method
{
    _method = method;
    
    MJAssertParamNotNil(method);
    
    // 1.方法选择器
    _selector = method_getName(method);
    _name = NSStringFromSelector(self.selector);
    
    // 2.参数
    unsigned int step = 2; // 跳过前面的2个参数
    unsigned int argsCount = method_getNumberOfArguments(method);
    NSMutableArray *args = [NSMutableArray arrayWithCapacity:argsCount - step];
    for (unsigned int i = step; i < argsCount; i++) {
        KTModelHelpArgument *arg = [[KTModelHelpArgument alloc] init];
        arg.index = (int)(i - step);
        char *argCode = method_copyArgumentType(method, i);
        arg.type = [NSString stringWithUTF8String:argCode];
        free(argCode);
        [args addObject:arg];
    }
    _arguments = args;
    
    // 3.返回值类型
    char *returnCode = method_copyReturnType(method);
    _returnType = [NSString stringWithUTF8String:returnCode];
    free(returnCode);
}
@end
