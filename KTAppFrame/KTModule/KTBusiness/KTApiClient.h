//
//  KTApi.h
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "KTplayBusiness.h"

typedef NS_ENUM(NSUInteger,KTFormMutilpartType){
    KTFormMutilpartTypeFilePath=0,
    KTFormMutilpartTypeData=1
};


@interface KTFormMutilpart : NSObject
@property(nonatomic,copy)NSString *formName;
@property(nonatomic,copy)NSString *formMimeType;
@property(nonatomic,copy)NSString *formFileName;
@property(nonatomic) KTFormMutilpartType type;
@property(nonatomic,retain)id data;
@end





@interface KTApiClient : NSObject
//@property (nonatomic,strong) KTModelBaseInfo *baseInfo;
//@property (nonatomic,strong) KTModelAccount *account;
-(BOOL)setDelegateAndInit:(id<KTApiDelegate>)delegate;
-(void)willReceiveKTApiResponse:(KTApiResponse *)response;
-(void)willReceiveKTLoginAccount:(KTModelAccount *)account;
-(void)willReceiveKTBaseInfo:(KTModelBaseInfo *)baseInfo;
-(void)willReceiveKTAccountProfile:(KTModelUser *)user;

-(NSString *)hostUrlString;
-(NSInteger)user_id;




-(void)log:(id)JSON;
+ (instancetype)api;



- (void)remoteImage:(NSString *)urlstring success:(void (^)(UIImage *image))succes;
- (void)cancelAllRequest;
- (void)cancelAllRequestWithSkippath:(NSString *)skippath;

- (void)get:(NSString *)path parameters:(NSMutableDictionary *)parameters success:(void (^)(id JSON))success
    failure:(void (^)(NSError *error))failure;
- (void)post:(NSString *)path parameters:(NSMutableDictionary *)parameters success:(void (^)(id JSON))success
     failure:(void (^)(NSError *error))failure;
@end
