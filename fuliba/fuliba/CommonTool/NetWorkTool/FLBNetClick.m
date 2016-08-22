//
//  FLBNetClick.m
//  fuliba
//
//  Created by wangjundong on 2016/8/19.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBNetClick.h"

#if DEBUG
static NSString* const BASE_URL = @"http://test.wndflb.com"; // 测试地址
#else
static NSString* const BASE_URL = @"http://wndflb.com"; // 发布地址
#endif


@implementation FLBNetClick

+ (instancetype)sharedClient
{
    static FLBNetClick *_shareClient =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient =[[FLBNetClick alloc]initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        _shareClient.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
        ((AFJSONResponseSerializer *)_shareClient.responseSerializer).removesKeysWithNullValues =YES;
        //证书相关
        AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
        _shareClient.securityPolicy = securityPolicy;
        //超时时间
        _shareClient.requestSerializer.timeoutInterval =20;
        // 设置返回格式
        _shareClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        
    });
    return _shareClient;
}
@end
