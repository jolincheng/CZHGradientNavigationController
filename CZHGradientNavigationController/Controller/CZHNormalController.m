//
//  CZHNormalController.m
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "CZHNormalController.h"

@interface CZHNormalController ()

@end

@implementation CZHNormalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CZHColor(0x00ff00);
    self.title = @"这是一个新标题";
    
    [self czh_registNotification];
}

- (void)czh_registNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(back) name:CZHNavigationControllerDidBack object:nil];
    
}

- (void)back {
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"确定退出吗" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    [ac addAction:cancle];
    [ac addAction:sure];
    
    [self presentViewController:ac animated:YES completion:nil];
}

@end
