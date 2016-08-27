//
//  FLBBBSListModel.h
//  fuliba
//
//  Created by wangjundong on 2016/8/27.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBBaseModel.h"

@interface FLBBBSListModel : FLBBaseModel
@property(nonatomic,copy)NSString  *board_id;
@property(nonatomic,copy)NSString  *board_name;// "fa发现之门",
@property(nonatomic,copy)NSString  *topic_id; // 2,
@property(nonatomic,copy)NSString  *type; // "normal",
@property(nonatomic,copy)NSString  *title; // "这是一篇测试文章",
@property(nonatomic,copy)NSString  *user_id; // 1,
@property(nonatomic,copy)NSString  *user_nick_name; // "admin",
@property(nonatomic,copy)NSString  *userAvatar; // "http://test.wndflb.com/uc_server/avatar.php?uid=1&size=middle",
@property(nonatomic,copy)NSString  *last_reply_date; // "1471919439000",
@property(nonatomic,copy)NSString  *vote; // 0,
@property(nonatomic,copy)NSString  *hot; // 0,
@property(nonatomic,copy)NSString  *hits; // 1,
@property(nonatomic,copy)NSString  *replies; // 0,
@property(nonatomic,copy)NSString  *essence; // 0,
@property(nonatomic,copy)NSString  *top; // 0,
@property(nonatomic,copy)NSString  *status; // 32,
@property(nonatomic,copy)NSString  *x; // "这是一篇测试文章，谢谢大家",
@property(nonatomic,copy)NSString  *pic_path; // "",
@property(nonatomic,copy)NSString  *ratio; // "1",
@property(nonatomic,copy)NSString  *gender; // 0,
@property(nonatomic,copy)NSString  *userTitle; // "管理员",
@property(nonatomic,copy)NSString  *recommendAdd; // 0,
@property(nonatomic,copy)NSString  *special; // 0,
@property(nonatomic,copy)NSString  *isHasRecommendAdd; // 0,
@property(nonatomic,copy)NSString  *imageList; // [],
@property(nonatomic,copy)NSString  *sourceWebUrl; // "http://test.wndflb.com/mobcent/app/web/index.php?r=webapp/share&tid=2&forumKey=",
@property(nonatomic,copy)NSString  *verify; // []
@end
