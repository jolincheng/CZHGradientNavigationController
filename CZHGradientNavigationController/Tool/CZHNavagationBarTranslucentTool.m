//
//  CZHNavagationBarTranslucentTool.m
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "CZHNavagationBarTranslucentTool.h"

@implementation CZHNavagationBarTranslucentTool

+ (void)czh_changeNavigationBarTransparencyWithViewController:(UIViewController *)viewController contentOffsetY:(CGFloat)contentOffsetY {
    
    if (contentOffsetY >= CZHNavigationBarHeight) {
        
        [viewController.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:CZHNavigationBarNormalTitleColor,NSForegroundColorAttributeName, CZHNavigationBarTitleFont,NSFontAttributeName,nil]];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        [viewController.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [viewController.navigationController.navigationBar setShadowImage:nil];
    } else if (contentOffsetY < CZHNavigationBarHeight && contentOffsetY > 0) {
        
        [viewController.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:CZHNavigationBarNormalTitleColor,NSForegroundColorAttributeName, CZHNavigationBarTitleFont,NSFontAttributeName,nil]];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        CGFloat alpha = contentOffsetY / CZHNavigationBarHeight;
        [viewController.navigationController.navigationBar setBackgroundImage:[UIColor imageWithColor:CZHRGBColor(0xffffff, alpha)] forBarMetrics:UIBarMetricsDefault];
        [viewController.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    } else {
        
        [viewController.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:CZHNavigationBarTranslucentTitleColor,NSForegroundColorAttributeName, CZHNavigationBarTitleFont,NSFontAttributeName,nil]];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [viewController.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        
        [viewController.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    }
}

@end
