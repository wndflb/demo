//
//  FLBBaseModel.h
//  fuliba
//
//  Created by wangjundong on 2016/8/17.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LKDBHelper.h"

@interface FLBBaseModel : NSObject
//获取数据库操作
+ (LKDBHelper *)shareDataBase;

- (instancetype)initModelWithDic:(NSDictionary *)dic;
@end
