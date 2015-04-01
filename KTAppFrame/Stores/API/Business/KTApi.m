//
//  KTApi.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/18.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//



#import "KTApi.h"
#import "KTApiClient.h"
#import "KTplayBusiness.h"
#import "KTCommonApiDefines.h"


@implementation KTApi

+(NSString *)remoteHost:(KTRemoteRegion)remoteRegion{
    if (remoteRegion == KTRemoteRegionChina) {
        return KR_API_BASEURL_CHINA;
    }else if (remoteRegion == KTRemoteRegionInternational){
        return KR_API_BASEURL_INTERNATIONAL;
    }
    return KR_API_BASEURL_CHINA;
}

+(NSString *)currentRemoteHost{
   return  [[KTApiClient api]  hostUrlString];
}


+(BOOL)registerApiDelegate:(id<KTApiDelegate>)delegate{
   return  [[KTApiClient api] setDelegateAndInit:delegate];
}

+(NSString *)thumbnailUrlStringWithUrlString:(NSString *)urlString size:(CGSize)size{
    NSInteger w = (NSInteger)size.width;
    NSInteger h = (NSInteger)size.height;

    return  [NSString stringWithFormat:@"%@_%lix%li",urlString,(long)w,(long)h];
}

+ (void)cancelAllRequest{
    [[KTApiClient api] cancelAllRequest];
}

+(void)remoteImageWithImageUrlString:(NSString *)urlString complete:(void (^)(UIImage *image))complete{
    

    [[KTApiClient api] remoteImage:urlString success:^(UIImage *image) {
        if (image) {
           complete(image);
        }
        complete(nil);
    }];
    
}
+(void)remoteImageWithImageUrlString:(NSString *)urlString size:(CGSize)size complete:(void (^)(UIImage *image))complete{
    NSString *us = [self thumbnailUrlStringWithUrlString:urlString size:size];
    [self remoteImageWithImageUrlString:us complete:complete];
}

@end

