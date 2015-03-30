//
//  KTApi.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/18.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import  <CoreGraphics/CoreGraphics.h>
@class KTModelBaseInfo;
@class KTApiResponse;
@class KTModelAccount;
@class KTModelUser;
typedef NS_ENUM(NSUInteger,KTRemoteRegion){
    KTRemoteRegionChina=0,
    KTRemoteRegionInternational=1,
};

typedef NS_ENUM(NSUInteger,KTInternalError){
    KTInternalErrorNetTimeOut=100001,
    KTInternalErrorLinkFailure=100002,
    KTInternalErrorMissParameters=100003,
    KTInternalErrorNotReachable=100004,
    KTInternalErrorNetCanceled=100005,

};

@protocol KTApiDelegate <NSObject>

-(NSString *)appKey;
-(NSString *)appSecretWithMD5;
-(NSString *)channelId;
-(NSString *)sdkVersion;
-(NSInteger)sdkVersionCode;
-(KTRemoteRegion)remoteRegion;
-(KTModelBaseInfo *)baseInfo;
-(KTModelAccount *)account;



@optional
-(void)willReceiveKTAccountProfile:(KTModelUser *)user;
-(void)willReceiveKTLoginAccount:(KTModelAccount *)account;
-(void)willReceiveKTBaseInfo:(KTModelBaseInfo *)baseInfo;
-(void)willReceiveKTApiResponse:(KTApiResponse *)response;

-(NSString *)remoteTestHostWithRegion:(KTRemoteRegion)remoteRegion;
-(void)willSendRequest:(NSString *)Path method:(NSString *)method parameters:(NSMutableDictionary *)parameters;
-(void)didReceiveRemoteJSONData:(NSString *)Path method:(NSString *)method JSON:(id)JSON;
-(void)didReceiveRemoteFailError:(NSString *)Path method:(NSString *)method error:(NSError *)error;
@end




@interface KTApi : NSObject

+(NSString *)remoteHost:(KTRemoteRegion)remoteRegion;

+(NSString *)currentRemoteHost;

+(BOOL)registerApiDelegate:(id<KTApiDelegate>)delegate;
+ (void)cancelAllRequest;

+(NSString *)thumbnailUrlStringWithUrlString:(NSString *)urlString size:(CGSize)size;


+(void)remoteImageWithImageUrlString:(NSString *)urlString complete:(void (^)(UIImage *image))complete;
    
+(void)remoteImageWithImageUrlString:(NSString *)urlString size:(CGSize)size complete:(void (^)(UIImage *image))complete;



@end

