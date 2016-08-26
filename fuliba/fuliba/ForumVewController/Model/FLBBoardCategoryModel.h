//
//  FLBBoardCategoryModel.h
//  fuliba
//
//  Created by wangjundong on 2016/8/26.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLBBoardCategoryModel : FLBBaseModel
@property(nonatomic,copy)NSString *board_category_id;
@property(nonatomic,copy)NSString *board_category_name;
@property(nonatomic,copy)NSString *board_category_type;
@property(nonatomic,copy)NSArray *board_list;
@end
