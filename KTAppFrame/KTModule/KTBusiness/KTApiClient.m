//
//  KTApi.m
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import "KTApiClient.h"
#import "AFNetworking.h"
#import "KTCommonApiDefines.h"
#import "KTLeaderboardApiDefines.h"
#import "KTApiResponse.h"
#import "KTApi.h"
//#import "KTApiValidators.h"
#import "OpenUDID.h"
#import <CommonCrypto/CommonDigest.h>
#import "KTplayBusiness.h"
//#import "Reachability.h"
#import "KTCommunityApiDefines.h"
#import "KTFriendApiDefines.h"
#import "KTUserApiDefines.h"
#import "KTInboxApiDefines.h"
static KTApiClient *apiClient;


@implementation KTFormMutilpart

@end

@interface KTApiClient ()
@property (nonatomic,strong) AFHTTPClient *afclient;
@property (nonatomic,strong) NSOperationQueue *imageQueue;

@property (nonatomic,assign) id<KTApiDelegate> delegate;
@property (nonatomic,strong) NSMutableDictionary *commonParams;

//@property (nonatomic,strong) NSLock *datalock;

@end

@implementation KTApiClient
@synthesize delegate = _delegate;


+ (instancetype)api {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        apiClient =  [[KTApiClient alloc] init];
       
        
        
    });
    return apiClient;
}

-(NSString *)hostUrlString{
    KTRemoteRegion region = KTRemoteRegionChina;
    NSString *baseUrl = KR_API_BASEURL_CHINA;
    
    if (_delegate && [_delegate remoteRegion]) {
        region = [_delegate remoteRegion];
    }
    
    switch (region) {
        case KTRemoteRegionChina:
        {
            NSString *tempBaseUrl = nil;
            if (_delegate && [_delegate respondsToSelector:@selector(remoteTestHostWithRegion:)]) {
                tempBaseUrl = [_delegate remoteTestHostWithRegion:KTRemoteRegionChina];
            }
            if (tempBaseUrl) {
                baseUrl = tempBaseUrl;
            }else{
                baseUrl = KR_API_BASEURL_CHINA;
            }
        }
            break;
        case KTRemoteRegionInternational:
        {
            NSString *tempBaseUrl = nil;
            if (_delegate && [_delegate respondsToSelector:@selector(remoteTestHostWithRegion:)]) {
                tempBaseUrl = [_delegate remoteTestHostWithRegion:KTRemoteRegionInternational];
            }
            if (tempBaseUrl) {
                baseUrl = tempBaseUrl;
            }else{
                baseUrl = KR_API_BASEURL_INTERNATIONAL;
            }
        }
            break;
    }
    
    return baseUrl;
}

-(NSURL *)hostUrl{
    
    return [NSURL URLWithString:[self hostUrlString]];
    /*
    KTRemoteRegion region = KTRemoteRegionChina;
    NSString *baseUrl = KR_API_BASEURL_CHINA;
    
    if (_delegate && [_delegate remoteRegion]) {
        region = [_delegate remoteRegion];
    }

    switch (region) {
        case KTRemoteRegionChina:
        {
            NSString *tempBaseUrl = nil;
            if (_delegate && [_delegate respondsToSelector:@selector(remoteTestHostWithRegion:)]) {
                tempBaseUrl = [_delegate remoteTestHostWithRegion:KTRemoteRegionChina];
            }
            if (tempBaseUrl) {
                baseUrl = tempBaseUrl;
            }else{
                baseUrl = KR_API_BASEURL_CHINA;
            }
        }
            break;
        case KTRemoteRegionInternational:
        {
             NSString *tempBaseUrl = nil;
            if (_delegate && [_delegate respondsToSelector:@selector(remoteTestHostWithRegion:)]) {
                tempBaseUrl = [_delegate remoteTestHostWithRegion:KTRemoteRegionInternational];
            }
            if (tempBaseUrl) {
                baseUrl = tempBaseUrl;
            }else{
                baseUrl = KR_API_BASEURL_INTERNATIONAL;
            }
        }
            break;
    }
    
    return [NSURL URLWithString:baseUrl];
     */
}

- (NSString *)platform{
    return @"ios";
}

- (NSString *)osVersion{
    NSString *osVersion = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] systemVersion]];

    return (osVersion&&osVersion.length>0)?osVersion:@"unknown";
}

- (NSString *)appName{
//    XCTest
    NSString *appName = nil;
    if (NSClassFromString(@"XCTest")) {
       NSDictionary * infoDictionary =  [[NSBundle bundleForClass:[self class]] infoDictionary];
        appName = [infoDictionary objectForKey:@"CFBundleName"];

    }else{
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        appName = [infoDictionary objectForKey:@"CFBundleDisplayName"];

    }
    return (appName&&appName.length>0)?appName:@"unknown";
}

- (NSString *)appVersion{
    NSString *version = nil;
    if (NSClassFromString(@"XCTest")) {
        NSDictionary *infoDictionary =  [[NSBundle bundleForClass:[self class]] infoDictionary];
        version = [infoDictionary objectForKey:@"CFBundleVersion"];

    }else{
       NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
       version = [infoDictionary objectForKey:@"CFBundleVersion"];

    }
    return (version&&version.length>0)?version:@"unknown";
}

- (NSString *)appPackage{
    
   NSString *bundleId =  nil;
    if (NSClassFromString(@"XCTest")) {
       NSDictionary * infoDictionary =  [[NSBundle bundleForClass:[self class]] infoDictionary];
       bundleId =  [infoDictionary objectForKey:@"CFBundleIdentifier"];;

    }else{
       NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
        bundleId =  [infoDictionary objectForKey:@"CFBundleIdentifier"];;
    }

    return (bundleId&&bundleId.length>0)?bundleId:@"unknown";
}

- (NSString *)openUdid{
    return [OpenUDID value];
}

-(NSString *)sdkVersion{
    NSString *version = @"unknown";
    if (_delegate && [_delegate respondsToSelector:@selector(sdkVersion)]) {
        version = [_delegate sdkVersion];
    }
    return version;
}

-(NSInteger)sdkVersionCode{
    NSInteger version_code = 0;
    if (_delegate && [_delegate respondsToSelector:@selector(sdkVersionCode)]) {
        version_code = [_delegate sdkVersionCode];
    }
    return version_code;
}

- (NSString *)currentLanguage{
    
    NSString * lng = [[NSLocale preferredLanguages] firstObject];

    return (lng&&lng.length>0)?lng:@"zh-Hans";
}

-(NSString *)channelId{
    NSString *channel = @"appstore";
    if (_delegate && [_delegate respondsToSelector:@selector(channelId)]) {
        channel = [_delegate channelId];
    }
    return channel;
}

- (NSString *)country{
    return  [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];

    
}

-(NSString *)appKey{
    NSString *app_key = @"unknown";
    if (_delegate && [_delegate respondsToSelector:@selector(appKey)]) {
        app_key = [_delegate appKey];
    }
    return app_key;
}

-(NSString *)appSecretWithMD5{
    NSString *secret = @"unknown";
    if (_delegate && [_delegate respondsToSelector:@selector(appSecretWithMD5)]) {
        secret = [_delegate appSecretWithMD5];
    }
    return secret;
}



-(NSDictionary *)appendCommonParameters{

    NSString *channel_id = [self channelId];
    NSString *platform = [self platform];
    NSString *os_version = [self osVersion];
    NSString *app_name =  [self appName];
    NSString *app_version = [self appVersion];
    NSString *app_package =  [self appPackage];
    NSString *open_udid =  [self openUdid];
    NSString *sdk_version =  [self sdkVersion];


    NSMutableDictionary *temParams =  [NSMutableDictionary dictionary];

    if (channel_id) {
        [temParams setObject:channel_id forKey:@"channel_id"];
    }
    if (platform) {
        [temParams setObject:platform forKey:@"platform"];
    }
    if (os_version){
        [temParams setObject:os_version forKey:@"os_version"];
    }
    
    if (app_name){
        [temParams setObject:app_name forKey:@"app_name"];
    }
    if (app_version){
        [temParams setObject:app_version forKey:@"app_version"];
    }
    
    if (app_package) {
        [temParams setObject:app_package forKey:@"app_package"];
    }
    if (sdk_version) {
        [temParams setObject:sdk_version forKey:@"sdk_version"];
    }
    if (open_udid) {
        [temParams setObject:open_udid forKey:@"open_udid"];
        [temParams setObject:open_udid forKey:@"device_id"];
    }
  
    return temParams;
}

-(NSDictionary *)appendDynamicParameters:(NSString *)path method:(NSString *)method {
    NSMutableDictionary *temParams =  [NSMutableDictionary dictionary];
    
    

    
    if([method isEqualToString:@"POST"]
       || [path isEqualToString:API_PATH_FRINEND_LIST]
       || [path isEqualToString:API_PATH_REQUEST_FRIENDSHIPS_LIST]
       || [path isEqualToString:API_PATH_CHECK_NEW_FRINENDSHIP_REQUEST]
       || [path isEqualToString:API_PATH_RECOMMEND_USERS_FOR_ADDFRIEND]
       || [path isEqualToString:API_PATH_RECOMMEND_USERS_FOR_ADDFRIEND_GUIDE]
       || [path isEqualToString:API_PATH_SEARCH_USER]
       || [path isEqualToString:API_PATH_FRINEND_TOPIC_ACTIVITY_LIST]
       || [path isEqualToString:API_PATH_CHECK_NEW_TOPIC_ACTIVITY]
       || [path isEqualToString:API_PATH_RECOMMEND_USERS_WITH_ADDRESSBOOK]
       || [path isEqualToString:API_PATH_RECOMMEND_USERS_WITH_LBS]
       || [path isEqualToString:API_PATH_FRIEND_LEADERBOARD]
       || [path isEqualToString:API_PATH_NOTICE_LIST]
       || [path isEqualToString:API_PATH_CHECK_NEW_NOTICE]
       || [path isEqualToString:API_PATH_USAGE_REDEEM]
       || [path isEqualToString:API_PATH_CHECK_REDEEM]){
        
        NSString *userToken =  [self userToken];
        if (userToken && userToken.length>0) {
            [temParams setObject:userToken forKey:@"user_token"];
        }
    }
    
    NSString *app_key =  [self appKey];
    NSInteger game_id =  [self gameId];
    NSString *language =  [self currentLanguage];
    NSString *country =  [self country];
    
    if (game_id!=0) {
        [temParams setObject:@(game_id) forKey:@"game_id"];
    }
    if(app_key){
        [temParams setObject:app_key forKey:@"app_key"];
    }
    if (language) {
        [temParams setObject:language forKey:@"language"];
    }
    if (country) {
        [temParams setObject:country forKey:@"country"];
    }
    return temParams;
}

-(NSString*)sortParams:(id)obj
{
    NSArray *array =[obj allKeys];
    if ([array count]!=0)
    {
        array = [array sortedArrayUsingSelector:@selector(compare:)];
        //只需要key排序就可以了
    }
    NSString *resultStr = @"";
    for (NSString * str in array)
    {
        if ([str isEqualToString:@"KTFormMltipart"])
        {
            resultStr  = resultStr;
        }
        else
        {
            NSString * key = str;//[KTUtils encodeURL:str];
            NSString *value = [NSString stringWithFormat:@"%@",[obj objectForKey:str]];
            //    value = [KTUtils encodeURL:value];
            resultStr = [resultStr stringByAppendingFormat:@"%@%s%@%s",key,"%3D",value,"%26",nil];
        }
        //字符串拼装 格式为 key+%3D+value+%26
    }
    if (![resultStr isEqualToString:@""])
    {
        resultStr = [resultStr substringToIndex:([resultStr length] - [@"%26" length])]; //截取掉多余的一个 %26
    }
    return resultStr;
}

-(NSString *)md5:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

-(void)md5password:(NSMutableDictionary *)parameters{
    NSString *password = [parameters objectForKey:@"password"];
    if (password) {
        [parameters setObject:[self md5:password] forKey:@"password"];
    }
    NSString *newpassword = [parameters objectForKey:@"newpassword"];
    if (newpassword) {
        [parameters setObject:[self md5:newpassword] forKey:@"newpassword"];
        
    }
}

- (void)handleSafeParameters:(NSMutableDictionary *)dictionary{
    [self md5password:dictionary];
    NSString *sign = [self appSecretWithMD5]; //sign 已经MD5加密
    NSString *baseString = [self sortParams:dictionary]; //生成字符串
    NSString *signString = [NSString stringWithFormat:@"%@%@",sign,baseString];
    signString = [self md5:signString];
    [dictionary setObject:signString forKey:@"signature"];
    if ([self s_s] ) {
        [dictionary setObject:[self s_s] forKey:@"s_s"];
    }
}

-(void)willReceiveKTApiResponse:(KTApiResponse *)response{
    if (_delegate && [_delegate respondsToSelector:@selector(willReceiveKTApiResponse:)]) {
        [_delegate willReceiveKTApiResponse:response];
    }
}
-(KTModelBaseInfo *)baseInfo{
    if (_delegate && [_delegate respondsToSelector:@selector(baseInfo)]) {
       return  [_delegate baseInfo];
    }
    return nil;
}
-(KTModelAccount *)account{
    if (_delegate && [_delegate respondsToSelector:@selector(account)]) {
        return [_delegate account];
    }
    return nil;
}



-(void)willReceiveKTAccountProfile:(KTModelUser *)user{
    if (_delegate && [_delegate respondsToSelector:@selector(willReceiveKTAccountProfile:)]) {
        [_delegate willReceiveKTAccountProfile:user];
    }
}

-(void)willReceiveKTLoginAccount:(KTModelAccount *)account{
    if (_delegate && [_delegate respondsToSelector:@selector(willReceiveKTLoginAccount:)]) {
        [_delegate willReceiveKTLoginAccount:account];
    }
}
-(void)willReceiveKTBaseInfo:(KTModelBaseInfo *)baseInfo{
    if (_delegate && [_delegate respondsToSelector:@selector(willReceiveKTBaseInfo:)]) {
        [_delegate willReceiveKTBaseInfo:baseInfo];
    }
}

-(NSInteger)user_id{
    KTModelAccount *account= [self account];
    
    if (account&&account.user_id) {
        return account.user_id;
    }
    
    return 0;
    
}
-(NSString *)userToken{
   KTModelAccount *account= [self account];
    
    if (account&&account.user_token&&account.user_token.length>0) {
        return account.user_token;
    }
  
        return nil;
   
}

-(NSInteger)gameId{
    KTModelBaseInfo *baseInfo= [self baseInfo];
    if (baseInfo&&baseInfo.app_info&&baseInfo.app_info) {
        return baseInfo.app_info.game_id;
    }
    
    return 0;
    
}

-(NSString *)s_s{
    KTModelBaseInfo *baseInfo= [self baseInfo];
    if (baseInfo&&baseInfo.s_s&&baseInfo.s_s.length>0) {
        return baseInfo.s_s;
    }
    
    return nil;
}
-(BOOL)setDelegateAndInit:(id<KTApiDelegate>)delegate{
    
    self.delegate = delegate;
    NSURL * hostUrl = [self hostUrl];
    self.commonParams = [NSMutableDictionary dictionary];
    [self.commonParams addEntriesFromDictionary:[self appendCommonParameters]];

    
    AFHTTPClient *af =  [AFHTTPClient clientWithBaseURL:hostUrl];
    [[af operationQueue] setMaxConcurrentOperationCount:1];
    
    self.afclient  = af;

    
    return YES;
}


- (NSError *) errorWithReasonForCheckParameter:(NSString *)aReason code:(NSInteger)code {
    NSString *description = @"Parameter Validation Failed";
    NSDictionary *userInfo =  @{NSLocalizedDescriptionKey : description,
                                NSLocalizedFailureReasonErrorKey : aReason};
    
    NSError *error = [NSError errorWithDomain:@"com.ktplay.http.error" code:code userInfo:userInfo];
    return error;
}
- (NSError *) errorWithReasonForNet:(NSString *)aReason code:(NSInteger)code {
    NSString *description = @"Net  Failed";
    NSDictionary *userInfo =  @{NSLocalizedDescriptionKey : description,
                                NSLocalizedFailureReasonErrorKey : aReason};
    
    NSError *error = [NSError errorWithDomain:@"com.ktplay.http.error" code:code userInfo:userInfo];
    return error;
}



-(NSError *)willRequest:(NSString *)path method:(NSString *)method parameters:(NSMutableDictionary *)parameters{
    
    
    [parameters addEntriesFromDictionary:self.commonParams];
    [parameters addEntriesFromDictionary:[self appendDynamicParameters:path method:method]];
   


    if ([_delegate respondsToSelector:@selector(willSendRequest:method:parameters:)]) {
        [_delegate willSendRequest:path method:method parameters:parameters];
    }
    
    /*
    id isAuth = [parameters objectForKey:@"auth"];
    if (isAuth && [isAuth boolValue] == 1) {
        NSString *userToken =  [self userToken];
         if (userToken && userToken.length>0) {
               [parameters setObject:userToken forKey:@"user_token"];
        }
        [parameters removeObjectForKey:@"auth"];

    }
    */
    NSError *error = nil;
   
    NSDictionary *apiValidator = [parameters objectForKey:@"api_validator"];
    if (apiValidator) {
        __block NSString *error_key = nil;;

        [apiValidator enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent
                                      usingBlock:^(id key, id object, BOOL *stop) {
                                          
                                         NSString * parameter_value =  [parameters objectForKey:key];
                                          
                                          if (parameter_value==nil||parameter_value.length==0) {
                                              error_key = [NSString stringWithFormat:@"miss parameter: %@",key];
                                          }
                                          
                                    
                                      }];
        
        
        if (error_key) {
            error = [self errorWithReasonForCheckParameter:error_key code:KTInternalErrorMissParameters];
        }
        
    }
    [parameters removeObjectForKey:@"api_validator"];

    if ([method isEqualToString:@"POST"]||[path isEqualToString:API_PATH_CHECK_USERRELATIONSHIP]) {
        [self handleSafeParameters:parameters];
    }
   
    return error;

}



-(void)processKTFormMltipart:(id)formData obj:(KTFormMutilpart *)obj{
    switch (obj.type) {
            
        case KTFormMutilpartTypeFilePath:
        {
            NSString *name = obj.formName;
            NSString *filename = obj.formFileName;
            NSString *mimeType = obj.formMimeType;
            id data = obj.data;
            NSURL  *fileurl = [NSURL fileURLWithPath:data];
            [formData appendPartWithFileURL:fileurl name:name fileName:filename mimeType:mimeType error:nil];
        }
            break;
            
        case KTFormMutilpartTypeData:
        {
            NSString *name = obj.formName;
            NSString *filename = obj.formFileName;
            NSString *mimeType = obj.formMimeType;
            id data = obj.data;
            [formData appendPartWithFileData:data name:name fileName:filename mimeType:mimeType];
        }
            break;
            
    }
}
- (void)handleMultipartFormData:(NSMutableDictionary *)parameters formData:(id<AFMultipartFormData>)formData{
    id multipartParts =  [parameters objectForKey:@"KTFormMutilpart"];
    if (multipartParts) {
        if ([multipartParts isKindOfClass:[NSArray class]]) {
            for (KTFormMutilpart *multipartPart in multipartParts) {
                if (multipartPart.data) {
                    [self processKTFormMltipart:formData obj:multipartPart];
                }
            }
        }else if ([multipartParts isKindOfClass:[KTFormMutilpart class]]){
            if ([((KTFormMutilpart *)multipartParts) data]) {
                [self processKTFormMltipart:formData obj:multipartParts];
            }
        }
        
        [parameters removeObjectForKey:@"KTFormMutilpart"];
    }
    
    
}
-(NSError *)checkReachable{
    return nil;
//    NSError *error =  nil;
//    Reachability *reachability = [Reachability reachabilityWithHostName:@"http://www.apple.com"];
//    if ([reachability currentReachabilityStatus] == NotReachable) {
//        error = [self errorWithReasonForNet:@"NotReachable" code:KTInternalErrorNotReachable];
//    }
//    return error;
}


- (void)cancelAllRequest{
    if (_afclient) {
        [[_afclient operationQueue] cancelAllOperations];
    }
}
- (void)cancelAllRequestWithSkippath:(NSString *)skippath{
    if (_afclient) {
        

        
        for (NSOperation *operation in [[_afclient operationQueue] operations]) {
            if (![operation isKindOfClass:[AFHTTPRequestOperation class]]) {
                continue;
            }
            
            BOOL hasMatchingPath = [[[[(AFHTTPRequestOperation *)operation request] URL] path] isEqual:skippath];
            
            if ( hasMatchingPath) {
                [operation cancel];
            }
        }
    }
}



- (void)get:(NSString *)path parameters:(NSMutableDictionary *)parameters success:(void (^)(id JSON))success
    failure:(void (^)(NSError *error))failure
{
    if (_delegate == nil) {
        return;
    }
    if (parameters == nil) {
        parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    }
    
    NSError *error = [self willRequest:path method:@"GET" parameters:parameters];
    
    if (error) {
        failure(error);
        return;
    }
    
    error = [self checkReachable];
    
    if (error) {
        failure(error);
        return;
    }

    NSMutableURLRequest *request = [_afclient requestWithMethod:@"GET" path:path parameters:parameters];
    [request setTimeoutInterval:15];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];

    AFJSONRequestOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest * originRequest, NSHTTPURLResponse *response, id JSON) {
        if (JSON) {
            //NSLog(@"Thread Name:%@",[[NSThread currentThread] name]);
            
            if ([self.delegate respondsToSelector:@selector(didReceiveRemoteJSONData:method:JSON:)]) {
                [self.delegate didReceiveRemoteJSONData:path method:@"GET" JSON:JSON];
            }
#ifdef DEBUG
            NSLog(@"==<=<== HTTP GET:%@ ==<=<==\n", response);
            [self log:JSON];
#endif
            success(JSON);
        }else{
            NSError *error = [NSError errorWithDomain:@"kCFErrorDomainCFNetwork" code:response.statusCode==0?-1:response.statusCode userInfo:[NSDictionary dictionary]];

            
            if ([self.delegate respondsToSelector:@selector(didReceiveRemoteFailError:method:error:)]) {
                [self.delegate didReceiveRemoteFailError:path method:@"GET" error:error];
            }
            failure(error);
        }
       
    } failure:^(NSURLRequest * originRequest, NSHTTPURLResponse *response, NSError * failureError, id JSON) {
        if ([self.delegate respondsToSelector:@selector(didReceiveRemoteFailError:method:error:)]) {
            [self.delegate didReceiveRemoteFailError:path method:@"GET" error:failureError];
        }
        failure(failureError);
    }];
    
    [_afclient enqueueHTTPRequestOperation:op];


    
}

-(void)log:(id)JSON{
    NSData *data = [NSJSONSerialization dataWithJSONObject:JSON options:NSJSONWritingPrettyPrinted error:NULL];
    
    //NSString *string =[NSString stringWithUTF8String:(const char *)[data bytes]];
    NSString *string =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
#ifdef DEBUG
    NSLog(@"------------\n%@\n-----------",string);
#endif
}

- (void)post:(NSString *)path parameters:(NSMutableDictionary *)parameters success:(void (^)(id JSON))success
     failure:(void (^)(NSError *error))failure
{
    if (_delegate == nil) {
        return;
    }
    if (parameters == nil) {
        parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    }
    NSError *error = [self willRequest:path method:@"POST" parameters:parameters];
    
    if (error) {
        failure(error);
        return;

    }
    
    error = [self checkReachable];
    
    if (error) {
        failure(error);
        return;
    }


    NSMutableURLRequest *request = [_afclient multipartFormRequestWithMethod:@"POST" path:path parameters:parameters constructingBodyWithBlock: ^(id formData) {
        
        [self handleMultipartFormData:parameters formData:formData];

        
    }];
    [request setTimeoutInterval:15];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
     AFJSONRequestOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *originRequest, NSHTTPURLResponse *response, id JSON) {
          if (JSON) {
         if ([self.delegate respondsToSelector:@selector(didReceiveRemoteJSONData:method:JSON:)]) {
             [self.delegate didReceiveRemoteJSONData:path method:@"POST" JSON:JSON];
         }
#ifdef DEBUG
         NSLog(@"==<=<== HTTP POST:%@ ==<=<==\n", response);
         [self log:JSON];
#endif
         success(JSON);
          }else{
              NSError *error = [NSError errorWithDomain:@"kCFErrorDomainCFNetwork" code:response.statusCode==0?-1:response.statusCode userInfo:[NSDictionary dictionary]];
              
              
              if ([self.delegate respondsToSelector:@selector(didReceiveRemoteFailError:method:error:)]) {
                  [self.delegate didReceiveRemoteFailError:path method:@"GET" error:error];
              }
              failure(error);
          }
     } failure:^(NSURLRequest *originRequest, NSHTTPURLResponse *response, NSError * failureError, id JSON) {
    
         if ([self.delegate respondsToSelector:@selector(didReceiveRemoteFailError:method:error:)]) {
             [self.delegate didReceiveRemoteFailError:path method:@"POST" error:failureError];
         }

         failure(failureError);
     }];
    [_afclient enqueueHTTPRequestOperation:op];

    
}
- (void)remoteImage:(NSString *)urlstring success:(void (^)(UIImage *image))succes{
    
    if (_imageQueue == nil) {
        _imageQueue= [[NSOperationQueue alloc] init];
        [_imageQueue setMaxConcurrentOperationCount:1];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlstring] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    

    AFImageRequestOperation *iop = [AFImageRequestOperation imageRequestOperationWithRequest:request success:^(UIImage *image) {
        //NSLog(@"Thread Name:%@",[[NSThread currentThread] name]);

        succes(image);
    }];
    [_imageQueue addOperation:iop];
    
}


@end
