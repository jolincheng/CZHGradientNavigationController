//
//  AppDelegate+CZHExtenion.h
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CZHExtenion)

/**
 *  左边偏移
 *
 *  @param leftSpace 偏移距离（向左为负，向右为正）
 *
 *  @return return UIBarButtonItem
 */
+ (UIBarButtonItem *)czh_leftSpace:(CGFloat)leftSpace;
/**
 *  右边偏移
 *
 *  @param rightSpace 偏移距离（向左为负，向右为正）
 *
 *  @return return UIBarButtonItem
 */
+ (UIBarButtonItem *)czh_rightSpace:(CGFloat)rightSpace;

+ (UIBarButtonItem *)czh_itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

@end
