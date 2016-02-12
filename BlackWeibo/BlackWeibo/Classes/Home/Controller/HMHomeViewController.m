//
//  HMHomeViewController.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/2/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "HMHomeViewController.h"
#import "HMTitleButton.h"
#import "HMPopMenu.h"
#import "UIBarButtonItem+Utilities.h"
#import "UIFont+Utilities.h"
#import "UIView+Utilities.h"
#import "UIImage+Utilities.h"

@interface HMHomeViewController () <HMPopMenuDelegate>

@end

@implementation HMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" highlightedImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" highlightedImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    // 设置导航栏中间的标题按钮
    HMTitleButton *titleButton = [[HMTitleButton alloc]init];
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    
    //设置图标
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    // 设置背景
    [titleButton setBackgroundImage:[UIImage resizedImage:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    
    titleButton.width = 100;
    titleButton.height = 35;
    
    // 监听按钮点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView = titleButton;
}

/**
 * 点击标题点击
 */
- (void)titleClick:(UIButton *)titleButton {
    /** 设置判断属性方法：
     * 1. 设置一个BOOL的成员变量
     * 2. 设置tag
     * 3. 利用图片来判断：
     */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.backgroundColor = [UIColor redColor];
    
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    HMPopMenu *menu = [HMPopMenu popMenuWithContentView:button];
    menu.delegate = self;
//    menu.dimBackground = YES;
    menu.arrowPosition = HMPopMenuArrowPositionCenter;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    [menu showInRect:CGRectMake(screenSize.width / 2 - 50, 64, 100, 100)];
}

#pragma mark - Pop Menu Delegate
- (void)popMenuDidDismissed:(HMPopMenu *)popMenu {
    HMTitleButton *titleButton = (HMTitleButton *)self.navigationItem.titleView;
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
}

#pragma mark - actions

- (void)friendSearch {
    NSLog(@"FriendSearch-------Home");
}

- (void)pop {
    NSLog(@"Pop------Home");
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"测试数据------%ld", indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *newVC = [[UIViewController alloc]init];
    newVC.title = @"新控制器";
    
    [self.navigationController pushViewController:newVC animated:YES];
}

@end
