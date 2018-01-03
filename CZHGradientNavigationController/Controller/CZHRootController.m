//
//  CZHRootController.m
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "CZHRootController.h"
#import "CZHGradientTableViewController.h"
@interface CZHRootController ()

@end

@implementation CZHRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CZHColor(0xff0000);
    self.title = @"根控制器";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CZHGradientTableViewController *vc = [[CZHGradientTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
