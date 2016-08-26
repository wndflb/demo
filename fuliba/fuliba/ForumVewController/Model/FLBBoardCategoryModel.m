//
//  FLBBoardCategoryModel.m
//  fuliba
//
//  Created by wangjundong on 2016/8/26.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBBoardCategoryModel.h"
#import "MJExtension.h"
#import "FLBBoardModel.h"

@implementation FLBBoardCategoryModel

+(NSDictionary *)mj_objectClassInArray
{
    return @{@"board_list" : [FLBBoardModel class]};

}

@end
