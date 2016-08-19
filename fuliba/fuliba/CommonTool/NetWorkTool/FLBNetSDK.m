//
//  FLBNetSDK.m
//  fuliba
//
//  Created by wangjundong on 2016/8/19.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBNetSDK.h"
#import "FLBNetClick.h"
#import "Reachability.h"

//请求方式
typedef NS_ENUM(NSInteger,JDRequsetType){
    RequestTypeGet,
    RequestTypePost,
    RequestTypeUpLoad,
    RequestTypeDownload
};

@implementation FLBNetSDK


+ (BOOL)isConnection
{
    return [[self alloc] isConnectionAvailable];
}

+(void)getRequestUrlStr:(NSString *)urlStr success:(SuccessBlock)success failure:(FailureBlock)failure
{
    [[self alloc] requestWithUrl:urlStr withDic:nil requestType:RequestTypeGet isCache:NO cacheKey:nil imageKey:nil withData:nil upLoadProgress:nil success:^(NSDictionary *requestDic, NSString *msg) {
        success(requestDic,msg );
    } failure:^(NSString *errorInfo) {
        failure(errorInfo);
    }];
}




+(void)postRequestUrlStr:(NSString *)urlStr withDic:(NSDictionary *)parameters success:(SuccessBlock)success failure:(FailureBlock)failure
{
    
    [[self alloc] requestWithUrl:urlStr withDic:parameters requestType:RequestTypePost isCache:NO cacheKey:urlStr imageKey:nil withData:nil upLoadProgress:nil success:^(NSDictionary *requestDic, NSString *msg){
        success(requestDic,msg);
    } failure:^(NSString *errorInfo) {
        failure(errorInfo);
    }];
}


+(void)upLoadDataWithUrlStr:(NSString *)urlStr withDic:(NSDictionary *)parameters imageKey:(NSString *)attach withData:(NSData *)data upLoadProgress:(loadProgress)loadProgress success:(SuccessBlock)success failure:(FailureBlock)failure
{
    
    [[FLBNetClick sharedClient] POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSTimeInterval timeInterVal = [[NSDate date] timeIntervalSince1970];
        NSString * fileName = [NSString stringWithFormat:@"%@.png",@(timeInterVal)];
        [formData appendPartWithFileData:data name:attach fileName:fileName mimeType:@"image/png"];
        DLog(@"图片-formData%@",formData);
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        loadProgress((float)uploadProgress.completedUnitCount/(float)uploadProgress.totalUnitCount);
        DLog(@"%lf",(float)uploadProgress.completedUnitCount/(float)uploadProgress.totalUnitCount);
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *myResult = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        DLog(@"%@",responseObject);
        success(myResult,@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(@"上传失败");
    }];
    
}
#pragma mark -- 网络请求统一处理
- (void)requestWithUrl:(NSString *)url withDic:(NSDictionary *)parameters requestType:(JDRequsetType)requestType isCache:(BOOL)isCache cacheKey:(NSString *)cacheKey imageKey:(NSString *)attach withData:(NSData *)data upLoadProgress:(loadProgress)loadProgress success:(SuccessBlock)success failure:(FailureBlock)failure
{
    //处理中文和空格问题
    url =[url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //进行网络检查
    if (![self isConnectionAvailable]) {
        failure(@"没有网络");
        return;
    }
    FLBNetClick *session = [FLBNetClick sharedClient];
    //get请求
    if (requestType == RequestTypeGet) {
        [session GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            [self returnDataWithRequestData:responseObject Success:^(NSDictionary *requestDic, NSString *msg) {
                success(requestDic,msg );
            } failure:^(NSString *errorinfo) {
                failure(errorinfo);
            }];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(@"没有网络");
        }];
        
    }
    
    //post请求
    if (requestType == RequestTypePost) {
        
        [session POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            
            [self returnDataWithRequestData:responseObject Success:^(NSDictionary *requestDic, NSString *msg) {
                success(requestDic,msg );
                
            } failure:^(NSString *errorinfo) {
                failure(errorinfo);
                
            }];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(@"网络错误");
        }];
    }
    
    //上传
    if (requestType == RequestTypeUpLoad) {
        [session POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSTimeInterval timeInterVal = [[NSDate date] timeIntervalSince1970];
            NSString * fileName = [NSString stringWithFormat:@"%@.png",@(timeInterVal)];
            [formData appendPartWithFileData:data name:attach fileName:fileName mimeType:@"image/png"];
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
            
            loadProgress((float)uploadProgress.completedUnitCount/(float)uploadProgress.totalUnitCount);
            DLog(@"%lf",(float)uploadProgress.completedUnitCount/(float)uploadProgress.totalUnitCount);
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            [self returnDataWithRequestData:responseObject Success:^(NSDictionary *requestDic, NSString *msg) {
                success(requestDic,msg );
                
            } failure:^(NSString *errorinfo) {
                failure(errorinfo);
                
            }];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failure(@"出现错误了");
        }];
        //下载
        if (requestType ==RequestTypeDownload) {
            
        }
    }
    if (requestType ==RequestTypeDownload) {
        
        NSURL *downUrl = [NSURL URLWithString:url];
        //3.创建请求对象
        NSURLRequest *request = [NSURLRequest requestWithURL:downUrl];
        
        //4.发送网络请求下载文件
        /*
         第一个参数:请求对象
         第二个参数:progress 进度回调
         downloadProgress
         @property int64_t totalUnitCount;
         @property int64_t completedUnitCount;
         第三个参数:destination 让我们告诉系统应该把文件存放到什么地方
         内部自动的完成剪切处理
         第四个参数: completionHandler 完成之后的回调
         response 响应头信息
         filePath  文件最终的存储路径
         error 错误信息
         */
        [[session downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
            
            DLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
            
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            
            //拼接文件的全路径
            NSString *fullpath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
            
            DLog(@"fullpath == %@",fullpath);
            return [NSURL fileURLWithPath:fullpath];
            
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            
            DLog(@"%@",filePath);
        }] resume];
        
    }
    
    
}
#pragma mark --根据返回的数据进行统一的格式处理  ----requestData 网络或者是缓存的数据----
- (void)returnDataWithRequestData:(NSData *)requestData Success:(SuccessBlock)success failure:(FailureBlock)failure{
    
    id myResult = [NSJSONSerialization JSONObjectWithData:requestData options:NSJSONReadingMutableContainers error:nil];
    //判断是否为字典
    if ([myResult isKindOfClass:[NSDictionary  class]]) {
        
        NSDictionary *  requestDic = (NSDictionary *)myResult;
        
        //根据返回的接口内容来变
        int  succ = [requestDic[@"state"] intValue];
        if (succ == 1) {
            success(requestDic,requestDic[@"msg"]);
        }else{
            failure(requestDic[@"msg"]);
        }
    }
    else
    {
        DLog(@"后台返回数据错误!!!!------%@",requestData);
        DLog(@"后台返回数据错误!!!!------%@",requestData);
        DLog(@"后台返回数据错误!!!!------%@",requestData);
    }
}

/**
 *  网络判断
 *
 *  @return 是否可以联网
 */
- (BOOL)isConnectionAvailable{
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    
    if (!isExistenceNetwork) {
        
        return NO;
    }
    
    return isExistenceNetwork;
}
@end
