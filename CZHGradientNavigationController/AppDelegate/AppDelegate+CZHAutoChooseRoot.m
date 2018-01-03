//
//  AppDelegate+CZHAutoChooseRoot.m
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "AppDelegate+CZHAutoChooseRoot.h"
#import "CZHRootController.h"
@implementation AppDelegate (CZHAutoChooseRoot)

- (void)czh_autoChooseRootController {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[CZHBaseNavigationController alloc] initWithRootViewController:[[CZHRootController alloc] init]];

}

@end
