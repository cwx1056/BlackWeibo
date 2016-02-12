//
//  HMTabBar.h
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/17/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMTabBar;

@protocol HMTabBarDelegate <NSObject>
-(void)tabBarDidClickAddButton:(HMTabBar *)tabBar;
@end

@interface HMTabBar : UITabBar
@property (nonatomic, weak) id<HMTabBarDelegate> customTabBarDelegate;
@end
