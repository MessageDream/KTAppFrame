//
//  KTModelHelperMember.m

//

#import "KTModelHelperMember.h"
#import "KTModelHelperExtension.h"
#import "KTModelHelperFoundation.h"
#import "KTModelHelperConst.h"

@implementation KTModelHelperMember


/**
 *  初始化
 *
 *  @param srcObject 来源于哪个对象
 *
 *  @return 初始化好的对象
 */
- (instancetype)initWithSrcObject:(id)srcObject
{
    if (self = [super init]) {
        _srcObject = srcObject;
    }
    return self;
}

- (void)setSrcClass:(Class)srcClass
{
    _srcClass = srcClass;
    
    MJAssertParamNotNil(srcClass);
    
    _srcClassFromFoundation = [KTModelHelperFoundation isClassFromFoundation:srcClass];
}

MJLogAllIvrs
@end
