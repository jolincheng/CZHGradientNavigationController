//
//  UIButton+CZHExtention.h
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CZHExtention)
+ (UIButton *)czh_buttonWithTarget:(id)target action:(SEL)action image:(NSString *)image highlighted:(NSString *)highlighted;
@end
