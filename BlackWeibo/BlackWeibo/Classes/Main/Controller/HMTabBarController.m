//
//  HMTabBarController.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 11/30/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "HMTabBarController.h"
#import "UIImage+Utilities.h"
#import "HMNavigationController.h"
#import "HMHomeViewController.h"
#import "HMMessageViewController.h"
#import "HMDiscoverViewController.h"
#import "HMProfileViewController.h"
#import "HMComposeViewController.h"
#import "HMTabBar.h"

@interface HMTabBarController ()<UITabBarControllerDelegate, HMTabBarDelegate>

@end

@implementation HMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupAllChildViewControllers];
    [self setupCustomTabBar];
}

- (void)setupAllChildViewControllers {
    // Do any additional setup after loading the view.
    // Set TabBarController
    UIViewController *home = [[HMHomeViewController alloc]init];
    [self addChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    UIViewController *message = [[HMMessageViewController alloc]init];
    [self addChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    UIViewController *discover = [[HMDiscoverViewController alloc]init];
    [self addChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    UIViewController *me = [[HMProfileViewController alloc]init];
    [self addChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    childController.title = title;
    
    childController.tabBarItem.image = [UIImage imageWithName:imageName];
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    
    // Set Label Color
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    textAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    [childController.tabBarItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedTextAttributes = textAttributes;
    selectedTextAttributes[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childController.tabBarItem setTitleTextAttributes:selectedTextAttributes forState:UIControlStateHighlighted];
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) {
        //!!!: importent
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    childController.tabBarItem.selectedImage = selectedImage;
    
    HMNavigationController *nav = [[HMNavigationController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}

- (void)setupCustomTabBar {
    self.delegate = self;
    
    // 调整tabbar
    HMTabBar *customTabBar = [[HMTabBar alloc]init];
    NSLog(@"%@", customTabBar);
    customTabBar.backgroundImage = [UIImage imageWithName:@"tabbar_background"];
    customTabBar.delegate = self;
    
    [self setValue:customTabBar forKey:@"tabBar"];
    customTabBar.customTabBarDelegate = self;
    NSLog(@"%@", self.tabBar);
}

-(void)tabBarDidClickAddButton:(HMTabBar *)tabBar {
    HMComposeViewController *composeNav = [[HMComposeViewController alloc] init];
    HMNavigationController *navController = [[HMNavigationController alloc]initWithRootViewController:composeNav];
    
    [self presentViewController:navController animated:YES completion:nil];
}

@end
