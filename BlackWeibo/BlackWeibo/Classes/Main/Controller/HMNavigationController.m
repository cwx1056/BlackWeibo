//
//  HMNavigationController.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/2/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "HMNavigationController.h"
#import "UIImage+Utilities.h"

@interface HMNavigationController ()

@end

@implementation HMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

+ (void)initialize {
    [self setupNavigationBarTheme];
    
    [self setupBarButtonItemTheme];
}

+ (void)setupNavigationBarTheme{
    UINavigationBar *appearence = [UINavigationBar appearance];

    if ([[UIDevice currentDevice].systemVersion doubleValue] < 7.0) {
        [appearence setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
    
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    // 设置offset为0
    textAttributes[NSShadowAttributeName] = [[NSShadow alloc] init];
    [appearence setTitleTextAttributes:textAttributes];
}

+ (void)setupBarButtonItemTheme {
    //???: 通过appearcens对象能修好整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearence = [UIBarButtonItem appearance];
    
    // 设置各个状态的文字属性
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    textAttributes[NSShadowAttributeName] = [[NSShadow alloc] init];
    [appearence setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    
    NSMutableDictionary *highlightedTextAttributes = [NSMutableDictionary dictionaryWithDictionary:textAttributes];
    highlightedTextAttributes[NSForegroundColorAttributeName] = [UIColor redColor];
    [appearence setTitleTextAttributes:highlightedTextAttributes forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableTextAttributes = [NSMutableDictionary dictionaryWithDictionary:textAttributes];
    disableTextAttributes[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearence setTitleTextAttributes:disableTextAttributes forState:UIControlStateDisabled];
    
    // 设置背景
    // 为了让某个按钮的背景消失，可以设计一张完全透明的背景图片
    [appearence setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end
