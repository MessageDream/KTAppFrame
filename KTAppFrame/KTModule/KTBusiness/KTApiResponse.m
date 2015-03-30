//
//  KTResponse.m
//  KTplayBusiness
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTApiResponse.h"
#import "KTApiClient.h"
#import "KTModel.h"
#import "KTModelHelperExtension.h"


@implementation KTApiResponse


+(KTApiResponse *)checkResponseWithObject:(id)object path:(NSString *)path paras:(NSDictionary *)params{

    KTApiResponse *response = [[KTApiResponse alloc] init];
    if ([object isKindOfClass:[NSError class]]) {
        
        NSError *error = (NSError *)object;

        if ([[error domain] compare: NSURLErrorDomain] == NSOrderedSame) {
            switch ([error code]) {
                case NSURLErrorBadURL:
                case NSURLErrorUnsupportedURL:
                case NSURLErrorCannotFindHost:
                case NSURLErrorCannotConnectToHost:
                case NSURLErrorNetworkConnectionLost:
                    
                case NSURLErrorDNSLookupFailed:
                case NSURLErrorNotConnectedToInternet:
                {
                    response.code = KTInternalErrorLinkFailure;
                    response.intenal_code = KTInternalErrorLinkFailure;
                    response.msg = @"net link failed";
                    response.intenal_msg = @"has net error,please check response.userInfo";

                }
                    break;
                case NSURLErrorTimedOut:
                {
                    response.code = KTInternalErrorNetTimeOut;
                    response.intenal_code = KTInternalErrorNetTimeOut;
                    response.msg = @"net work timeout";
                    response.intenal_msg = @"has net error,please check response.userInfo";
                }
                    break;
                case NSURLErrorCancelled:
                {
                    response.code = KTInternalErrorNetCanceled;
                    response.intenal_code = KTInternalErrorNetCanceled;
                    response.msg = @"net work canceled";
                    response.intenal_msg = @"net work canceled";
                }
                    break;
                default:
                {
                    response.code = KTInternalErrorLinkFailure;
                    response.intenal_code = KTInternalErrorLinkFailure;
                    response.msg = @"net link failed";
                    response.intenal_msg = @"has net error,please check response.userInfo";
                }
                    break;
            }
        }else  if([[error domain] compare: @"com.ktplay.http.error"] == NSOrderedSame){
            response.code = error.code;
            response.intenal_code = KTInternalErrorMissParameters;
            
            response.msg = @"link failed";
            response.intenal_msg = @"has net error,please check response.userInfo";
            
            
        }else if ([[error domain] compare:@"kCFErrorDomainCFNetwork"] == NSOrderedSame){
            response.code = KTInternalErrorLinkFailure;
            response.intenal_code = KTInternalErrorLinkFailure;
            response.msg = @"net link failed";
            response.intenal_msg = @"has net error,please check response.userInfo";
        }else{
            response.code = error.code;
        }
        
        response.userInfo = error.userInfo;


    }else if([object isKindOfClass:[KTModel class]]){
        
        KTModel *baseModel = (KTModel *)object;
        if (baseModel!=nil && baseModel.error_code!=0) {
            response.code = baseModel.error_code;
            response.intenal_code = baseModel.error_code;
            id msg = baseModel.error;
            response.intenal_msg = (msg == nil?@"unknown error":msg);
            response.msg = response.intenal_msg;
            
            NSString *paramsString = @"null";
            if (params) {
                NSData *data =  [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:NULL];
                paramsString = [NSString stringWithUTF8String:(const char *)[data bytes]];
            }
            
            
            NSString *description = [NSString stringWithFormat:@"access error: \n----------\n path:%@ \n params:\n%@\n----------\n",path,paramsString];
            NSString *failureReason = response.msg;
            NSString *recoverySuggestion = @"check request params and server status";
            NSDictionary *errorDict = @{NSLocalizedDescriptionKey : description,
                                          NSLocalizedFailureReasonErrorKey : failureReason,
                                          NSLocalizedRecoverySuggestionErrorKey : recoverySuggestion};
        
            response.userInfo = errorDict;
            
        
        }else{
            response.code = 0;
            response.msg = nil;
            response.intenal_msg = nil;
            response.intenal_code = 0;
            response.userInfo = object;
    
        }
    }
    
    if (response.code && response.code ==  150104) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"KryptaniumNotificationLimitedUserToken" object:nil];

    }
    
    [[KTApiClient api] willReceiveKTApiResponse:response];
    
    return response;
}


@end
