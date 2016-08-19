//
//  FLBForumViewController.m
//  fuliba
//
//  Created by wangjundong on 2016/8/17.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBForumViewController.h"

@interface FLBForumViewController ()

@end

@implementation FLBForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
 [self loadData];
}
- (void)loadData
{
    [FLBNetSDK getRequestUrlStr:@"http://test.wndflb.com/mobcent/app/web/index.php?r=/forum/forumlist" success:^(NSDictionary *requestDic, NSString *msg) {
        DLog(@"%@",requestDic);
        
    } failure:^(NSString *errorinfo) {
        DLog(@"%@",errorinfo);

    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
