# CZHGradientNavigationController

![公司的项目.png](https://upload-images.jianshu.io/upload_images/6709174-4b217cb5f07b1f6f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

公司的项目，求支持，如果发现什么问题，可以留言反应，感激不尽

![QQHD.gif](http://upload-images.jianshu.io/upload_images/6709174-80376c0029dac965.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

功能实现很简单

1、首先创建一个父类的控制器，在viewWillAppear和viewWillDissAppear方法里面 如下:

```
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //导航栏的透明属性设为yes
    self.navigationController.navigationBar.translucent = YES;
    //背景图片和分割线清空
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
     //电池条颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
     //导航栏字体样式
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:CZHNavigationBarTranslucentTitleColor,NSForegroundColorAttributeName, CZHNavigationBarTitleFont,NSFontAttributeName,nil]];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
     //导航栏的透明属性设为no
    self.navigationController.navigationBar.translucent = NO;
   //背景图片和分割线设为默认
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:CZHNavigationBarNormalTitleColor,NSForegroundColorAttributeName, CZHNavigationBarTitleFont,NSFontAttributeName,nil]];
    
}

```

2、需要滚动渐变的控制器，先继承父类控制器,然后在viewWillAppear和viewWillDissAppear方法里面 ，如下

```
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //允许滚动
    self.tableView.scrollEnabled = YES;
    [self scrollViewDidScroll:self.tableView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //禁止滚动，以免走了这个方法后还会走scrollViewDidScroll方法
    self.tableView.scrollEnabled = NO;
}
```
3、在scrollViewDidScroll方法里面写判断，改变左右按钮的图片
```
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
    //改变导航栏文字样式，透明度
    [CZHNavagationBarTranslucentTool czh_changeNavigationBarTransparencyWithViewController:self contentOffsetY:offsetY];
}

```
4、在工具类里面，改变导航栏文字样式，透明度
```
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
```

5、大功告成就是介么的简单

6、创建了一个navigationController父类,一些操作可以在父类导航栏里面做

```
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
        
    //根据不同的控制器展示不同的按钮
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
        if ([lastVC isKindOfClass:[CZHNormalController class]]) {//如果当前控制器是，直接return接收代理做处理，然后接收通知方法，点击返回按钮做自己需要的操作
            return;
        }
    }

    [self popViewControllerAnimated:YES];
    
    
}
```

[简书地址](https://www.jianshu.com/p/e6009ae974d0)
[博客地址](http://blog.csdn.net/HurryUpCheng/article/details/78959719)
