//
//  FLBBBSListViewController.m
//  fuliba
//
//  Created by wangjundong on 2016/8/27.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBBBSListViewController.h"
#import "FLBBBSListModel.h"
#import "MJExtension.h"

@interface FLBBBSListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *BBSListArray;
@property(nonatomic,retain)UITableView *tableView;
@end

@implementation FLBBBSListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self getData];
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

- (void)getData
{
    _BBSListArray =[NSMutableArray array];
    [FLBNetSDK getRequestUrlStr:[NSString stringWithFormat:@"%@&boardId=%@",URL_BBS_LIST,_boardID]  success:^(NSDictionary *requestDic, NSString *msg) {
        DLog(@">>>%@",requestDic);
        for (NSDictionary *dic in requestDic[@"list"]) {
            FLBBBSListModel *model =[[FLBBBSListModel alloc]init];
            [model mj_setKeyValues:dic];
            [_BBSListArray addObject:model];
        }
        [_tableView reloadData];
    } failure:^(NSString *errorCode, NSDictionary *errorInfo) {
        DLog(@">>>%@",errorInfo);
    }];

}
#pragma mark - UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _BBSListArray.count;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[_tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifer];
    FLBBBSListModel *model =[_BBSListArray objectAtIndex:indexPath.row];
    cell.textLabel.text =model.title;
    cell.detailTextLabel.text =model.userTitle;
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.f;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FLBBBSListModel *model =[_BBSListArray objectAtIndex:indexPath.row];

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
