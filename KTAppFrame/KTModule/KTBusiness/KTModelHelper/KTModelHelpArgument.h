//
//  KTModelHelpArgument.h


#import <Foundation/Foundation.h>
/**
 *  包装一个方法参数
 */
@interface KTModelHelpArgument : NSObject
/** 参数的索引 */
@property (nonatomic, assign) int index;
/** 参数类型 */
@property (nonatomic, copy) NSString *type;
@end
