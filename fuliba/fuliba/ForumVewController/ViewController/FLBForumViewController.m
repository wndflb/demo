//
//  FLBForumViewController.m
//  fuliba
//
//  Created by wangjundong on 2016/8/17.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBForumViewController.h"
#import "MJExtension.h"
#import "FLBBoardModel.h"
#import "FLBBoardCategoryModel.h"

@interface FLBForumViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *boardArray;
@property(nonatomic,copy)NSString *online_user_num;    //在线人数
@property(nonatomic,copy)NSString *td_visitors;        //访客人数
@property(nonatomic,retain)UITableView *tableView;
@end

@implementation FLBForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _boardArray =[NSMutableArray array];
    [self createUI];
    [self loadData];
    
}

- (void)loadData
{
    [_boardArray removeAllObjects];
    [FLBNetSDK getRequestUrlStr:FORUM_Index_URL success:^(NSDictionary *requestDic, NSString *msg) {
        DLog(@"%@",requestDic);
        for (NSDictionary *dic in requestDic[@"list"]) {
            FLBBoardCategoryModel *model =[[FLBBoardCategoryModel alloc]init];
            [model mj_setKeyValues:dic];
            [_boardArray addObject:model];
        }
        [_tableView reloadData];
        
    } failure:^(NSString *errorCode, NSDictionary *errorInfo) {
        DLog(@"%@",errorCode);
    }];
    
}

static NSString *tableViewCellIdentifer = @"HYHActiveSignUpListTableViewCellID";
- (void)createUI
{
    _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellIdentifer];
    _tableView.tableFooterView =[[UIView alloc]init];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
}
#pragma mark - UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    FLBBoardCategoryModel *model =[_boardArray objectAtIndex:section];
    return model.board_list.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _boardArray.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    FLBBoardCategoryModel *model =[_boardArray objectAtIndex:section];
    return model.board_category_name;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[_tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifer];
    FLBBoardCategoryModel *model =[_boardArray objectAtIndex:indexPath.section];
    FLBBoardModel *boardModel =[model.board_list objectAtIndex:indexPath.row];
    cell.textLabel.text =boardModel.board_name;
    cell.imageView.image =[UIImage imageNamed:boardModel.board_img];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.f;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



@end
