//
//  FLBMyViewController.m
//  fuliba
//
//  Created by wangjundong on 2016/8/17.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBMyViewController.h"
#import "YYRefresh.h"

@interface FLBMyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UITableView *tableView;
@end

@implementation FLBMyViewController
static NSString *tableViewCellIdentifer = @"HYHActiveSignUpListTableViewCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewCellIdentifer];
    _tableView.tableFooterView =[[UIView alloc]init];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    [self.view addSubview:_tableView];
    
    _tableView.mj_header =[YYRefreshHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
              [_tableView.mj_header endRefreshing];
        });
      
    }];
    _tableView.mj_footer =[YYRefreshFooter footerWithRefreshingBlock:^{
        [_tableView.mj_footer endRefreshing];
    } ];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[_tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifer];
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
