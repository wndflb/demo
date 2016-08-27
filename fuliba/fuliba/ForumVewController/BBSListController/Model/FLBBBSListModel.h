//
//  FLBBBSListModel.h
//  fuliba
//
//  Created by wangjundong on 2016/8/27.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBBaseModel.h"

@interface FLBBBSListModel : FLBBaseModel
@property(nonatomic,copy)NSString  *board_id;  //板块ID
@property(nonatomic,copy)NSString  *board_name;//板块名字"fa发现之门 ",
@property(nonatomic,copy)NSString  *topic_id; // 2,帖子id
@property(nonatomic,copy)NSString  *subject; // 0, 帖子内容
@property(nonatomic,copy)NSString  *type; // "normal", 帖子状态类型
@property(nonatomic,copy)NSString  *title; // "这是一篇测试文章", 帖子标题
@property(nonatomic,copy)NSString  *user_id; // 1,  用户id
@property(nonatomic,copy)NSString  *user_nick_name; // "admin", 用户昵称
@property(nonatomic,copy)NSString  *userAvatar; //用户头像 "http://test.wndflb.com/uc_server/avatar.php?uid=1&size=middle",
@property(nonatomic,copy)NSString  *last_reply_date; // 最后回复时间"1471919439000",
@property(nonatomic,assign)BOOL  vote; // 0,  //是否投票
@property(nonatomic,assign)BOOL hot; // 0,   是否热门
@property(nonatomic,assign)BOOL essence; // 0, 是否精华
@property(nonatomic,assign)BOOL top; // 0, 是否顶置
@property(nonatomic,assign)BOOL recommendAdd; // 0,
@property(nonatomic,assign)BOOL special; // 0,
@property(nonatomic,assign)BOOL isHasRecommendAdd; // 0, 是否添加推荐

@property(nonatomic,copy)NSString  *gender; // 0, 性别
@property(nonatomic,copy)NSString  *status; // 32,
@property(nonatomic,copy)NSString  *pic_path; // "", 图片路径
@property(nonatomic,copy)NSString  *ratio; // "1",
@property(nonatomic,copy)NSString  *userTitle; // "管理员",

@property(nonatomic,copy)NSArray  *imageList; // [],
@property(nonatomic,copy)NSString  *hits; // 1,
@property(nonatomic,copy)NSString  *replies; // 0, 回复数
@property(nonatomic,copy)NSString  *sourceWebUrl; // "http://test.wndflb.com/mobcent/app/web/index.php?r=webapp/share&tid=2&forumKey=",
@property(nonatomic,copy)NSString  *verify; // []
@end
