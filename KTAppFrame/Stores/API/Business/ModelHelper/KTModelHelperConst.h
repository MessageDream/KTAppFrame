
#ifndef __MJConst__H__
#define __MJConst__H__

#ifdef DEBUG  // 调试状态
// 打开LOG功能
#define MJLog(...) NSLog(__VA_ARGS__)
#else // 发布状态
// 关闭LOG功能
#define MJLog(...)
#endif

// 颜色
#define MJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define MJRandomColor MJColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

// 断言
#define MJAssert2(condition, desc, returnValue) \
if ((condition) == NO) { \
MJLog(@"\n警告文件：%s\n警告行数：第%d行\n警告方法：%s\n警告描述：%@", __FILE__, __LINE__,  __FUNCTION__, desc); \
return returnValue; \
}

#define MJAssert(condition, desc) MJAssert2(condition, desc, )

#define MJAssertParamNotNil2(param, returnValue) \
MJAssert2(param, [[NSString stringWithFormat:@#param] stringByAppendingString:@"参数不能为nil"], returnValue)

#define MJAssertParamNotNil(param) MJAssertParamNotNil2(param, )

#endif
