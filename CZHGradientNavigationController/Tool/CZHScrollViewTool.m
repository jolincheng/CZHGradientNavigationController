//
//  CZHScrollViewTool.m
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "CZHScrollViewTool.h"

@implementation CZHScrollViewTool
+ (void)czh_contentInsetAdjustmentBehaviorWithScrollView:(UIScrollView *)scrollView {
    if (@available(iOS 11.0, *)) {
        if ([scrollView isKindOfClass:[UITableView class]]) {
            UITableView *tableView = (UITableView *)scrollView;
            tableView.estimatedRowHeight = 0;
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
        }
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}
@end
