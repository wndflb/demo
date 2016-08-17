//
//  FLBTabBarViewController.m
//  fuliba
//
//  Created by wangjundong on 2016/8/17.
//  Copyright © 2016年 fuliba. All rights reserved.
//

#import "FLBTabBarViewController.h"
#import "FLBDefine.h"
#import "FLBMyViewController.h"
#import "FLBForumViewController.h"
#import "FLBCollectViewController.h"
#import "FLBMessageViewController.h"
#import "FLBNavigationController.h"

@interface FLBTabBarViewController ()<UITabBarDelegate>

@property(nonatomic,strong)NSArray *titleArray;

@end@implementation FLBTabBarViewController
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _titleArray=@[@"板块",@"消息", @"收藏",@"我的"];
    
    [self createViewControllers];
    [self createTabBarItems];
}

//-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
//{
//
//
//}

-(void)createViewControllers{
    
    FLBForumViewController *vc1=[[FLBForumViewController alloc] init];
    FLBNavigationController *nc1 = [[FLBNavigationController alloc]
                                    initWithRootViewController:vc1];
    vc1.title =[_titleArray objectAtIndex:0];
    FLBMessageViewController *vc2=[[FLBMessageViewController alloc] init];
    FLBNavigationController*nc2=[[FLBNavigationController alloc]
                                 initWithRootViewController:vc2];
    vc2.title =[_titleArray objectAtIndex:1];
    FLBCollectViewController *vc3 = [[FLBCollectViewController alloc]init];
    FLBNavigationController*nc3=[[FLBNavigationController alloc]
                                 initWithRootViewController:vc3];
    vc3.title =[_titleArray objectAtIndex:2];
    FLBMyViewController *vc4=[[FLBMyViewController alloc] init];
    FLBNavigationController *nc4 = [[FLBNavigationController alloc]
                                    initWithRootViewController:vc4];
    vc4.title =[_titleArray objectAtIndex:3];
    self.viewControllers=@[nc1,nc2,nc3,nc4];
    
    self.selectedIndex = 0;
}

-(void)createTabBarItems{
    
    
    
    NSArray *unSelectArray = @[@"firstNomal",@"messegeNomal", @"guangjieNomal",@"nearbyNomal",@"myselfNomal"];
    NSArray *selectArray  = @[@"firstSelect",@"messegeSelect", @"guangjieSelect",@"nearbySelect",@"myselfSelect"];
    
    NSArray *allItems=self.tabBar.items;
    
    for (int i=0; i<allItems.count; i++)
    {
        UITabBarItem *item=allItems[i];
        UIImage *selectImage=[self loadImageName:selectArray[i]];
        UIImage *unSelectImage= [self loadImageName:unSelectArray[i]];
        item= [item initWithTitle:_titleArray[i] image:unSelectImage selectedImage:selectImage];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10], NSFontAttributeName, [UIColor grayColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10], NSFontAttributeName, COLOR_MAIN, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    }
}

-(UIImage*)loadImageName:(NSString*)name{
    UIImage*image=[UIImage imageNamed:name];
    image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
