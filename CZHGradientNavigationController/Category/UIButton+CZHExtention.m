//
//  UIButton+CZHExtention.m
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "UIButton+CZHExtention.h"

@implementation UIButton (CZHExtention)

+ (UIButton *)czh_buttonWithTarget:(id)target action:(SEL)action image:(NSString *)image highlighted:(NSString *)highlighted {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btn setImage:[[UIImage imageNamed:highlighted] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    btn.czh_size = btn.currentImage.size;
    [btn sizeToFit];
    
    return btn;
}

@end
