//
//  FLBBaseModel.m
//  fuliba
//
//  Created by wangjundong on 2016/8/17.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBBaseModel.h"

@implementation FLBBaseModel


+ (LKDBHelper *)shareDataBase;
{
    return [self getUsingLKDBHelper];
}

- (instancetype)initModelWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    DLog(@"key--%@ isUndefined",key);
}
-(void)setNilValueForKey:(NSString *)key
{
    DLog(@"set nilValue to key--%@",key);
}

+ (LKDBHelper *)getUsingLKDBHelper
{
    static LKDBHelper *db;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *sqlitePath =[self downloadPath];
        NSString *dbpath = [sqlitePath stringByAppendingPathComponent:@"app.db"];
        db =[[LKDBHelper alloc]initWithDBPath:dbpath];
    });
    return db;
}
//数据库存放路径
+ (NSString *)downloadPath
{
    NSString *documentPath =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *downloadPath =[documentPath stringByAppendingPathComponent:@"APPDBPath"];
    NSLog(@"%@",downloadPath);
    return documentPath;
}


@end
