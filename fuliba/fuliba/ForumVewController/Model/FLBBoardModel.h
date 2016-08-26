//
//  FLBBoardModel.h
//  fuliba
//
//  Created by wangjundong on 2016/8/26.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface FLBBoardModel : FLBBaseModel

@property(nonatomic,copy)NSString *board_child;
@property(nonatomic,copy)NSString *board_content;
@property(nonatomic,copy)NSString *board_id;
@property(nonatomic,copy)NSString *board_img;
@property(nonatomic,copy)NSString *board_name;
@property(nonatomic,copy)NSString *description;
@property(nonatomic,copy)NSString *favNum;
@property(nonatomic,copy)NSString *forumRedirect;
@property(nonatomic,copy)NSString *is_focus;
@property(nonatomic,copy)NSString *last_posts_date;
@property(nonatomic,copy)NSString *posts_total_num;
@property(nonatomic,copy)NSString *td_posts_num;
@property(nonatomic,copy)NSString *topic_total_num;
@end
