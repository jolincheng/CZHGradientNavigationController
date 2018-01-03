//
//  CZHGradientTableViewController.m
//  CZHGradientNavigationController
//
//  Created by 程召华 on 2018/1/3.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "CZHGradientTableViewController.h"
#import "CZHNavagationBarTranslucentTool.h"
#import "CZHNormalController.h"
#import "CZHSecondNormoalController.h"
@interface CZHGradientTableViewController ()<UITableViewDelegate,UITableViewDataSource>
///<#注释#>
@property (nonatomic, weak) UIButton *backButton;
///<#注释#>
@property (nonatomic, weak) UIButton *moreButton;
///<#注释#>
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation CZHGradientTableViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //添加代理，会走下面方法
    self.tableView.scrollEnabled = YES;
    [self scrollViewDidScroll:self.tableView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //移除代理，防止走滚动代理方法，影响去下个下面的导航栏
    self.tableView.scrollEnabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CZHColor(0xeeeeee);
    self.title = @"这是一个标题";
    
    [self czh_setNavigationBar];
    
    [self czh_setUpView];
}



- (void)czh_setNavigationBar {
    
    
    UIButton *backButton = [UIButton czh_buttonWithTarget:self action:@selector(back) image:@"back_white" highlighted:@"back_white"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.backButton = backButton;
    
    UIButton *moreButton = [UIButton czh_buttonWithTarget:self action:@selector(moreOperation) image:@"information_more_white" highlighted:@"information_more_white"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:moreButton];
    self.moreButton = moreButton;

}

- (void)czh_setUpView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
//    tableView.contentInset = UIEdgeInsetsMake(CZHNavigationBarHeight, 0, 0, 0);
    [CZHScrollViewTool czh_contentInsetAdjustmentBehaviorWithScrollView:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIImageView *headerIamgeView = [[UIImageView alloc] init];
    headerIamgeView.image = [UIImage imageNamed:@"header_image"];
    headerIamgeView.contentMode = UIViewContentModeScaleAspectFit;
    headerIamgeView.clipsToBounds = NO;
    headerIamgeView.frame = CGRectMake(0, 0, ScreenWidth, ScreenWidth);
    
    tableView.tableHeaderView = headerIamgeView;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"id"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CZHSecondNormoalController *viewController = [[CZHSecondNormoalController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = self.tableView.contentOffset.y;
    
    if (offsetY >= CZHNavigationBarHeight) {
        [self.backButton setImage:[UIImage imageNamed:@"back_black"] forState:UIControlStateNormal];
        [self.moreButton setImage:[UIImage imageNamed:@"information_more_black"] forState:UIControlStateNormal];
   
        
    } else if (offsetY < CZHNavigationBarHeight && offsetY > 0) {
        [self.backButton setImage:[UIImage imageNamed:@"back_black"] forState:UIControlStateNormal];
        [self.moreButton setImage:[UIImage imageNamed:@"information_more_black"] forState:UIControlStateNormal];
   
    } else {
        [self.backButton setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
        [self.moreButton setImage:[UIImage imageNamed:@"information_more_white"] forState:UIControlStateNormal];
    }
    
    [CZHNavagationBarTranslucentTool czh_changeNavigationBarTransparencyWithViewController:self contentOffsetY:offsetY];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)moreOperation {
    CZHNormalController *viewController = [[CZHNormalController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
