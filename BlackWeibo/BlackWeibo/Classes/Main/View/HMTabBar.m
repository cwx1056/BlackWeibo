//
//  HMTabBar.m
//  BlackWeibo
//
//  Created by Wenxuan Chen on 12/17/15.
//  Copyright © 2015 Wenxuan Chen. All rights reserved.
//

#import "HMTabBar.h"
#import "UIView+Utilities.h"
#import "UIImage+Utilities.h"

@interface HMTabBar ()
@property (nonatomic, strong) UIButton *addButton;
@end

@implementation HMTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        // Setup add Weibo button
        UIButton *addButton = [[UIButton alloc] init];
        [addButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [addButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [addButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [addButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [addButton addTarget:self action:@selector(createWeibo) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:addButton];
        self.addButton = addButton;
    }
    
    return self;
}

// Create Weibo
- (void)createWeibo {
    [self.customTabBarDelegate tabBarDidClickAddButton:self];
}

// Set up subviews Frame
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self setupAddButtonFrame];
    [self setupTabBarButtonsFrame];
}

// Set up Add button frame
- (void) setupAddButtonFrame {
    self.addButton.size = self.addButton.currentBackgroundImage.size;
    
    self.addButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

// Set up TabBarButton Frame
- (void)setupTabBarButtonsFrame{
    int index = 0;
    CGFloat buttonWidth = self.bounds.size.width / (self.items.count + 1);
    CGFloat buttonHeight = self.bounds.size.height;
    
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        button.width = buttonWidth;
        button.height = buttonHeight;
        
        if (index >= 2) {
            button.x = buttonWidth * (index + 1);
        } else {
            button.x = buttonWidth * index;
        }
        button.y = 0;
        
        index++;
    }
}


@end
