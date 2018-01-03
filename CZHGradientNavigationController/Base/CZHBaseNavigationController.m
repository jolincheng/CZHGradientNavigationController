//
//  CZHBaseNavigationController.m
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "CZHBaseNavigationController.h"
#import "CZHGradientBaseController.h"
#import "CZHGradientTableViewController.h"
#import "CZHNormalController.h"

@interface CZHBaseNavigationController ()

@end

@implementation CZHBaseNavigationController

+ (void)load {
    
    
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    UIFont *font = CZHNavigationBarTitleFont;
    
    
    UIColor *navigationFontC = CZHNavigationBarNormalTitleColor;
    UIColor *navigationBatTintC = CZHColor(0xffffff);
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = navigationFontC;
    textAttrs[NSFontAttributeName] = font;
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置高亮状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = navigationFontC;
    disableTextAttrs[NSFontAttributeName] = font;
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateHighlighted];
    
    
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.barTintColor = navigationBatTintC;
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:navigationFontC,NSForegroundColorAttributeName, font,NSFontAttributeName,nil];
    navigationBar.titleTextAttributes = dict;
    
    navigationBar.tintColor = CZHNavigationBarNormalTitleColor;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationBar.translucent = NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        
        UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        leftSpacer.width = -10;
        

        if ([viewController isKindOfClass:[CZHGradientBaseController class]]) {
            UIBarButtonItem *backItem =  [UIBarButtonItem czh_itemWithTarget:self action:@selector(back) image:@"back_white" highImage:@"back_white"];

            viewController.navigationItem.leftBarButtonItem = backItem;
        } else if ([viewController isKindOfClass:[CZHGradientTableViewController class]]) {
            
            
            
        } else {
            UIBarButtonItem *backItem =  [UIBarButtonItem czh_itemWithTarget:self action:@selector(back) image:@"back_black" highImage:@"back_black"];
            
            viewController.navigationItem.leftBarButtonItem = backItem;
        }

    }
    
    [super pushViewController:viewController animated:animated];
    CZHLog(@"push---%@--%@", self.viewControllers,viewController);
}



- (void)back
{
    
    CZHLog(@"pop-----%@", self.viewControllers);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CZHNavigationControllerDidBack object:nil];
    
    
    if (self.viewControllers.count > 1) {
        UIViewController *lastVC = [self.viewControllers lastObject];
        if ([lastVC isKindOfClass:[CZHNormalController class]]) {//如果当前控制器是发布视频控制器，直接return接收代理做处理
            return;
        }
    }

    [self popViewControllerAnimated:YES];
    
    
}
@end
