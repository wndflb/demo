//
//  FLBNetClick.h
//  fuliba
//
//  Created by wangjundong on 2016/8/19.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface FLBNetClick : AFHTTPSessionManager


+ (instancetype)sharedClient;
@end
